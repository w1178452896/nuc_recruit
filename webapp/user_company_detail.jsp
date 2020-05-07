<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- meta -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/nav.css" rel="stylesheet">
	<link href="css/table.css" rel="stylesheet">
	<title>个人主页-中北大学校园招聘</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
	<!-- 最上栏 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/widgets.css">
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/tag.js"></script>
	<script src="js/modernizr.custom.97074.js"></script>
	<script>
		$(document).ready(function () {
			var pp = '${basePath}';
			// 全选
			$("#checkedAll").bind("click", function () {
				if ($("#checkedAll").is(':checked')) {
					$("[name = chkItem]:checkbox").attr("checked", true);
				} else {
					$("[name = chkItem]:checkbox").attr("checked", false);
				}
			});

			/*设置页数*/
			$("#page").blur(function(){
				var page = $(this).val();
				var url = pp + "findPositionResume.action?currentPage="+page+"&pid="+ pid +"&state=w";
				$("#pageForm").attr("action",url);
				$("#pageForm").submit();
			});
		});

	</script>
	</head>
  
  <body style="width: 100%;">
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
						<a href="javascript:;"  class="bl" id="5g00"     rel="nofollow">用户${mail}</a>
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
						<a href="${pageContext.request.contextPath}/positionRank.action" class="" id="5i00"    >首页</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/positionByCurrentUser.action" class="current" id="5i01"    >投递情况</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="main-content">
		<form action="" enctype="multipart/form-data" method="post">
			<div class="content">
				<table class="table table-hover ">
					<thead>
					<tr>
						<th></th>
						<th>公司名称</th>
						<th>职位名称</th>
						<th>投递情况</th>
						<th>投递日期</th>
					</tr>
					</thead>
					<tbody id="result">
					<c:forEach items="${resume.positionResume}" var="positionResume">
						<tr>
							<td><input type="checkbox" name="chkItem" value="${positionResume.uid}"/></td>
							<td><a href="${pageContext.request.contextPath}/user/findMyResume.action?type=1&id=${positionResume.uid}">${positionResume.name}</a></td>
							<td>${resume.position}</td>
							<td>${positionResume.sex}</td>
							<td>${positionResume.workYear}</td>
							<td>${positionResume.education}</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${positionResume.deliveryDate}" />
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="page" style="margin-bottom: 40px"> &nbsp;&nbsp;
				<input type="checkbox" id="checkedAll">&nbsp;全选&nbsp;&nbsp;&nbsp;
				<a href="${basePath}findPositionResume.action?currentPage=1&pid=${resume.pid}&state=w">首页</a>&nbsp;&nbsp;&nbsp;
				<a href="${basePath}findPositionResume.action?currentPage=${resume.totalPage}&pid=${resume.pid}&state=w">尾页</a>&nbsp;&nbsp;&nbsp;
				第${resume.currentPage}/${resume.totalPage}页&nbsp;&nbsp;&nbsp;去&nbsp;&nbsp;
				<input type="text" style="width: 40px;text-align:center;" id="page" value="">&nbsp;&nbsp;页
				<br><br>
			</div>
		</form>

	</div>

	<script type="text/javascript">
    window.global = window.global || {};
    require(['index/page/index/main']);
	</script>
	

</body>

</html>
