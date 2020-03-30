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

	<title>个人主页-伯乐网</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
	<!-- 最上栏 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/widgets.css">
	<!-- 侧栏  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_html.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/tag.js"></script>
	<script src="js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/scroll.js"></script>
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
						<a href="${pageContext.request.contextPath}/positionRank.action" class="current" id="5i00"    >首页</a>
					</li>

				</ul>
			</div>
		</div>
	</div>
	<input type="hidden" id="serverTime" value="1470275265811">
	<div class="container clearfix" id="container" style="min-height: 844px;">
		<div id="sidebar" class="sidebar">
			<div class="mainNavs">
				<div class="menu_box">
					<div class="menu_main job_hopping">
						<h2>
							技术
							<span></span>
						</h2>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=Java" >Java</a>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=PHP" >PHP</a>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=C"  >C</a>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=C++" >C++</a>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=Android" >Android</a>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=iOS" >iOS</a>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=测试" >测试</a>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=架构师" >架构师</a>
					</div>
					<div class="menu_sub dn" style="top: 0px;">
						<dl>
							<dt>
								<a href="javascript:;"  >后端开发</a>
							</dt>
							<dd>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=Java" >Java</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=Python" >Python</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=PHP" >PHP</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="javascript:;"  >移动开发</a>
							</dt>
							<dd>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=HTML5" >HTML5</a>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=Android" >Android</a>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=iOS" >iOS</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="javascript:;"  >前端开发</a>
							</dt>
							<dd>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=web前端" >web前端</a>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=Flash" >Flash</a>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=html51" >html5</a>
							</dd>
						</dl>
						<dl>
							<dt>
								<a href="javascript:;"   >测试</a>
							</dt>
							<dd>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=测试工程师">测试工程师</a>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=自动化测试" >自动化测试</a>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=功能测试" >功能测试</a>
							</dd>
						</dl>
					</div>
				</div>
				<div class="menu_box">
					<div class="menu_main job_hopping">
						<h2>
							设计
							<span></span>
						</h2>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=设计总监"   >设计总监</a>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=UI"   >UI</a>
						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=UE"  >UE</a>
					</div>
					<div class="menu_sub dn" style="top: 166px;">
						<dl>
							<dt>
								<a href="javascript:;"   >视觉设计</a>
							</dt>
							<dd>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=网页设计师" >网页设计师</a>
								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=Flash设计师" >Flash设计师</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=APP设计师" >APP设计师</a>

							</dd>
						</dl>

						<dl>
							<dt>

								<a href="javascript:;"   >交互设计</a>
							</dt>
							<dd>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=网页交互设计师" >网页交互设计师</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=交互设计师" >交互设计师</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=无线交互设计师" >无线交互设计师</a>

							</dd>
						</dl>

					</div>
				</div>
				<div class="menu_box">
					<div class="menu_main job_hopping">
						<h2>
							运营
							<span></span>
						</h2>

						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=新媒体运营"  >新媒体运营</a>

						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=数据运营"   >数据运营</a>

						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=运营总监"   >运营总监</a>

					</div>
					<div class="menu_sub dn" style="top: 318px;">
						<dl>
							<dt>

								<a href="javascript:;"   >运营</a>
							</dt>
							<dd>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=内容运营" >内容运营</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=产品运营" >产品运营</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=数据运营" >数据运营</a>

							</dd>
						</dl>
						<dl>
							<dt>

								<a href="javascript:;"   >编辑</a>
							</dt>
							<dd>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=副主编" >副主编</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=内容编辑" >内容编辑</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=文案策划" >文案策划</a>

							</dd>
						</dl>
						<dl>
							<dt>

								<a href="javascript:;"  >客服</a>
							</dt>
							<dd>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=售前咨询" >售前咨询</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=售后客服" >售后客服</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=淘宝客服" >淘宝客服</a>

							</dd>
						</dl>
						<dl>
							<dt>

								<a href="javascript:;"  >高端职位</a>
							</dt>
							<dd>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=主编" >主编</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=运营总监" >运营总监</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=COO" >COO</a>

							</dd>
						</dl>
					</div>
				</div>
				<div class="menu_box">
					<div class="menu_main job_hopping">
						<h2>
							市场与销售
							<span></span>
						</h2>

						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=市场推广"  >市场推广</a>

						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=市场总监"   >市场总监</a>

						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=市场策划"  >市场策划</a>

						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=BD"   >BD</a>

						<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=销售总监"  >销售总监</a>
					</div>
					<div class="menu_sub dn">
						<dl>
							<dt>

								<a href="javascript:;"  >市场/营销</a>
							</dt>
							<dd>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=市场策划" >市场策划</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=市场顾问" >市场顾问</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=市场营销" >市场营销</a>

							</dd>
						</dl>
						<dl>
							<dt>

								<a href="javascript:;"  >公关</a>
							</dt>
							<dd>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=媒介经理" >媒介经理</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=广告协调" >广告协调</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=品牌公关" >品牌公关</a>
							</dd>
						</dl>
						<dl>
							<dt>

								<a href="javascript:;"  >销售</a>
							</dt>
							<dd>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=销售专员" >销售专员</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=销售经理" >销售经理</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=客户代表" >客户代表</a>

							</dd>
						</dl>

						<dl>
							<dt>

								<a href="javascript:;"  >供应链</a>
							</dt>
							<dd>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=物流" >物流</a>

								<a href="${pageContext.request.contextPath}/findPositionByCondition.action?input=仓储" >仓储</a>
							</dd>
						</dl>

					</div>
				</div>
				
				<div class="menu_box">
					<div id="scroll">
					    <div id="list" style="left: -230px;">
					        <a href="http://vaio.com/">
					            <img src="images/ad/vaio.jpg" alt="vaio"/>
					        </a>
					        <a href="http://www.scau.edu.cn/">
					            <img src="images/ad/scau.jpg" alt="华南农业大学"/>
					        </a>
					        <a href="http://www.neusoft.com/cn/">
					            <img src="images/ad/neusoft.jpg" alt="东软"/>
					        </a>
					        <a href="http://www.apple.com/">
					            <img src="images/ad/apple.jpg" alt="苹果"/>
					        </a>
					        <a href="https://www.google.com.hk/?hl=zh-cn">
					            <img src="images/ad/google.jpg" alt="google"/>
					        </a>
					        <a href="https://www.microsoft.com/zh-cn">
					            <img src="images/ad/ms.png" alt="微软"/>
					        </a>
					        <a href="http://www.oracle.com/">
					            <img src="images/ad/oracle.jpg" alt="oracle"/>
					        </a>
					        <a href="http://vaio.com/">
					            <img src="images/ad/vaio.jpg" alt="vaio"/>
					        </a>
					        <a href="http://www.scau.edu.cn/">
					            <img src="images/ad/scau.jpg" alt="华南农业大学"/>
					        </a>
					    </div>
					    <div id="buttons">
					        <span index="1" class="on"></span>
					        <span index="2"></span>
					        <span index="3"></span>
					        <span index="4"></span>
					        <span index="5"></span>
					        <span index="6"></span>
					        <span index="7"></span>
					    </div>
					    <a href="javascript:;" id="prev" class="arrow">&lt;</a>
					    <a href="javascript:;" id="next" class="arrow">&gt;</a>
					</div>
				</div>
			</div>

		</div>

		<div class="content">

			<div id="search_box" class="search_box">
				<form id="searchForm" class="searchForm" name="searchForm" action="${pageContext.request.contextPath}/findPositionByCondition.action" method="get">
					<span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
					<input type="text" name="search" id="search_input" class="search_input ui-autocomplete-input" tabindex="1" maxlength="64" autocomplete="off" value="" placeholder="搜索职位名称" style="color: rgb(153, 153, 153);">
					<input type="submit" id="search_button" class="search_button" value="搜索" id="4V00"    >
				</form>
			</div>

			<ul class="job_tab" id="jobTab">

				<li class="newTab" id="wu00"    >最新职位</li>
			</ul>
				<!-- 最新职位 -->
				<div class="new_posHotPosition position_list">
					<ul class="clearfix">
						<li class="position_list_item"  >
							<div class="pli_top">
								<div class="fl pli_top_l">
									<div class="position_name">
										<!--  -->

										<h2 class="fl">
											<a href="${pageContext.request.contextPath}/findJobDetail.action?companyName=${company1.companyName }&position=${position1.position }"   >
												${position1.position }
											</a>
												<span>[${position1.workplace }]</span>
											
										</h2>
										<!-- 此处需要和后台确认 -->
										<span class="fl"><fmt:formatDate value='${position1.releaseDate}' pattern='yyyy-MM-dd'/></span>
									</div>
									<div>
										<span class="salary fl">${position1.salary }</span>
										<span>${position1.experience }实习经验</span>
										/
										<span>${position1.eduRequest }</span>

									</div>
								</div>
								<div class="fr pli_top_r">
									<div class="company_name wordCut">
										<a href="javascript:;">${company1.companyName }</a>
									</div>
									<div class="industry wordCut">
										<span>${company1.industry }</span>
									</div>
								</div>
							</div>

						</li>

						<li class="position_list_item"  >
							<div class="pli_top">
								<div class="fl pli_top_l">
									<div class="position_name">
										<!--  -->

										<h2 class="fl">
											<a href="${pageContext.request.contextPath}/findJobDetail.action?companyName=${company2.companyName }&position=${position2.position }"   >
												${position2.position }
											</a>
												<span>[${position2.workplace }]</span>
											
										</h2>
										<!-- 此处需要和后台确认 -->
										<span class="fl"><fmt:formatDate value='${position1.releaseDate}' pattern='yyyy-MM-dd'/></span>
									</div>
									<div>
										<span class="salary fl">${position2.salary }</span>
										<span>${position2.experience }实习经验</span>
										/
										<span>${position2.eduRequest }</span>

									</div>
								</div>
								<div class="fr pli_top_r">
									<div class="company_name wordCut">
										<a href="javascript:;">${company2.companyName }</a>
									</div>
									<div class="industry wordCut">
										<span>${company2.industry }</span>
									</div>
								</div>
							</div>

						</li>

						<li class="position_list_item"  >
							<div class="pli_top">
								<div class="fl pli_top_l">
									<div class="position_name">
										<!--  -->

										<h2 class="fl">
											<a href="${pageContext.request.contextPath}/findJobDetail.action?companyName=${company3.companyName }&position=${position3.position }"   >
												${position3.position }
											</a>
												<span>[${position3.workplace }]</span>
											
										</h2>
										<!-- 此处需要和后台确认 -->
										<span class="fl"><fmt:formatDate value='${position2.releaseDate}' pattern='yyyy-MM-dd'/></span>
									</div>
									<div>
										<span class="salary fl">${position3.salary }</span>
										<span>${position3.experience }实习经验</span>
										/
										<span>${position3.eduRequest }</span>

									</div>
								</div>
								<div class="fr pli_top_r">
									<div class="company_name wordCut">
										<a href="javascript:;"   ><fmt:formatDate value='${position3.releaseDate}' pattern='yyyy-MM-dd'/></a>
									</div>
									<div class="industry wordCut">
										<span>${company3.industry }</span>
									</div>
								</div>
							</div>

						</li>

						<li class="position_list_item"  >
							<div class="pli_top">
								<div class="fl pli_top_l">
									<div class="position_name">
										<!--  -->

										<h2 class="fl">
											<a href="${pageContext.request.contextPath}/findJobDetail.action?companyName=${company4.companyName }&position=${position4.position }"   >
												${position4.position }
											</a>
												<span>[${position4.workplace }]</span>
											
										</h2>
										<!-- 此处需要和后台确认 -->
										<span class="fl"><fmt:formatDate value='${position4.releaseDate}' pattern='yyyy-MM-dd'/></span>
									</div>
									<div>
										<span class="salary fl">${position4.salary }</span>
										<span>${position4.experience }实习经验</span>
										/
										<span>${position4.eduRequest }</span>

									</div>
								</div>
								<div class="fr pli_top_r">
									<div class="company_name wordCut">
										<a href="javascript:;"   >${company4.companyName }</a>
									</div>
									<div class="industry wordCut">
										<span>${company4.industry }</span>
									</div>
								</div>
							</div>

						</li>

						<li class="position_list_item"  >
							<div class="pli_top">
								<div class="fl pli_top_l">
									<div class="position_name">
										<!--  -->

										<h2 class="fl">
											<a href="${pageContext.request.contextPath}/findJobDetail.action?companyName=${company5.companyName }&position=${position5.position }"   >
												${position5.position }
											</a>
												<span>[${position5.workplace }]</span>
											
										</h2>
										<!-- 此处需要和后台确认 -->
										<span class="fl"><fmt:formatDate value='${position5.releaseDate}' pattern='yyyy-MM-dd'/></span>
									</div>
									<div>
										<span class="salary fl">${position5.salary }</span>
										<span>${position5.experience }实习经验</span>
										/
										<span>${position5.eduRequest }</span>

									</div>
								</div>
								<div class="fr pli_top_r">
									<div class="company_name wordCut">
										<a href="javascript:;"   >${company5.companyName }</a>
									</div>
									<div class="industry wordCut">
										<span>${company5.industry }</span>
									</div>
								</div>
							</div>

						</li>

					</ul>
					<a href="${pageContext.request.contextPath}/job_search.jsp" class="list_more fr"   id="4s00"    >查看更多</a>
				</div>
			</div>

		</div>

	</div>

	<script type="text/javascript">
    window.global = window.global || {};
    require(['index/page/index/main']);
	</script>
	

</body>

</html>
