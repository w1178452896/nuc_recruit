<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register_user_info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
    <form id="registerUserInfo" enctype="multipart/form-data" action="${pageContext.request.contextPath}/user/updateResume.action" method="post">
    name:<input type="text" name="name"/></br>
	sex:<input type="text" name="sex"/></br>
	native_place:<input type="text" name="nativePlace"/></br>
	birthday:<input type="text" name="dateStr"/></td>
	education:<input type="text" name="education"/></br>
	work_year:<input type="text" name="workYear"/></br>
	phone:<input type="text" name="phone"/></br>
	id_card:<input type="text" name="idCard"/></br>
	mail:<input type="text" name="mail"/></br>
	city:<input type="text" name="city"/></br>
	person_pic:</br>
	<c:if test="${resume.personPic!=null}">
		<img src="/pic/${resume.personPic}" width="100" height="100"/>
		<br/>
	</c:if>
	<input type="file" name="person_Pic">
	
	introduction:<input type="text" name="introduction"/></br>
	position_applied:<input type="text" name="positionApplied"/></br>
	excepted_city:<input type="text" name="exceptedCity"/></br>
	excepted_salary:<input type="text" name="exceptedSalary"/></br>
	postscript:<input type="text" name="postscript"/></br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
