<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- meta -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit">

	<title>修改密码-中北大学校园招聘</title>
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery
/jquery-1.4.min.js"></script>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
	<!-- 最上栏 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/widgets.css">
	<!-- 侧栏  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_html.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/aboutForm.css">
</head>

<body style="width: 100%;">
	<script src="${pageContext.request.contextPath}/js/xiugaimima.js" charset="utf-8"></script>
	<input type="hidden" value="" name="userid" id="userid">
	<input type="hidden" name="titleCity" id="titleCity" value="广州">
	<input type="hidden" name="seoBaseURL" id="seoBaseURL" value="">
	<div id="lg_header">
		<div id="lg_tbar">
			<div class="inner">
				<div class="lg_tbar_l">
					<a rel="nofollow" href="${pageContext.request.contextPath}/login.jsp" class="lg_os" id="5600">进入企业版</a>
				</div>
				<ul class="lg_tbar_r">
					<li><a href="${pageContext.request.contextPath}/user/findMyResume.action" id="5f00" rel="nofollow">我的简历</a>
					</li>
					<li><a href="${pageContext.request.contextPath}/update_psw.jsp" class="bl" id="5g00"
						rel="nofollow">设置</a>
					</li>
					<li><a href="javascript:;" class="bl" id="5g00" rel="nofollow">用户</a>
					</li>
					<li><a href="${pageContext.request.contextPath}/login.jsp" class="bl" id="5g00" rel="nofollow">退出</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="lg_tnav">
			<div class="inner">
				<ul class="lg_tnav_wrap">
					<li><a href="${pageContext.request.contextPath}/positionRank.action" class="current" id="5i00">首页</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="bigxiu">
		<div id="xiugaimima">
			<span>修改密码</span>
		</div>
		<form action="${pageContext.request.contextPath}/user/updatePassword.action" onsubmit="checkForm()">
			<table id="xiugai" border="0">
				<tr>
					<td><label for="jiumima">旧密码：</label></td>
					<td><input class="xiu1" type="password" id="jiumima" name="oldPassword" required/></td>
				</tr>
				<tr>
					<td><label for="xinmima">新密码：</label></td>
					<td><input class="xiu1" type="password" id="xinmima" name="newPassword1" required/></td>
				</tr>
				<tr>
					<td><label for="zaiqueren">再确认：</label></td>
					<td><input class="xiu1" type="password" id="zaiqueren" name="newPassword2" required/></td>
				</tr>
				<tr>
					<td><input class="xiu2" type="submit" name="" value="更改" /></td>
					<td><input class="xiu2" type="reset" name="" value="重置" /></td>
				</tr>
			</table>
		</form>
		<span id="zhu">注：密码须不少于6位，不多于16位！</span>
	</div>
	<div id="feedback-con" style="bottom: 80px;">
		<div class="pfb-pho-close">
			<div class="pfb-pho cust5"></div>
			<div class="pfb-close"></div>
		</div>
		<em class="error dn"><span></span> <i></i> </em>
		<form id="product-fb">
			<div class="pfb-txt">
				<textarea id="pfbTextarea" placeholder="" style="height: 0px;"></textarea>
				<div class="pfb-input-tip" id="pfbInputTip"></div>
			</div>
			<div class="pfb-email" style="height:38px;">
				<input type="text" name="email" placeholder=""> <span
					class="ensure"></span>
			</div>
			<div class="connect-gou-mei">
				<a id="popOnlineService" href="" target="_blank" rel="nofollow"></a>
			</div>
		</form>
	</div>
</body>
</html>
