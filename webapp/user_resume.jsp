<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- meta -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit">

	<title>个人简历-伯乐网</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
	<!-- 最上栏 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/widgets.css">
	<!-- 侧栏  -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main_html.css">
	<!-- 主要排版 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resume.css">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lazyload-min.js"></script>
	<script src="${pageContext.request.contextPath}/js/laydate.js"></script>
	
	<script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/xcConfirm.css"/>
	
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
						<a href="javascript:;"  class="bl" id="5g00"     rel="nofollow">${mail}用户</a>
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

	<div class="resume" id="resume" >

		<form id="resform" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/user/updateMyResume.action" >
			<div class="resume1">
				
				<div id="touxiang">
					<div id="tupian">
					<c:if test="${resume.personPic!=null}">
					<img src="${pageContext.request.contextPath}/upload/${resume.personPic }" name="xianshi" id="rrr" onclick="anniu()" />
					</c:if>
					</div>
					<c:if test="${resume.personPic==null}">
						<input type="file" value="请选择头像" name="personPics" id="file_input" <%--style="display:none"--%> />
					</c:if>
				</div>

				<div class="resume2">
					<input type="text" value="${resume.name }" maxlength="15" name="name" class="res_main" required />

				</div>
				<div class="base_info">

					<span id="baseti1">基本信息</span>
					<span id="bas2">-----------</span>
					<div class="base_in">
						<span class="base_sp" >性别</span>
						<select name="sex" id="sex" class="base_info" required>
							<option value=""></option>
							<option value ="男">男</option>
							<option value ="女">女</option>
						</select>

						<input type="hidden" id="hid_sex" value="${resume.sex }" />
					</div>
					<div class="base_in">
						<span class="base_sp" >籍贯</span>
						<input type="text" name="nativePlace" id="Native_place" class="base_info" value="${resume.nativePlace }" maxlength="10" required/>
					</div>
					<div class="base_in">
						<span class="base_sp" >出生日期</span>
						<input readonly="readonly" name="bir" id="birthday" class="base_info" value="${birthday }" onclick="laydate()" />
					</div>
					<div class="base_in">
						<span class="base_sp" >居住城市</span>
						<input type="text" readonly="readonly" class="base_info" name="city" id="city" value="${resume.city }" />
					</div>
					<div class="base_in">
						<span class="base_sp" >手机号码</span>
						<input type="text" class="base_info" name="phone" id="phone" value="${resume.phone }" maxlength="11" pattern="^1[345678][0-9]{9}$" required/>
					</div>
					<div class="base_in">
						<span class="base_sp">最高学历</span>
						<select class="base_info" name="education" id="education" required>
							<option value=""></option>
							<option value ="1">大专</option>
							<option value ="2">本科</option>
							<option value="3">研究生</option>
							<option value="4">硕士</option>
							<option value="5">博士</option>
							<option value="6">其他</option>
						</select>
						<input type="hidden" id="hid_edu" value="${resume.education }" />
					</div>
					<div class="base_in">
						<span class="base_sp">工作年限</span>
						<select class="base_info" name="workYear" id="Work_year" required>
							<option value=""></option>
							<option value ="1">应届毕业生</option>
							<option value ="2">3年及以下</option>
							<option value="3">3-5年</option>
							<option value="4">5-10年</option>
							<option value="5">10年以上</option>
						</select>
						<input type="hidden" id="hid_wy" value="${resume.workYear }" />
					</div>
					<div class="base_in">
						<span class="base_sp" >身份证号</span>
						<input type="text" class="base_info" name="idCard" id="Id_card" value="${resume.idCard }" maxlength="18" required/>
					</div>
					<div class="base_in">
						<span class="base_sp" >电子邮箱</span>
						<input type="email" class="base_info" name="mail" id="mail" value="${resume.mail }" maxlength="30" required/>
					</div>

					<div class="base_in">
						<span class="base_sp" >期待职位</span>
						<input type="text" class="base_info" name="positionApplied" id="Position_Applied" value="${resume.positionApplied }" maxlength="15" required/>
					</div>
						<div class="base_in">
						<span class="base_sp" >期待城市</span>
						<input type="text" class="base_info" name="exceptedCity" id="Excepted_city" value="${resume.exceptedCity }" maxlength="5" required/>
					</div>
						<div class="base_in">
						<span class="base_sp" >期待月薪</span>
						<input type="text" class="base_info" name="exceptedSalary" id="Excepted_Salary" value="${resume.exceptedSalary }" maxlength="6" required/>
					</div>
						<div class="base_in">
						<span class="base_sp" >补充说明</span>
						<textarea class="base_info" name="postscript" id="postscript" value="" maxlength="200" required>${resume.postscript }</textarea>
					</div>
				</div>
				<div class="edu_info">
					<span id="eduti1">教育经历</span>
					<span id="edu2">-----------</span>
					<div class="edu_in">
						<span class="edu_sp">学校名称</span>
						<input type="text" class="edu_info" name="school" id="school" maxlength="15" value="${educationExperience.school }" required/>
						<span class="edu_sp">学院名称</span>
						<input type="text" class="edu_info" name="college" id="college" maxlength="15" value="${educationExperience.college }" required/>
					</div>
					<div class="edu_in">
						<span class="edu_sp">专业名称</span>
						<input type="text" class="edu_info" id="major" name="major" maxlength="10" value="${educationExperience.major }" required/>
						<span class="edu_sp">最高学历</span>
						<input type="text" class="edu_info" id="edu" name="education2" maxlength="5" value="${educationExperience.education }" required/>
					</div>
					<div class="edu_in">
						<span class="edu_sp">开始时间</span>
						<input readonly="readonly"  class="edu_info" id="s_time" name="eestime" onclick="laydate()" value="${eestime }">
						<span class="edu_sp">结束时间</span>
						<input  readonly="readonly" class="edu_info" id="e_time" name="eeetime" onclick="laydate()" value="${eeetime }">
					</div>
					 <div class="edu_in">
						<span class="edu_sp">专业技能1</span>
						<input type="text" class="edu_info"  name="skill1" maxlength="10" value="${skill1 }" required/>
						<span class="edu_sp">专业技能2</span>
						<input type="text" class="edu_info"  name="skill2" maxlength="10" value="${skill2 }" required/>
					</div>
						<div class="edu_in">
						<span class="edu_sp">专业技能3</span>
						<input type="text" class="edu_info"  name="skill3" maxlength="10" value="${skill3 }" required/>
					</div> 
					<div class="edu_in">
						<span class="edu_sp" id="jingli">专业描述</span>
						<textarea class="edu_info" name="statement" id="statement" value="" maxlength="200" cols="60" rows="5" required>${educationExperience.statement }</textarea>
					</div>
				
				</div>
				<div class="work_exp">
					<span id="eduti1">实习经历</span>
					<span id="edu2">-----------</span>
					<div class="edu_in">
						<span class="edu_sp">公司名称</span>
						<input type="text" class="edu_info" name="Company" id="Company" maxlength="15" value="${practicalExperience.company }" required/>
						<span class="edu_sp">实习职业</span>
						<input type="text" class="edu_info" name="position" id="position" maxlength="10" value="${practicalExperience.position }" required/>
					</div>
					<div class="edu_in">
						<span class="edu_sp">开始时间</span>
						<input  readonly="readonly" class="edu_info" id="pes_time" name="pestime" onclick="laydate()" value="${pestime }">
						<span class="edu_sp">结束时间</span>
						<input  readonly="readonly" class="edu_info" id="pee_time" name="peetime" onclick="laydate()" value="${peetime }">
					</div>
				</div>
				<div class="proj">
					<span id="eduti1">项目经历</span>
					<span id="edu2">-----------</span>
					<div class="edu_in">
						<span class="edu_sp">项目一名称：</span>
						<input type="text" class="edu_info" name="proName1" id="project" maxlength="15" value="${project1.project }" required/>
						<span class="edu_sp">你的有关职责</span>
						<input type="text" class="edu_info" name="posi1" id="pposition" maxlength="10" value="${project1.position }" required/>
					</div>
					<div class="edu_in">
						<span class="edu_sp">项目开始时间</span>
						<input  readonly="readonly" class="edu_info" id="ps_time" name="stime1" onclick="laydate()" value="${stime1 }">
						<span class="edu_sp">项目结束时间</span>
						<input  readonly="readonly" class="edu_info" id="pe_time" name="etime1" onclick="laydate()" value="${stime2 }">
					</div>
					<div class="edu_in">
						<span class="edu_sp" id="jingli1">项目有关描述</span>
						<textarea class="edu_info" name="sta1" id="pstatement" value="" maxlength="200" cols="60" rows="5" maxlength="200" required>${project1.statement }</textarea>
					</div>
					<div class="edu_in">
						<span class="edu_sp">项目二名称：</span>
						<input type="text" class="edu_info" name="proName2" id="project" maxlength="15" value="${project2.project }" required/>
						<span class="edu_sp">你的有关职责</span>
						<input type="text" class="edu_info" name="posi2" id="pposition" maxlength="10" value="${project2.position }" required/>
					</div>
					<div class="edu_in">
						<span class="edu_sp">项目开始时间</span>
						<input  readonly="readonly" class="edu_info" id="ps_time1" name="stime2" onclick="laydate()" value="${stime2 }">
						<span class="edu_sp">项目结束时间</span>
						<input  readonly="readonly" class="edu_info" id="pe_time1" name="etime2" onclick="laydate()" value="${etime2 }">
					</div>
					<div class="edu_in">
						<span class="edu_sp" id="jingli1">项目有关描述</span>
						<textarea class="edu_info" name="sta2" id="pstatement" value="" maxlength="200" cols="60" rows="5" maxlength="200" required>${project2.statement }</textarea>
					</div>
				</div>
				<div class="state">
					<span id="eduti1">描述自己</span>
					<span id="edu2">-----------</span>
					<div class="edu_in">
						<textarea class="edu_info" name="introduction" id="Introduction" value="" maxlength="200" cols="60" rows="5" required>${resume.introduction }</textarea>
					</div>
				</div>
				<div class="re_submit">
					<span>简历操作</span>
					<input type="submit" id="re_submit" value="保存修改" />
					<a href="${pageContext.request.contextPath}/positionRank.action">返回首页</a>
				</div>
			</div>
		</form>

	</div>
	<script>
