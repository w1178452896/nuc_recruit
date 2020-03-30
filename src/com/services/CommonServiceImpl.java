package com.services;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.List;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.activation.*;
import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.po.PersonalResume;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import sun.misc.BASE64Encoder;
import freemarker.template.Configuration;
import freemarker.template.Template;
@Service
public class CommonServiceImpl implements CommonService{
	@Override
	public synchronized void  zipFile(List<String> fileName) throws Exception {
		byte[] buffer = new byte[1024];
		String rootPath = this.getClass().getResource("/..").getFile().toString();
		rootPath = rootPath.substring(1, rootPath.length());
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(rootPath+"tmp/resume.zip"));
		File[] file = new File[fileName.size()];
		for (int i = 0; i < file.length; i++) {
			file[i] = new File(fileName.get(i));
		}
		for (int i = 0; i < file.length; i++) {
			FileInputStream in = new FileInputStream(file[i]);
			out.putNextEntry(new ZipEntry(file[i].getName()));
			int len;
			while((len = in.read(buffer))>0){
				out.write(buffer,0,len);
			}
			out.closeEntry();
			in.close();
			file[i].delete();
		}
		out.close();
	}

	@Override
	public void ExportResume(List<PersonalResume> list) throws Exception {
		String rootPath = getClass().getResource("/..").getFile().toString();
		rootPath = rootPath.substring(1, rootPath.length());		
		//读取照片


		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String realPath = req.getServletContext().getRealPath("/");
		list.forEach(personalResume -> {
			InputStream in = null;
			File file = new File(realPath+"upload"+File.separator+personalResume.getPersonPic());
			if(file.exists()){
				try {
					in = new FileInputStream(realPath+"upload"+File.separator+personalResume.getPersonPic());
					byte[] data = new byte[in.available()];
					in.read(data);
					in.close();
					BASE64Encoder base64 = new BASE64Encoder();
					personalResume.setPersonPic(base64.encode(data));//照片以二进制数据写入简历
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});

		@SuppressWarnings("deprecation")
		Configuration configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");
		configuration.setClassForTemplateLoading(this.getClass(), "/");
		Template t = configuration.getTemplate("resume.ftl");//加载模板
		Writer out = null;
		for (int i = 0; i < list.size(); i++) {
			File tmp = new File(rootPath+"tmp");
			if (!tmp.exists()) tmp.mkdir();
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(rootPath+"tmp/"+list.get(i).getName()+".doc")),"UTF-8"));
			t.process(list.get(i), out);
			out.close();
		}			
	}

	@Override
	public void DownloadFile(String fileName,HttpServletResponse response) throws Exception {
		 File file = new File(fileName);
		 if (file.exists()) {   
             InputStream ins = new FileInputStream(fileName);   
             BufferedInputStream bins = new BufferedInputStream(ins);// 放到缓冲流里面   
             OutputStream outs = response.getOutputStream();// 获取文件输出IO流   
             BufferedOutputStream bouts = new BufferedOutputStream(outs);   
             response.setContentType("application/x-download");// 设置response内容的类型   
             response.setHeader(   
                     "Content-disposition",   
                     "attachment;filename="  
                             + URLEncoder.encode("resume.zip", "UTF-8"));// 设置头部信息   
             int bytesRead = 0;   
             byte[] buffer = new byte[8192];   
             // 开始向网络传输文件流   
             while ((bytesRead = bins.read(buffer, 0, 8192)) != -1) {   
                 bouts.write(buffer, 0, bytesRead);   
             }   
             bouts.flush();
             ins.close();   
             bins.close();   
             outs.close();   
             bouts.close();   
             file.delete();
         } else {   
             //错误 
         }   	
	}

	@Override
	public boolean SendFileEmail(String to, String filePath, String subject,
			String message) throws Exception {
		//加载配置文件
		Properties properties = new Properties();
		String propertiesPath = this.getClass().getClassLoader().getResource("/").getPath()+"config/mail.properties";
		FileInputStream input;
		input = new FileInputStream(propertiesPath);
		properties.load(input);
		//设置邮件服务器
		Properties props = new Properties();
		props.put("mail.smtp.host", properties.getProperty("mail.host"));
		props.put("mail.smtp.starttls.enable","true");
	    props.put("mail.smtp.port", "25");            
	    props.put("mail.smtp.auth", "true"); 
		try {
			//获取默认Session
			 Session session = Session.getInstance(props,new Authenticator(){
				 @Override
				public PasswordAuthentication getPasswordAuthentication()
				    {
					    Properties properties = new Properties();
						String propertiesPath = this.getClass().getClassLoader().getResource("/").getPath()+"config/mail.properties";
						FileInputStream input = null;
						try {
							input = new FileInputStream(propertiesPath);
						} catch (FileNotFoundException e) {
							e.printStackTrace();
						}
						try {
							properties.load(input);
						} catch (IOException e) {
							e.printStackTrace();
						}
				     return new PasswordAuthentication(properties.getProperty("mail.username"), properties.getProperty("mail.password")); //发件人邮件用户名、密码
				    }
				   }
			);
			 //创建默认的MimeMessage对象
			MimeMessage mimeMessage = new MimeMessage(session);
			//设置头部信息
			mimeMessage.setFrom(new InternetAddress(properties.getProperty("mail.username")));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			mimeMessage.setSubject(subject);
			//创建消息部分
			BodyPart bodyPart = new MimeBodyPart();
			bodyPart.setText(message);
			//创建多重消息
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(bodyPart);
			//创建附件
			bodyPart = new MimeBodyPart();
			DataSource dataSouorce= new FileDataSource(filePath);
			bodyPart.setDataHandler(new DataHandler(dataSouorce));
			bodyPart.setFileName("resume.zip");
			//添加附件
			multipart.addBodyPart(bodyPart);
			//发送消息
			mimeMessage.setContent(multipart);
			Transport transport = session.getTransport("smtp");  
	        transport.connect(properties.getProperty("mail.host"),properties.getProperty("mail.password") );  
	        Transport.send(mimeMessage, mimeMessage.getRecipients(RecipientType.TO)); 
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean SendEmail(String to, String subject, String message)
			throws Exception {
		//加载配置文件
				Properties properties = new Properties();
				String propertiesPath = this.getClass().getClassLoader().getResource("/").getPath()+"config/mail.properties";
				FileInputStream input;
				input = new FileInputStream(propertiesPath);
				properties.load(input);
				//设置邮件服务器
				Properties props = new Properties();
				props.put("mail.smtp.host", properties.getProperty("mail.host"));
				props.put("mail.smtp.starttls.enable","true");
			    props.put("mail.smtp.port", "25");            
			    props.put("mail.smtp.auth", "true"); 
				try {
					//获取默认Session
					 Session session = Session.getInstance(props,new Authenticator(){
						 @Override
						public PasswordAuthentication getPasswordAuthentication()
						    {
							    Properties properties = new Properties();
								String propertiesPath = this.getClass().getClassLoader().getResource("/").getPath()+"config/mail.properties";
								FileInputStream input = null;
								try {
									input = new FileInputStream(propertiesPath);
								} catch (FileNotFoundException e) {
									e.printStackTrace();
								}
								try {
									properties.load(input);
								} catch (IOException e) {
									e.printStackTrace();
								}
						     return new PasswordAuthentication(properties.getProperty("mail.username"), properties.getProperty("mail.password")); //发件人邮件用户名、密码
						    }
						   }
					);
					 //创建默认的MimeMessage对象
					MimeMessage mimeMessage = new MimeMessage(session);
					//设置头部信息
					mimeMessage.setFrom(new InternetAddress(properties.getProperty("mail.username")));
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
					mimeMessage.setSubject(subject);
					mimeMessage.setText(message);
				    
					Transport transport = session.getTransport("smtp");  
			        transport.connect(properties.getProperty("mail.host"),properties.getProperty("mail.password") );  
			        Transport.send(mimeMessage, mimeMessage.getRecipients(RecipientType.TO)); 
					return true;
				} catch (Exception e) {
					return false;
				}
	}
}
