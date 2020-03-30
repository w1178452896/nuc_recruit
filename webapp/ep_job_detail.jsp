<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <!-- saved from url=(0067)http://www.lagou.com/jobs/2227300.jsp?source=home_rec&i=home_rec-0 --> 
 <html>
 <head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
 	<!-- meta --> 
 	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
 	<meta name="renderer" content="webkit"> 

 	<meta content="伯乐网" name="keywords"> 

 	<meta content="伯乐网" name="description"> 

 	<title>职位详情-伯乐网</title>

 	<link rel="stylesheet" type="text/css" href="./css/layout.css"> 
 	<link rel="stylesheet" type="text/css" href="./css/widgets.css"> 
 	<link rel="stylesheet" type="text/css" href="./css/main_html.css"> 
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="./css/nav.css">

    <script src="../js/jquery-1.11.3.js"></script>
 <body>
 	<header>
 		<!--导航条上方欢迎和退出--> 
 		<div class="head-contain">
 			<div class="head">
 				<span class="head-left"> <strong></strong>
 				</span>
 				<span class="head-right">你好，${sessionScope.companyname}</span>
 				<a href="${pageContext.request.contextPath}/loginOut.action" class="head-right" >退出</a>
 				<a href="${pageContext.request.contextPath}/companyInfoFind.action" class="head-right " >编辑信息</a>
 				<!--清除浮动--> 
 				<span class="clean"></span>
 			</div>
 		</div>

 		<!--导航条--> 
 		<div class="nav-contain">
 			<div class="nav">
 				<ul>
 					<!--logo--> 
 					<li class="logo">
<%-- 						<img src="images/login.png"></li>--%>
 					<!--导航--> 
 					<li class="nav-right">
 						<a href="${basePath}findPositionByCid.action?state=1&currentPage=1" >简历管理</a>
 					</li>
 					<li class="nav-right">
 						<a href="${pageContext.request.contextPath}/findOnPosition.action?currentPage=1" style="background-color: #337AB7">职位管理</a>
 					</li>
 					<li class="nav-right">
 						<a href="search_resume.jsp" >找简历</a>
 					</li>
 					<li class="nav-right" >
 						<a href="edit_job.jsp" >发职位</a>
 					</li>
 					<span class="clean"></span>
 				</ul>
 			</div>
 		</div>

 	</header>

 	<input type="hidden" id="serverTime" value="1471766809156"> 

 	<!-- 页面主体START --> 
 	<div class="container" id="container">
 		<div class="content_l fl">

 			<dl class="job_detail" id="job_detail">
 				<dt class="clearfix join_tc_icon">
 					<h1 title="web前端"> <em></em>
 						<div>
 							<span>${position.department}</span>
 						</div>
 						${position.position}
 					</h1>

 				</dt>
   
 				<dd class="job_request">
 					<p>
 						<span class="red">职位月薪：${salary}</span>
 						<br/> 
 						<span>所属部门：${position.department}</span>
 						<br/> 
 						<span>职位名称：${position.position}</span>
 						<br/> 
 						<span>职能分类：${position.classification}</span>
 						<br/> 
 						<span>工作地点：${position.workplace}</span>
 						<br/> 
 						<span>实习经验：${experience}</span>
 						<br/> 
 						<span>学历要求：${eduRequest}</span>
 						<br/> 

 					</p>
 					<p class="publish_time">
 						<span>发布于：${releaseDate}</span>
 						<br/>
 						<span>截止至：${deadline}</span>
 					</p>

 				</dd>
 				<dd class="job_bt">

 					<h3 class="description">职位描述</h3>
 					<p>

 						${position.statement}<br/></p>

 				</dd>

 			</dl>

 		</div>

 	</div>
 	<script type="text/javascript">
 	function deliver() {
 	var hreff=document.getElementById('hreff');
 	var r=confirm("确定投递简历吗");
 	if (r==true)
    {
    alert("提交成功!");
    }
  else
    {
 	hreff.href=location.href;	
    }
 	}
 </script>
 </body>
 </html>