;!function(){

//laydate.skin('molv');

laydate({
   elem: '#demo'
})

}();
</script>
	<script type="text/javascript">
        LazyLoad.css(["${pageContext.request.contextPath}/css/cityStyle.css"], function () {
            LazyLoad.js(["${pageContext.request.contextPath}/js/cityScript.js"], function () {
                var test = new citySelector.cityInit("city");
            });
        });
    </script>
	<script type="text/javascript">
		var hidsex=document.getElementById("hid_sex").value;
		var hidwy=document.getElementById("hid_wy").value;

		var hidedu=document.getElementById("hid_edu").value;
		function setSelectChecked(selectId, checkValue){  
    		var select = document.getElementById(selectId);  
    		for(var i=0; i<select.options.length; i++){  
       			 if(select.options[i].value == checkValue){  
           			 select.options[i].selected = true;  
           				break;  
       				 }  
  				  }  
		}  

		setSelectChecked("Work_year",hidwy);
		setSelectChecked("education",hidedu);
		setSelectChecked("sex",hidsex);

		
	
	</script>
	<script type="text/javascript">

	var aaa = document.getElementById("rrr"); //获取显示图片的div元素
	var input = document.getElementById("file_input"); //获取选择图片的input元素

	function anniu(){
		input.click();
	}

