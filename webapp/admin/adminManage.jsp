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
				var url = pp + "findAdmin.action?page="+page;
				$("#pageForm").attr("action",url);
				$("#pageForm").submit();
			});
			/*添加用户*/
			$("#addAdminBut").click(function(){
				var aa = pp+'insertAdmin.action';
				$("#addAdminForm").attr("action",aa);
				//alert($("#send").serialize());
				$("#addAdminForm").submit();
			});
			/*删除*/
			$("#delete").click(function(){
				var aa = pp+'deleteAdmin.action';
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
						<a href="${pageContext.request.contextPath}/findAdmin.action" class="current" id="5i01"    >管理员管理</a>
					</li>
<%--					<li>--%>
<%--						<a href="${pageContext.request.contextPath}/findAdmin.action" class="" id="5i01"    >企业管理</a>--%>
<%--					</li>--%>
					<li>
						<a href="${pageContext.request.contextPath}/positionManage.action" class="" id="5i01"    >职位管理</a>
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
						<th>账号</th>
						<th>创建时间</th>
						<th>真实姓名</th>
						<th>描述</th>
					</tr>
					</thead>
					<tbody id="result">
					<c:forEach items="${list}" var="admin">
						<tr>
							<td><input type="checkbox" name="chkItem" value="${admin.id}"/></td>
							<td>${admin.username}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${admin.createDate}" /></td>
							<td>${admin.realName}</td>
							<td>${admin.descri}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="page" style="margin-bottom: 40px"> &nbsp;&nbsp;
				<input type="checkbox" id="checkedAll">&nbsp;全选&nbsp;&nbsp;&nbsp;
				<a href="${basePath}findAdmin.action?page=1">首页</a>&nbsp;&nbsp;&nbsp;
				<a href="${basePath}findAdmin.action?page=${totalPage}">尾页</a>&nbsp;&nbsp;&nbsp;
				第${currentPage}/${totalPage}页&nbsp;&nbsp;&nbsp;去&nbsp;&nbsp;
				<input type="text" style="width: 40px;text-align:center;" id="page" value="">&nbsp;&nbsp;页
				<br><br>
				<ul class="nav nav-pills">
					<li  class="active"><a href="javascript:void(0)" id="sendInvite" data-toggle="modal" data-target="#addAdminDialog">添加</a></li>
					<li class="active"><a href="javascript:void(0)" id="delete">删除</a></li>
				</ul>
			</div>
		</form>

		<div class="modal fade" id="addAdminDialog" tabindex="-1" role="dialog" aria-labelledby="sendToEmail">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">添加管理员</h4>
					</div>
					<div class="modal-body">
						<form action="" method="post" id="addAdminForm" >
							<div class="form-group">
								<label for="username" class="control-label">用户名:</label>
								<input type="text" class="form-control" name="username" id="username">
							</div>
							<div class="form-group">
								<label for="password" class="control-label">密码:</label>
								<input type="text" class="form-control" name="password" id="password">
							</div>
							<div class="form-group">
								<label for="realName" class="control-label">真实姓名:</label>
								<input type="text" class="form-control" name="realName" id="realName"></input>
							</div>
							<div class="form-group">
								<label for="descri" class="control-label">描述:</label>
								<textarea class="form-control" name="descri" id="descri"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal" id="addAdminBut">添加</button>
					</div>
				</div>
			</div>
		</div>

		<form action="" method="post" id="pageForm"></form>
		<form action="" method="post" id="deleteForm">
			<input type="hidden" id="idsOfDelete" name="ids">
		</form>
	</div>

</body>

</html>
