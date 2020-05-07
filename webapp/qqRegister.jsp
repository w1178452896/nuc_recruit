<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta name="description" content="求职招聘网站">
	<meta name="keywords" content="求职、招聘">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="css/sign.css">
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
			<li class="register-li">邮箱注册</li>
		</ul>
		<!-- 登录框左边 -->
		<div class="sign-left">
			<form id="registerForm" class="sign-form" action="${pageContext.request.contextPath}/qqRegister.action?action=register" method="post">
				<input type="email" class="ipt" placeholder="注册邮箱" name="mail" id="email"><br/>
				<i class="warn-tips"></i>
				<c:if test="${errors!=null}">
					<c:forEach item="${errors }" var="errors">
						<i class="errorTip show">${errors }</i><br>
					</c:forEach>
				</c:if>
				<input type="hidden" name="openId" value="${openId}">
				<input type="password" class="ipt" placeholder="密码" name="password" id="pwd"><br/>
				<i class="warn-tips">密码长度6-16位，包括符号、数组或字母</i>
				<input type="password" class="ipt" placeholder="确认密码" id="nPwd"><br/>
				<i class="warn-tips">两次密码不匹配</i>
				<input type="hidden" name="type" value="" id="iptType">
				<span class="register-type">
					<input type="button" class="ipt type findwork" value="找工作"><input type="button" class="ipt type" value="招人">
				</span><br/>
				<i class="warn-tips">请选择类型</i>
				<span class="agreement">
					<input type="checkbox" id="agree" checked>我已阅读并同意<a href="javascript:void(0)">《中北大学用户协议》</a>
				</span>
				<i class="warn-tips">请勾选同意协议</i>
				<input type="button" value="注册并绑定" class="ipt btn" id="register">
			</form>
		</div>
		<!-- 登录框右边 -->
		<div class="sign-right">
			<div>
				<p>已有中北大学账号：</p>
				
				<a href="javascript:void(0)" >
					<img alt="微博" src="${picUrl}">
				</a>

				<p class="account hasAccount"><a href="login.jsp"  class="gotoR">直接登录</a></p>
			</div>
		</div>
	</section>
	<footer>
		<p class="footer">——互联网求职机会——</p>
	</footer>

	<script type="text/javascript" src="js/register.js"></script>
  </body>
</html>
