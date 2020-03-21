package com.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.po.Company;
import com.po.QqUser;
import com.po.User;
import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.oauth.Oauth;
import com.services.CompanyService;
import com.services.QqUserService;
import com.services.UserService;
import com.tools.ServiceException;
@Controller
public class LoginByQq {
	@Autowired
	QqUserService qqUserService;
	@Autowired
	UserService userService;
	@Autowired
	CompanyService companyService;
	private QqUser qqUserRest;
	/**
	 * QQ第三方登录
	 * 生成引导用户前往确认授权的页面地址
	 * @param request
	 * @param response
	 */
	@RequestMapping("loginByQq")
	public void login(HttpServletRequest request,HttpServletResponse response){
		 try {
			//此方法用来生成引导用户前往确认授权的页面地址,首先会到 qqconnectconfig.properties 文件中获取scope，若无，则只对接口get_user_info进行授权。
			response.sendRedirect(new Oauth().getAuthorizeURL(request));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (QQConnectException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 返回 AccessToken
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "afterlogin")
	public String  afterlogin(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		AccessToken	accessTokenObj = new AccessToken();
		String accessToken,openId = null;
		//根据用户确认授权后，互联后台跳转到的地址的url，获取到accessToken的相关信详细，如果第三方开发商的网站受到CSRF攻击，
		//则返回一个只包含默认值的AccessToken对象，第三方开发商在使用前一定要自行进行检测AccessToken对象是否可用,state的校验是ＳＤＫ自动完成的.
		try {
			accessTokenObj = new Oauth().getAccessTokenByRequest(request);
		} catch (QQConnectException e1) {
			e1.printStackTrace();
		}
		if(accessTokenObj.getAccessToken().equals("")){
			return "redirect:/loginByQq.action";
		}else{
			//获取accessToken
			accessToken = accessTokenObj.getAccessToken();
			try {
				//获取openId
				openId = new OpenID(accessToken).getUserOpenID();
			} catch (QQConnectException e) {
				e.printStackTrace();
			}
			//获取qq空间的信息bean对象
			UserInfo qzoneInfoObj = new UserInfo(accessToken,openId);
			//获取头像
			String picUrl = qzoneInfoObj.getUserInfo().getAvatar().getAvatarURL50();
			model.addAttribute("openId",openId);
			model.addAttribute("picUrl",picUrl);
			QqUser qqUser = new QqUser();
			qqUser.setOpenId(openId);
			//查看是否存在openid对应的用户
			qqUserRest = qqUserService.findQq(qqUser);
			if (qqUserRest!=null) {
				if(qqUserRest.getType().equals("1")){
					qqUserRest = qqUserService.findQqCompany(qqUser);
				}else{
					qqUserRest = qqUserService.findQqUser(qqUser);
				}
			}else{
				return "qqlogin";
			}
			return "redirect:/login.action?password="+qqUserRest.getPassword()+
					"&type="+qqUserRest.getType()+"&mail="+qqUserRest.getMail();
		}
	}
	
	/**
	 * QQ绑定账号
	 * @param model
	 * @param qqUser
	 * @param picUrl
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("binding")
	public String binding(Model model,QqUser qqUser,String picUrl) throws Exception{
		if (qqUser.getType().equals("0")){
			qqUserRest = qqUserService.findUser(qqUser);
		}else{
			qqUserRest = qqUserService.findCompany(qqUser);
		}
		if(qqUserRest!=null){
			qqUser.setId(qqUserRest.getId());
			qqUserService.inserQqUser(qqUser);
			return "redirect:/login.action?password="+qqUserRest.getPassword()+
					"&type="+qqUser.getType()+"&mail="+qqUserRest.getMail();
		}else{
			model.addAttribute("openId",qqUser.getOpenId());
			model.addAttribute("picUrl",picUrl);
			model.addAttribute("errors", "账号密码不匹配");
			return "qqlogin";
		}
	}
	/**
	 * 转到qqRegister页面
	 * @param model
	 * @param picUrl
	 * @param openId
	 * @return
	 */
	@RequestMapping("firstRegister")
	public String firstRegister(Model model,String picUrl,String openId){
		if(openId==null||openId==""){
			return "login";
		}
		model.addAttribute("picUrl",picUrl);
		model.addAttribute("openId",openId);
		return "qqRegister";
	}
	/**
	 * QQ登录并注册
	 * @param model
	 * @param request
	 * @param user
	 * @param type 0：用户 1：企业
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/qqRegister",method={RequestMethod.POST,RequestMethod.GET})
	public String qqRegister(Model model,HttpServletRequest request,User user,Company company,String openId,String picUrl,String type) throws Exception {
		model.addAttribute("picUrl", picUrl);
		model.addAttribute("openId", openId);
		if("0".equals(type)){
			//个人注册
			String action=request.getParameter("action");
			if("register".equals(action)){
				//注册
				List<User> userList=userService.findAllUser();
				Boolean isExisted=false;
				for(User u:userList){
					if(u.getMail().equals(user.getMail())){
						//账号是否存在
						isExisted=true;
						break;
					}
				}
				if(isExisted){
					//账号存在
					isExisted=false;
					model.addAttribute("errors", "账号已存在");
					return "qqRegister";
				}else{
					//账号不存在，允许注册
					userService.validate(user,type);
					user = userService.findUserByMail(user.getMail());
					if(user!=null){//注册成功则可以记录qq的openId
						QqUser qqUser = new QqUser();
						qqUser.setId(user.getUid());
						qqUser.setOpenId(openId);
						qqUser.setType(type);
						qqUserService.inserQqUser(qqUser);
					}
					return "register_active_tip";
				}
			}else{
				//激活
				String mail=request.getParameter("mail");
				String code=request.getParameter("validateCode");
				System.out.println(mail+" "+code);
				try{
					userService.activate(mail, code);
					return "register_active_success";
				}catch(ServiceException serviceException){
					model.addAttribute("errors",serviceException.getMessage());
					return "register_active_fall";
				}
			}
		}else{
			//公司注册
			String action=request.getParameter("action");
			System.out.print(company.getMail());
			if("register".equals(action)){
				//注册
				List<Company> companyList=companyService.findAllCompany();
				Boolean isExisted=false;
				for(Company c:companyList){
					if(c.getMail().equals(company.getMail())){
						//账号是否存在
						isExisted=true;
						break;
					}
				}
				if(isExisted){
					//账号存在
					model.addAttribute("error", "the username existed");
					return "qqRegister";
				}else{
					//账号不存在，允许注册
					companyService.validate(company,type);
					company = companyService.findCompanyByMail(company.getMail());
					if(user!=null){//注册成功则可以记录qq的openId
						QqUser qqUser = new QqUser();
						qqUser.setId(company.getCid());
						qqUser.setOpenId(openId);
						qqUser.setType(type);
						qqUserService.inserQqUser(qqUser);
					}
					return "register_active_tip";
				}
			}else{
				//激活
				String mail=request.getParameter("mail");
				String code=request.getParameter("validateCode");
				System.out.println(mail+" "+code);
				try{
					companyService.activate(mail, code);
					return "register_active_success";
				}catch(ServiceException serviceException){
					model.addAttribute("error",serviceException.getMessage());
					return "register_active_fall";
				}
			}
		}
	}
}
