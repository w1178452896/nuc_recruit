package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;

import com.po.Admin;
import com.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.po.Company;
import com.po.CompanyInfo;
import com.po.User;
import com.services.CompanyInfoService;
import com.services.CompanyService;
import com.services.UserService;
import com.tools.ServiceException;

/**
 * 个人和企业登录注册,管理员登录
 * @author superJJ
 *
 */
@Controller
public class LoginAndRegisterController {
	
	@Autowired
	UserService userService;

	@Autowired
	CompanyService companyService;
	
	@Autowired
	CompanyInfoService companyInfoService;

	@Autowired
	AdminService adminService;
		
	
	
	/**
	 * 注册
	 * @param model
	 * @param request
	 * @param user
	 * @param type 0：用户 1：企业
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/register",method={RequestMethod.POST,RequestMethod.GET})
	public String userRegister(Model model,HttpServletRequest request,User user,Company company,String type) throws Exception {
		if("0".equals(type)){
			//个人注册\
		
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
					return "register";
				}else{
					//账号不存在，允许注册
					userService.validate(user,type);
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
					return "register";
				}else{
					//账号不存在，允许注册
					companyService.validate(company,type);
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
	
	/**
	 * 登录
	 * @param model
	 * @param mail
	 * @param password
	 * @param type 0：用户 1：企业
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login",method={RequestMethod.POST,RequestMethod.GET})
	public String userLogin(Model model,String mail,String password,String type,HttpSession session) throws Exception {
		if("0".equals(type)){
			//个人登录
			List<User> userList=userService.findAllUser();
			boolean isMail=mail.contains("@");
			for(User user:userList){
				//邮箱登录
				boolean login=false;
				if (isMail){
					if(user.getMail().equals(mail)&&user.getPassword().equals(password)){
						login=true;
					}
				}else{ //学号登录
					if(mail.equals(user.getSno())&&user.getPassword().equals(password)){
						login=true;
					}
				}
				if (login){
					session.setAttribute("uid", user.getUid());
					if("1".equals(user.getState())){
						//未激活
						//request.getRequestDispatcher("register_active_tip.jsp").forward(request, response);
						return "register_active_tip";
					}else if("2".equals(user.getState())){
						//已激活，未填写信息
						//request.getRequestDispatcher("register_user_info.jsp").forward(request, response);
						model.addAttribute("mail", mail);
						return "user_resume_new";
					}else if("3".equals(user.getState())){
						//激活并已填写信息
						model.addAttribute("mail", mail);
						//request.getRequestDispatcher("user_index.jsp").forward(request, response);
						return "user_index_redirect";
					}
				}

			}
			//System.out.println("adfhdjkhgt");
			//response.getWriter().print("errors");
			model.addAttribute("errors", "账号密码不匹配");
			//登录失败
			//return "login_fail";
			//登录失败
			return "login";

		}else{
			//企业登录
			List<Company> companyList=companyService.findAllCompany();
			for(Company company:companyList){
				if(company.getMail().equals(mail)&&company.getPassword().equals(password)){
					session.setAttribute("cid", company.getCid());
					int ciid=company.getCid();
					CompanyInfo companyInfo=companyInfoService.findCompanyInfo(ciid);
					if("1".equals(company.getState())){
						//未激活
						//request.getRequestDispatcher("register_active_tip.jsp").forward(request, response);
						return "register_active_tip";
					}else if("2".equals(company.getState())){
						//已激活，未填写信息
						//request.getRequestDispatcher("register_user_info.jsp").forward(request, response);
						model.addAttribute("mail", mail);
						return "register_enterprise_info";
					}else if("3".equals(company.getState())){
						//激活并已填写信息
						//request.getRequestDispatcher("user_index.jsp").forward(request, response);
						session.setAttribute("companyname",companyInfo.getCompanyName());
						model.addAttribute("mail", mail);
						return "edit_job";
					}
				}
			}
			//request.getRequestDispatcher("").forward(request, response);
			model.addAttribute("errors", "账号密码不匹配");
			return "login";
		}
	}
	

	/**
	 * 登出
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/loginOut",method={RequestMethod.POST,RequestMethod.GET})
	public String loginOut(HttpSession session) throws Exception {
		session.invalidate();//销毁session
		return "login";
	}

	/**
	 * 管理员登录页面
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin")
	public String adminLoginPage(HttpSession session) throws Exception {
		return "login_admin";
	}
	/**
	 * 管理员登录页面
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/adminLogin")
	public String adminLogin(Model model, HttpSession session, @NotNull String username,@NotNull  String password) throws Exception {
		Admin admin = adminService.findByUserName(username);
		if (admin!=null){
			if(password.equals(admin.getPassword())){
				model.addAttribute("errors", "登录成功！");
				session.setAttribute("aName",admin.getUsername());
				return "admin/usermanage";
			}else{
				model.addAttribute("errors", "用户名密码不匹配！");
			}
		}else {
			model.addAttribute("errors", "用户名不存在！");
		}
		return "login_admin";
	}

}
