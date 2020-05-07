package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class loginInterceptor implements HandlerInterceptor {
	//进入 Handler方法之前执行
	//用于身份认证、身份授权
	//比如身份认证，如果认证不通过表示当前用户没有登陆，需要此方法拦截不再向下执行
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("LoginInterceptor1...preHandle");
		String url = request.getRequestURI();
		System.out.println("---------"+url);
		//如果是登录请求，不拦截
		if(url.indexOf("login.action")>0) {
			return true;
		}
		if(url.indexOf("adminLogin.action")>0) {
			return true;
		}
		if(url.indexOf("admin.action")>0) {
			return true;
		}
		if(url.indexOf("register.action")>0){
			return true;
		}
		if(url.indexOf("loginByQq.action")>0){
			return true;
		}
		if(url.indexOf("afterlogin.action")>0){
			return true;
		}
		if(url.indexOf("qqRegister.action")>0){
			return true;
		}
		if(url.indexOf("firstRegister.action")>0){
			return true;
		}
		if(url.indexOf("createCode.action")>0){
			return true;
		}
		if(url.indexOf("getcode.action")>0){
			return true;
		}
		if(url.indexOf("binding.action")>0){
			return true;
		}
		//取得session中的数据
		HttpSession session = request.getSession();
		Object name = session.getAttribute("uid");
		Object name2 = session.getAttribute("cid");
		Object aName = session.getAttribute("aName");
		//如果用户已经登录，不拦截
		if(name != null||name2!=null||aName!=null) {
			return true;
		}
		//执行这里表示用户身份需要认证，跳转登陆页面,此处重定向有错误，必须请求转发
//		response.sendRedirect(request.getContextPath()+"/WEB-INF/jsp/login.jsp");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		
		return false;
		
	}

	//进入Handler方法之后，返回modelAndView之前执行
	//应用场景从modelAndView出发：将公用的模型数据(比如菜单导航)在这里传到视图，也可以在这里统一指定视图
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("LoginInterceptor...postHandle");
		
	}

	//执行Handler完成执行此方法
	//应用场景：统一异常处理，统一日志处理
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("LoginInterceptor...afterCompletion");
	}
}
