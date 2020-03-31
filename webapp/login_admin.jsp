<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<title>登录</title>
	 <meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="description" content="求职招聘网站">
	<meta name="keywords" content="求职、招聘">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="css/sign_admin.css">
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<!--[if lt IE 9]> 
	<script> 
	   (function() {
	     if (!0) return;
	     var e = "abbr,article,aside,audio,canvas,datalist,details,dialog,eventsource,figure,footer,header,hgroup,mark,menu,meter,nav,output,progress,section,time,video".split(',');
	     var i= e.length;
	     while (i--){
	         document.createElement(e[i])
	     } 
	})() 
	</script>
	<![endif]-->
	<script type="text/javascript">
	</script>
  </head>
  
  <body>
    <header class="sign-header">
		<a alt="logo" href="javascript:void(0)">
			<img src="images/login-white.png" class="logo">
		</a>
	</header>
	<section class="sign-content">
		<!-- 登录框表头 -->
		<ul class="sign-nav">
			<li  id="type">管理员登录</li>
		</ul>
		<!-- 登录框左边 -->
		<div class="sign-left">
			<form id="loginForm" class="sign-form" action="${pageContext.request.contextPath}/adminLogin.action" method="post">
				<input type="email" class="ipt" placeholder="请输入邮箱或学号" id="email" name="username"><br/>
				<i class="warn-tips">请输入用户名</i>
				<input type="password" class="ipt" placeholder="请输入密码" id="pwd" name="password"><br/>
				<i class="warn-tips">请输入密码</i>
				<input type="text" placeholder="请输入验证码" class="ipt verify-code-ipt" name="" id="vertify">
				<span>
					<img src="" class="verify-code" id="vertifyCode">
					<img src="images/sign/icon-roate.jpg" class="icon-roate" id="reroate">
				</span>
				<i class="warn-tips">请输入验证码</i>
				<c:if test="${errors!=null}">
					<c:forEach item="${errors }" var="errors">
						<i class="errorTip show">${errors }</i>
					</c:forEach>
				</c:if>
				<input type="button" value="登录" class="ipt btn" id="login">
			</form>
			<form action="" method="post" id="reroateForm"></form>

		</div>

	</section>
	<footer>
		<p class="footer">——中北大学校园招聘——</p>
	</footer>
	
	<script type="text/javascript" src="js/login_admin.js"></script>
  </body>
</html>
