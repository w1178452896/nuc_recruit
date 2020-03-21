package com.services;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.po.Company;
import com.tools.MD5Util;
import com.tools.SendMail;
import com.tools.ServiceException;
import com.mapper.CompanyMapper;
@Service("CompanyService")
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	CompanyMapper companyMapper;

	@Override
	public Company findCompanyByMail(String mail) throws Exception {
		// TODO Auto-generated method stub
		return companyMapper.findCompanyByMail(mail);
	}

	@Override
	public List<Company> findAllCompany() throws Exception {
		// TODO Auto-generated method stub
		return companyMapper.findAllCompany();
	}

	@Override
	public void addCompany(Company company) throws Exception {
		// TODO Auto-generated method stub
		companyMapper.addCompany(company);
		
	}

	@Override
	public void updatePassword(Company company) throws Exception {
		// TODO Auto-generated method stub
		companyMapper.updatePassword(company);
	}

	@Override
	public void updateState(Company company) throws Exception {
		// TODO Auto-generated method stub
		companyMapper.updateState(company);
	}

	@Override
	public void validate(Company company,String type) throws Exception {
		// TODO Auto-generated method stub
		String code=MD5Util.encode2hex(company.getMail());
		company.setState("1");
		company.setRegisterTime(new Date());
		company.setCode(code);//MD5加密
		companyMapper.addCompany(company);
		StringBuilder sb=new StringBuilder("点击下面链接激活账号，24小时内生效，" +
				"否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
		sb.append("<a href=\"http://localhost/newMiniResume/register.action?action=activate&mail=");
	    sb.append(company.getMail()); 
	    sb.append("&validateCode=");
	    sb.append(company.getCode());
	    sb.append("&type=");
	    sb.append(type);
	    sb.append("\">http://localhost/newMiniResume/register.action?action=activate&mail="); 
	    sb.append(company.getMail());
	    sb.append("&validateCode=");
	    sb.append(company.getCode());
	    sb.append("&type=");
	    sb.append(type);
	    sb.append("</a>");
	    //配置文件
	    Properties prop=new Properties();
	    String classPath = this.getClass().getClassLoader().getResource("/").getPath();
	    FileInputStream fin;
		try {
			fin = new FileInputStream(classPath+"config/mail.properties");
			prop.load(fin);
		} catch (FileNotFoundException e1) {
		} catch (IOException e) {
		}
		
		//邮箱配置信息
		String smtpHost=prop.getProperty("mail.host");
		String userName=prop.getProperty("mail.username");
		String password=prop.getProperty("mail.password");
		String messageType=prop.getProperty("mail.messageType");
		String messageText=sb.toString();
	    SendMail sendMail=new SendMail();
	    try {
			sendMail.sendMessage(smtpHost,userName,password,company.getMail(),messageText,messageType);
		} catch (MessagingException e) {
			System.err.println(e);
		}
		
	}

	@Override
	public void activate(String mail, String code) throws Exception {
		// TODO Auto-generated method stub
		Company company=companyMapper.findCompanyByMail(mail);
		if(company!=null){
			if("1".equals(company.getState())){
				Date currentTime=new Date();
				Date registerTime=company.getRegisterTime();
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(registerTime);
				calendar.add(Calendar.DATE, 1);
				Date lastActiveTime=calendar.getTime();
				if(currentTime.before(lastActiveTime)){
					if(company.getCode().equals(code)){
						company.setState("2");
						companyMapper.updateState(company);
					}else{
						throw new ServiceException("激活码不正确");
					}
				}else{
					throw new ServiceException("超过激活时间，请重新注册账号");
				}
			}else{
				throw new ServiceException("账号已激活，请重新登录");
			}
		}else{
			throw new ServiceException("用户不存在");
		}
	}
}
	

