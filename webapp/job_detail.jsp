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

 	<meta content="伯乐网" name="keywords"> 

 	<meta content="伯乐网" name="description"> 

 	<title>职位详情-伯乐网</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
	<!-- 最上栏 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/widgets.css">
	<!-- 侧栏  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_html.css"></head>
  
  <body>

 	<div id="lg_header">

 		<div id="lg_tbar">

 			<div class="inner">

 				<div class="lg_tbar_l">

 					<a rel="nofollow" href="${pageContext.request.contextPath}/login.jsp" class="lg_os" id="5600"    >进入企业版</a>
 				</div>

 				<ul class="lg_tbar_r">
 					<li>
 						<a href="${pageContext.request.contextPath}/user/findMyResume.action" id="5f00"     rel="nofollow">我的简历</a>
 					</li>
 					<li>
 						<a href="${pageContext.request.contextPath}/update_psw.jsp" class="bl" id="5g00"     rel="nofollow">设置</a>
 					</li>
 					<li>
 						<a href="javascript:;"  class="bl" id="5g00"     rel="nofollow">中文名</a>
 					</li>
 					<li>
 						<a href="${pageContext.request.contextPath}/login.jsp" class="bl" id="5g00"     rel="nofollow">退出</a>
 					</li>
 				</ul>

 			</div>

 		</div>

 		<div id="lg_tnav">

 			<div class="inner">

 				<ul class="lg_tnav_wrap">
 					<li>
 						<a href="${pageContext.request.contextPath}/positionRank.action" class="current" id="5i00"    >首页</a>
 					</li>

 				</ul>

 			</div>

 		</div>

 	</div>

 	<input type="hidden" id="serverTime" value="1471766809156"> 

 	<!-- 页面主体START --> 
 	<div class="container" id="container">
 		<div class="content_l fl">

 			<dl class="job_detail" id="job_detail">
 				<dt class="clearfix join_tc_icon">
 					<h1 title="web前端"> <em></em>
 						<div>
 							<span>${companyInfo.companyName }</span>
 							<span>${result.department }</span>
 							<span>招聘</span>
 						</div>
 						${result.position }
 					</h1>

 				</dt>

 				<dd class="job_request">
 					<p>
 						<span class="red">职位月薪：${result.salary }</span>
 						<br/> 
 						<span>职能分类：${result.classification }</span>
 						<br/> 
 						<span>所属部门：${result.department }</span>
 						<br/> 
 						<span>工作地点：${result.workplace }</span>
 						<br/> 
 						<span>实习经验：${result.experience }</span>
 						<br/> 
 						<span>学历要求：${result.eduRequest }</span>
 						<br/> 

 					</p>
 					<p class="publish_time">
 						<span>发布于：${result.releaseDate }</span>
 						<span>截止至：${result.deadline }</span>
 					</p>

 				</dd>
 				<dd class="job_bt">
 					<h3 class="description">公司描述</h3>
 					<div class="job_comp">
 						<img class="job_img" src="/pic/${companyInfo.logo }"> 
 						<span>公司名称：${companyInfo.companyName }</span>
 						<br/> 
 						<span>公司地址：${companyInfo.location }</span>
 						<br/> 
 						<span>所在行业：${companyInfo.industry }</span>
 						<br/> 
 						<span>公司前台固话:${companyInfo.phone }</span>
 						<br/> 
 						<span>公司简介:${companyInfo.companyInstruction }</span>
 						<br/> 
 					</div>

 					<h3 class="description">职位描述</h3>
 					<p>
						${result.statement }
 						<br></p>

 				</dd>



 				<dd class="jd_deliver">

 					
 					<a id="hreff" href="${pageContext.request.contextPath}/sendResume.action?position=${result.position}&company=${companyInfo.companyName}" title="投递简历" onclick="deliver()">投递简历</a>
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