//这边是判断本浏览器是否支持这个API。
	if (typeof FileReader === 'undefined') {
   	 aaa.innerHTML = "抱歉，你的浏览器不支持 FileReader";
   	 input.setAttribute('disabled', 'disabled');
		} else {
   	 input.addEventListener('change', readFile, false); //如果支持就监听改变事件，一旦改变了就运行readFile函数。
	}

	


function readFile() {
    var file = this.files[0]; //获取file对象
    //判断file的类型是不是图片类型。
    if (!/image\/\w+/.test(file.type)) {
        alert("文件必须为图片！");
        return false;
    }

    var reader = new FileReader(); //声明一个FileReader实例
    reader.readAsDataURL(file); //调用readAsDataURL方法来读取选中的图像文件
    //最后在onload事件中，获取到成功读取的文件内容，并以插入一个img节点的方式显示选中的图片
    reader.onload = function(e) {
        aaa.src = this.result
            }
}

 	</script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/checknull.js" ></script> --%>
<script type="text/javascript">
	$("#resform").submit(function() {
	if ($("#file_input").val() == "") {
		var txt="头像不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("头像不能为空！");*/
		return false;
	} else if ($("#birhday").val() == "") {
		var txt="出生年月不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("出生年月不能为空！");*/
		return false;
	} else if ($("#city").val() == "") {
		var txt="居住城市不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("居住城市不能为空！");*/
		return false;
	} else if ($("#s_time").val() == "") {
				var txt="教育经历的开始时间不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("教育经历的开始时间不能为空！");*/
		return false;
	} else if ($("#e_time").val() == "") {
				var txt="教育经历的结束时间不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("教育经历的结束时间不能为空！");*/
		return false;
	} 
	else if ($("#pes_time").val() == "") {
				var txt="实习经历的开始时间不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("实习经历的开始时间不能为空！");*/
		return false;
	} 
	else if ($("#pee_time").val() == "") {
				var txt="实习经历的结束时间不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("实习经历的结束时间不能为空！");*/
		return false;
	} 
	else if ($("#ps_time").val() == "") {
				var txt="项目一的开始时间不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("项目一的开始时间不能为空！");*/
		return false;
	} 
		else if ($("#pe_time").val() == "") {
					var txt="项目一的结束时间不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("项目一的结束时间不能为空！");*/
		return false;
	} 
		else if ($("#ps_time1").val() == "") {
					var txt="项目二的开始时间不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("项目二的开始时间不能为空！");*/
		return false;
	} 
		else if ($("#pe_time1").val() == "") {
					var txt="项目二的结束时间不能为空！";
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
		/*alert("项目二的结束时间不能为空！");*/
		return false;
	} 
});
</script>
</body>
</html>
