<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- meta -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit">
	<meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/login.jsp">
	<title>修改成功！</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
	<!-- 最上栏 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/widgets.css">
	<!-- 侧栏  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_html.css">
	<!-- 主要排版 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/aboutForm.css">

	
  </head>
  
  <body style="width: 100%;">

	<div id="lg_header">

		<div id="lg_tbar">

			<div class="inner">

				<div class="lg_tbar_l">

					<a rel="nofollow" href="./login.html" class="lg_os" id="5600"    >进入企业版</a>
				</div>

				<ul class="lg_tbar_r">
					<li>
						<a href="./user_resume.html" id="5f00"     rel="nofollow">我的简历</a>
					</li>
					<li>
						<a href="./update_pwd.html" class="bl" id="5g00"     rel="nofollow">设置</a>
					</li>
					<li>
						<a href="javascript:;"  class="bl" id="5g00"     rel="nofollow">中文名</a>
					</li>
					<li>
						<a href="./login.html" class="bl" id="5g00"     rel="nofollow">退出</a>
					</li>
				</ul>

			</div>

		</div>

		<div id="lg_tnav">

			<div class="inner">

				<ul class="lg_tnav_wrap">
					<li>
						<a href="./user_index.jsp" class="current" id="5i00"    >首页</a>
					</li>
					<li>
						<a href="" id="5j00"    >公司</a>
					</li>

				</ul>

			</div>

		</div>

	</div>

	<input type="hidden" id="serverTime" value="1470275265811">

	<div id="success">

		<div id="chenggong">
			<img src="${pageContext.request.contextPath}/images/login-pink.png">
		</div>
		<div id="chenggong1">
			<span> 修改成功！</span>
		</div>	
		<div id="chenggong2">
			<span>将在3秒后跳转...</span>
		</div>

	</div>
</body>
</html>
