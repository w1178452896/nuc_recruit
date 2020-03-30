<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<title>注册</title>
	<meta name="description" content="求职招聘网站">
	<meta name="keywords" content="求职、招聘">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<style type="text/css">
		body,p{
			margin:0;
			padding:0;
		}
		.top{
			border-top:10px solid #f3c7c9;
			width: 100%;
		}
		.top img{
			display: block;
			width:231px;
			height: 42px;
			margin:0 auto;
			border:none;
		}
		.content{
			display: inline-block;
			font-size: 20px;
			width: 100%;
			color: #f3c7c9;
			margin: 50px auto;
			text-align: center;
		}
		.error{
			width: 220px;
			height: 220px;
		}
		.footer{
			margin-top:50px;
			text-align: center;
		}
	</style>
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
	<header>
		<p class="top">
<%--			<img src="images/top.png" class="top">--%>
		</p>
	</header>

	<section>
		<div class="content">
			<img src="images/success.jpg" class="error">
			<p>注册成功，请到邮箱查看激活链接O(∩_∩)O~</p>
		</div>
	</section>

	<footer>
		<p class="footer">——互联网求职机会——</p>
	</footer>

</body>
</html>
