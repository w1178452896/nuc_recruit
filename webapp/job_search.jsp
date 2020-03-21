<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit">
	<meta content="伯乐网" name="keywords">
	<meta content="伯乐网" name="description">
	<title>职位搜索-伯乐网</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
	<!-- 最上栏 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/widgets.css">
	<!-- 侧栏  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_html.css">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/radiocheck.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lazyload-min.js"></script>
	<script src="js/jPages.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jPages.css">
</head>
  
  <body style="width: 100%;">

<input type="hidden" id="hidkw" value="${s1 }" />
<input type="hidden" id="hidct" value="${s2 }" />
<input type="hidden" id="hidwy" value="${s3 }" />
<input type="hidden" id="hided" value="${s4 }" />
<input type="hidden" id="hidmn" value="${s5 }" />
<script type="text/javascript">
console.log($("#hidkw").val());
console.log("xxxx");
</script>
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

	<!-- 页面主体START -->
	<form action="${pageContext.request.contextPath}/findPositionByCondition.action" method="post">
		<div id="content-container">

			<div class="search-wrapper">
				<div id="searchBar" class="search-bar">
					<div class="input-wrapper">
						<input name="position" type="text" id="keyword" autocomplete="off" maxlength="64" placeholder="搜索职位名称" value="${input }" class="inputt">
						<input class="submitt" type="submit" id="submit" value="搜索"></div>

				</div>
			</div>

			<div id="main-container">
				<div id="positionHead" class="">
					<ul id="filterBox" class="filter-wrapper">
						<div class="details" id="filterCollapse">
							<div class="has-more">
								<div class="choose-detail">
									<li class="multi-chosen">

										<div class="current-handle-position">
											<span class="title">工作地点：</span>
											<input readonly="readonly" class="mm" type="text" name="workplace" id="city" value="全国"  />
										</div>

									</li>

								</div>
							</div>

							<li class="multi-chosen">
								<span class="title">工作经验：</span>
								<input class=" radiocheck" type="radio" value="1"  id="Work_year1" name="experience" />
								<label class=" full small right" for="Work_year1">应届毕业生</label>
								<input class=" radiocheck" type="radio" value="2"  id="Work_year2" name="experience" />
								<label class=" full small right" for="Work_year2">3年及以下</label>
								<input class=" radiocheck" type="radio" value="3"  id="Work_year3" name="experience" />
								<label class=" full small right" for="Work_year3">3-5年</label>
								<input class=" radiocheck" type="radio" value="4"  id="Work_year4" name="experience" />
								<label class=" full small right" for="Work_year4">5-10年</label>
								<input class=" radiocheck" type="radio" value="5"  id="Work_year5" name="experience" />
								<label class=" full small right" for="Work_year5">10年以上</label>
								<input class=" radiocheck" type="radio" value="6"  id="Work_year6" name="experience" />
								<label class=" full small right" for="Work_year6">不要求</label>
							</li>

							<li class="multi-chosen">
								<span class="title">学历要求：</span>
								<input class=" radiocheck" type="radio" value="1"  id="education1" name="eduRequest" />
								<label class=" full small right" for="education1">大专</label>
								<input class=" radiocheck" type="radio" value="2"  id="education2" name="eduRequest" />
								<label class=" full small right" for="education2">本科</label>
								<input class=" radiocheck" type="radio" value="3"  id="education3" name="eduRequest" />
								<label class=" full small right" for="education3">研究生</label>
								<input class=" radiocheck" type="radio" value="4"  id="education4" name="eduRequest" />
								<label class=" full small right" for="education4">硕士</label>
								<input class=" radiocheck" type="radio" value="5"  id="education5" name="eduRequest" />
								<label class=" full small right" for="education5">博士</label>
								<input class=" radiocheck" type="radio" value="6"  id="education6" name="eduRequest" />
								<label class=" full small right" for="education6">其他</label>
							</li>

							<li class="multi-chosen">
								<span class="title">薪水要求：</span>
								<input class=" radiocheck" type="radio" value="1"  id="salary1" name="salary" />
								<label class=" full small right" for="salary1">不限</label>
								<input class=" radiocheck" type="radio" value="2"  id="salary2" name="salary" />
								<label class=" full small right" for="salary2">5k以下</label>
								<input class=" radiocheck" type="radio" value="3"  id="salary3" name="salary" />
								<label class=" full small right" for="salary3">5k-10k</label>
								<input class=" radiocheck" type="radio" value="4"  id="salary4" name="salary" />
								<label class=" full small right" for="salary4">10k-15k</label>
								<input class=" radiocheck" type="radio" value="5"  id="salary5" name="salary" />
								<label class=" full small right" for="salary5">15k-20k</label>
								<input class=" radiocheck" type="radio" value="6"  id="salary6" name="salary" />
								<label class=" full small right" for="salary6">20k以上</label>
							</li>

						</div>
					</ul>
				</div>

			</div>

		</div>
	</form>
	<div class="s_position_list " id="s_position_list">
		<div class="holder"></div>
		<div class="position_show">
			<ul class="item_con_list" id="item_con_list" style="display: block;">
				<c:forEach items="${positionAndCompanyList }" var="positionAndCompany" varStatus="status">
				<li class="con_list_item first_row" >
					<div class="list_item_top">
						<div class="position">
							<div class="p_top">

								<a class="position_link" href="${pageContext.request.contextPath}/findJobDetail.action?companyName=${positionAndCompany.companyName}&position=${positionAndCompany.position.position }" target="_blank" >
									<span class="biggg">${positionAndCompany.position.position }</span>
								</a>
									<span class="add">
										[ <em>${positionAndCompany.position.workplace }</em>
										]
									</span>
								<span class="format-time">${positionAndCompany.position.releaseDate }</span>
							</div>
							<div class="p_bot">
								<span class="money">${positionAndCompany.position.salary }</span>
								<div class="li_b_l">${positionAndCompany.position.experience } / ${positionAndCompany.position.eduRequest }</div>
							</div>
						</div>
						<div class="company">
							<div class="company_name">${positionAndCompany.companyName}</div>
							<div class="industry">${positionAndCompany.industry}</div>
						</div>

					</div>

				</li>
				</c:forEach>

			</ul>
		</div>

	</div>

	<script type="text/javascript">
        LazyLoad.css(["${pageContext.request.contextPath}/css/cityStyle.css"], function () {
            LazyLoad.js(["${pageContext.request.contextPath}/js/cityScript.js"], function () {
                var test = new citySelector.cityInit("city");
                
            });

        });
    </script>
	<script type="text/javascript">
 	$(function(){
  $("div.holder").jPages({
    containerID : "item_con_list"
  });
});
 </script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/showchecked.js"></script>
</body>
</html>
