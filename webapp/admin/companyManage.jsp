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
				var url = pp + "userManage.action?page="+page;
				$("#pageForm").attr("action",url);
				$("#pageForm").submit();
			});
			/*发送导入模板*/
			$("#submitFile").click(function(){
				var aa = pp+'importUser.action';
				$("#sendUserFile").attr("action",aa);
				//alert($("#send").serialize());
				$("#sendUserFile").submit();
			});
			/*导出导入模板*/
			$("#template").click(function(){
				var aa = pp+'template.action';
				window.location.href =aa;
			});
			/*导出用户就业情况*/
			$("#exportEmployment").click(function(){
				var aa = pp+'exportEmployment.action';
				window.location.href =aa;
			});

		});
		function keySearch(searchInput) {
			var url = pp + "userManage.action?keys="+searchInput.value;
			location.href = url;
		}
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
						<a href="${pageContext.request.contextPath}/userManage.action" class="current" id="5i00"    >学生管理</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/userManage.action" class="" id="5i01"    >管理员管理</a>
					</li>
<%--					<li>--%>
<%--						<a href="${pageContext.request.contextPath}/userManage.action" class="" id="5i01"    >企业管理</a>--%>
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
				<div style="width:200px;padding: 0px;margin: 0px 0px 10px"><input value="${keys}" onchange="keySearch(this)" placeholder="关键字查找" type="text"  class="form-control" id="searchInput"></div>
				<table class="table table-hover ">
					<thead>
					<tr>
						<th></th>
						<th>学生名称</th>
						<th>学号</th>
						<th>籍贯</th>
						<th>手机号码</th>
						<th>邮箱</th>
					</tr>
					</thead>
					<tbody id="result">
					<c:forEach items="${list}" var="student">
						<tr>
							<td><input type="checkbox" name="chkItem" value="${student.uid}"/></td>
							<td>${student.name}</td>
							<td>${student.sno}</td>
							<td>${student.nativePlace}</td>
							<td>${student.phone}</td>
							<td>${student.mail}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="page" style="margin-bottom: 40px"> &nbsp;&nbsp;
				<input type="checkbox" id="checkedAll">&nbsp;全选&nbsp;&nbsp;&nbsp;
				<a href="${basePath}userManage.action?page=1">首页</a>&nbsp;&nbsp;&nbsp;
				<a href="${basePath}userManage.action?page=${totalPage}">尾页</a>&nbsp;&nbsp;&nbsp;
				第${currentPage}/${totalPage}页&nbsp;&nbsp;&nbsp;去&nbsp;&nbsp;
				<input type="text" style="width: 40px;text-align:center;" id="page" value="">&nbsp;&nbsp;页
				<br><br>
				<ul class="nav nav-pills">
					<li  class="active"><a href="javascript:void(0)"  data-toggle="modal" id="template">导出下载模板</a></li>
					<li  class="active"><a href="javascript:void(0)" id="sendInvite" data-toggle="modal" data-target="#importUserDialog">导入用户</a></li>
					<li class="active"><a href="javascript:void(0)" id="exportEmployment">导出就业信息</a></li>
				</ul>
			</div>
		</form>

		<div class="modal fade" id="importUserDialog" tabindex="-1" role="dialog" aria-labelledby="sendToEmail">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">导入用户</h4>
					</div>
					<div class="modal-body">
						<form action="" method="post" id="sendUserFile" enctype="multipart/form-data">
							<div class="form-group">
								<label for="recipient-name" class="control-label">请选择文件:</label>
								<input type="file" name="file" id="importUser"/>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal" id="submitFile">发送</button>
					</div>
				</div>
			</div>
		</div>

		<form action="" method="post" id="pageForm"></form>
	</div>

</body>

</html>
