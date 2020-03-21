<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>职位管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/nav.css">
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <script src="js/jquery-1.11.3.js"></script>
    <script>
        $(document).ready(function () {
            var basePath = '${basePath}';
            // 全选
            $("#checkedAll").bind("click", function () {
                if ($("#checkedAll").is(':checked')) {
                    $("[name = chkItem]:checkbox").prop("checked", true);
                } else {
                    $("[name = chkItem]:checkbox").prop("checked", false);
                }
            });
            $("#num").on('blur',function(){
                var page = $(this).val();
                var url = basePath+"findPositionByCid.action?state=1&department=${page.position.department}&currentPage="+page;
                $("#pageForm").attr("action",url);
                $("#pageForm").submit();
            });
        });

    </script>
</head>
<body>

<!--正在招聘页面-->
<header>
    <!--导航条上方欢迎和退出-->
    <div class="head-contain">
        <div class="head">
            <span class="head-left"><strong>东软微简历项目</strong></span>
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
                <li class="logo"><img src="login.png"></li>
                <!--导航-->
                <li class="nav-right"><a href="${basePath}findPositionByCid.action?state=1&currentPage=1" style="background-color: #337AB7" >简历管理</a></li>
                <li class="nav-right"><a href="${pageContext.request.contextPath}/findOnPosition.action?currentPage=1" >职位管理</a></li>
                <li class="nav-right"><a href="search_resume.jsp" >找简历</a></li>
                <li class="nav-right" ><a href="edit_job.jsp" >发职位</a></li>
                <span class="clean"></span>
            </ul>
        </div>
    </div>

</header>
<div class="main-content">
    <div class="bar">
        <ul class="nav nav-pills">
            <li  class="active"><a href="${basePath}findPositionByCid.action?state=1&currentPage=1" target="_self">正在招聘</a></li>
            <li><a href="${basePath}findPositionByCid.action?state=2&currentPage=1" target="_self">已经结束</a></li>
            <li><a href="${basePath}findPositionByCid.action?state=&currentPage=1" target="_self">全部职位</a></li>
        </ul>
    </div>
    <form class="form-inline classify">
	  <div class="form-group">
	    <label for="">所属部门</label>
	    <input action="${basePath}findPositionByCid.action" type="text" class="form-control" placeholder="所属部门" name="department" value="${page.position.department}">
	  </div>
       <input type="hidden"  name="state" value="1"/>
       <input type="hidden"  name="currentPage" value="1"/>
	  <button type="submit" class="btn btn-default">查看职位</button>
	</form>
    <form action="" enctype="multipart/form-data" method="post">
    <div class="content">
        <table class="table table-hover ">
            <thead>
            <tr>
                 <th></th>
                <th>职位名称</th>
                <th>职能分类</th>
                <th>所属部门</th>
                <th>浏览次数</th>
                <th>发布时间</th>
                <th>结束时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="list">
                
            
            <tr>
                <td></a></td>
                <td><a href="${basePath}findPositionResume.action?currentPage=1&pid=${list.pid}&state=w">${list.position.position}</a></td>
                <td>${list.position.classification}</td>
                <td>${list.position.department}</td>
                <td>${list.position.browsingNumber}</td>
                <td>
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${list.position.releaseDate}"/>
                </td>
                <td>
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${list.position.deadline}"/>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="page">
        &nbsp;&nbsp; 
        <a href="${basePath}findPositionByCid.action?state=1&currentPage=1&department=${page.position.department}">首页</a>&nbsp;&nbsp;&nbsp;
        <a href="${basePath}findPositionByCid.action?state=1&currentPage=${page.totalPage}&department=${page.position.department}">尾页</a>&nbsp;&nbsp;&nbsp;
        第<span>${page.currentPage}</span>/<span>${page.totalPage}</span>页&nbsp;&nbsp;&nbsp;
        去<input type="text" style="width: 40px;text-align:center;" id="num">&nbsp;&nbsp;页
        <br><br>
    </div>
    </form>
</div>
    <!-- 分页 -->
    <form action="" method="post" id="pageForm"></form> 
</body>
</html>