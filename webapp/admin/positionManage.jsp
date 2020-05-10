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
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/table.css" rel="stylesheet">
	<title>后台管理-中北大学校园招聘</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
	<!-- 最上栏 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/widgets.css">
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/tag.js"></script>
	<script src="${pageContext.request.contextPath}/js/modernizr.custom.97074.js"></script>
	<script>
		var pp = '${basePath}';
		$(document).ready(function () {

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
				var url = pp + "positionManage.action?page="+page;
				$("#pageForm").attr("action",url);
				$("#pageForm").submit();
			});
			/*删除*/
			$("#deleteBtn").click(function(){
				var aa = pp+'deletePositionByIds.action';
				var idArr = [];
				$("#result input[type=checkbox]:checked").each(function(){
					idArr.push($(this).val());
				});
				$("#idsOfDelete").val(idArr);
				$("#deleteForm").attr("action",aa);
				//alert($("#send").serialize());
				$("#deleteForm").submit();
			});

		});
		// function keySearch(searchInput) {
		// 	var url = pp + "userManage.action?keys="+searchInput.value;
		// 	location.href = url;
		// }
	</script>
	</head>
  
  <body style="width: 100%;">
	<div id="lg_header">
		<div id="lg_tbar">
			<div class="inner">
				<ul class="lg_tbar_r">
					<li>
						<a href="${pageContext.request.contextPath}/update_psw.jsp"  id="5g00"     rel="nofollow">设置</a>
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
						<a href="${pageContext.request.contextPath}/userManage.action" class="" id="5i00"    >学生管理</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/findAdmin.action" class="" id="5i01"    >管理员管理</a>
					</li>
<%--					<li>--%>
<%--						<a href="${pageContext.request.contextPath}/userManage.action" class="" id="5i01"    >企业管理</a>--%>
<%--					</li>--%>
					<li>
						<a href="${pageContext.request.contextPath}/positionManage.action" class="current" id="5i01"    >职位管理</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="main-content">
		<form action="" enctype="multipart/form-data" method="post">
			<div class="content">
<%--				<div style="width:200px;padding: 0px;margin: 0px 0px 10px"><input value="${keys}" onchange="keySearch(this)" placeholder="关键字查找" type="text"  class="form-control" id="searchInput"></div>--%>
				<table class="table table-hover ">
					<thead>
					<tr>
						<th></th>
						<th>职位名称</th>
						<th>公司名称</th>
						<th>公司类型</th>
						<th>工作地</th>
						<th>职位类别</th>
						<th>部门名称</th>
						<th>薪资</th>
						<th>实习经历</th>
						<th>学历要求</th>
						<th>邮箱</th>
						<th>发布时间</th>
						<th>截止时间</th>
						<th>描述</th>
					</tr>
					</thead>
					<tbody id="result">
					<c:forEach items="${list}" var="company">
						<tr>
							<td><input type="checkbox" name="chkItem" value="${company.position.pid}"/></td>
							<td>${company.position.position}</td>
							<td>${company.companyName}</td>
							<td>${company.industry}</td>
							<td>${company.position.workplace}</td>
							<td>${company.position.classification}</td>
							<td>${company.position.department}</td>
							<td>${company.position.salary}</td>
							<td>${company.position.experience}</td>
							<td>${company.position.eduRequest}</td>
							<td>${company.position.email}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${company.position.releaseDate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${company.position.deadline}" /></td>
							<td>${company.position.statement}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="page" style="margin-bottom: 40px"> &nbsp;&nbsp;
				<input type="checkbox" id="checkedAll">&nbsp;全选&nbsp;&nbsp;&nbsp;
				<a href="${basePath}positionManage.action?page=1">首页</a>&nbsp;&nbsp;&nbsp;
				<a href="${basePath}positionManage.action?page=${totalPage}">尾页</a>&nbsp;&nbsp;&nbsp;
				第${currentPage}/${totalPage}页&nbsp;&nbsp;&nbsp;去&nbsp;&nbsp;
				<input type="text" style="width: 40px;text-align:center;" id="page" value="">&nbsp;&nbsp;页
				<br><br>
				<ul class="nav nav-pills">
					<li  class="active"><a href="javascript:void(0)"  data-toggle="modal" id="deleteBtn">删除</a></li>
				</ul>
			</div>
		</form>


		<form action="" method="post" id="pageForm"></form>
		<form action="" method="post" id="deleteForm">
			<input type="hidden" id="idsOfDelete" name="ids">
		</form>
	</div>

</body>

</html>
