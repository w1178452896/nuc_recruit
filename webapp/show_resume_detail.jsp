<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户简历详情</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }
        body{
            background-color: rgb(252, 177, 174);
        }

        /*主体*/
        .content {
            width: 1000px;
            height:auto;
            background-color: white;
            margin: 20px auto;
            border-width: 1px;
		    border-style: solid;
		    border-color: #fff #fff #f1f0f0 #f1f0f0;
		    box-shadow: 5px -5px 12px #ebebeb;
		    border-radius: 10px;
        }

        /*头像和基本信息*/

        .head {
            text-align: center;
            padding-top: 50px;
        }

        .head img {
            width: 180px;
            height: 180px;
            border-radius:90px;
        }

        /*分类*/
        .group {
            font-weight: bold;
        }
        .group-span{
            background-color: #fcb1ae;
		    width: 10px;
		    height: 25px;
		    line-height: 25px;
		    margin-left: 10px;
		    vertical-align: bottom;
		    display: inline-block;
        }

        .group-title {

        }

        .group-content {
            font-size: 16px;
            color: rgb(87, 84, 98);
        }

        .first{
            text-align: center;
        }

        .left{
            width: 550px;
            float: left;
            text-align: center;
        }
        .left img{
        	 width: 85px;
        	 height: 85px;
        	 float: left;
        	 padding-left: 20px;
        }
        .right{
            width: 550px;
            /*background-color: #fcb1ae;*/
            float: left;
            text-align: center;
        }
        .clea{
            clear: both;
        }

        /*分割线*/
        .hr{
            margin-top: 60px;
        }

        .pad{
            padding: 30px 0;
        }

    </style>
</head>
<body>
<div class="content">
    <!--头像和基本信息-->
    <div class="head">
        <span><img src="/pic/${resume.personPic }"></span><br>
        <span id="name"><h1>${resume.name }</h1></span><br>

        <div class="group-content">
            <span>${educationExperience.major } - ${educationExperience.school }</span><br>
            <span>${resume.sex } ︳生日：${birthday } ︳${educationExperience.education }  ︳工作年限：${wy } ︳${resume.city }   </span><br>
            <span>${resume.phone } ︳${resume.mail }  </span>
        </div>
        <hr class="hr">
    </div>

    <!--实习经历-->
    <div class="practical-experience pad">
        <span class="group"><h2><span class="group-span"></span>实习经历</h2></span><br>
        <div >
            <div class="left" >
                 
                <span ><h3>公司：${practicalExperience.company } </h3></span><br>
            </div>
            <div class="right" >
     	       <span class="group-content">职位：${practicalExperience.position }</span><br/><br/>
                <span class="group-content">${pestime }到${peetime }</span>
            </div>
            <div class="clea"></div>
        </div>
        <hr class="hr">
    </div>

    <!--教育经历-->
    <div class="education _experience pad">
        <span class="group"><h2><span class="group-span"></span>教育经验</h2></span>
        <div class="left" >
            <span><h3>${educationExperience.school }</h3></span><br>
            <span class="group-content"><span>${educationExperience.education } •</span><span> ${educationExperience.major } </span></span>
        </div>
        <div class="right" >
            <span class="group-content">${eestime }到${eeetime } </span>
        </div>
        <div class="clea"></div>
        <hr class="hr">
    </div>
    <!--项目经验-->
    <div class="project pad">
        <span class="group"><h2><span class="group-span"></span>项目经验</h2></span>

        <!-- 第一个项目经验-->
        <div class="project-first">
        <div class="left" style="text-align: left" >
            <div style="padding-left: 20px;padding-bottom: 20px">
                <span><h3>${project1.project }</h3></span><br>
                <span class="group-content">
                <span>&nbsp;&nbsp;项目：${project1.statement }</span><br>
                <span>&nbsp;&nbsp;职责：${project1.position } </span>
                </span>
            </div>

        </div>
        <div class="right" >
            <span class="group-content">${stime1 }到${etime1 }</span>
        </div>
        <div class="clea"></div>
        </div>

        <!--第二个项目-->
        <div class="project-second">
            <div class="left" style="text-align: left"  >
                <div style="padding-left: 20px;padding-bottom: 20px">
                    <span><h3>${project2.project }</h3></span><br>
                <span class="group-content">
                <span>&nbsp;&nbsp;项目：${project2.statement }</span><br>
                <span>&nbsp;&nbsp;职责：${project2.position } </span>
                </span>
                </div>
            </div>
            <div class="right" >
                <span class="group-content">${stime2 }到${etime2 }</span>

            </div>
            <div class="clea"></div>
        </div>
        <hr class="hr">
    </div>

    <!--自我描述-->
    <div class="description pad ">
        <span class="group"><h2><span class="group-span"></span>自我描述</h2></span>
        <div style="text-align: left;padding-left: 30px" >
            <span class="group-content">${resume.introduction }</span>
        </div>
        <div class="clea"></div>
        <hr class="hr">
    </div>

    <!--期待工作-->
    <div class="hope-position pad">
        <span class="group"><h2><span class="group-span"></span>期望工作</h2></span>
        <div style="text-align: left;padding-left: 30px" >
            <span class="group-content"><span>期待职位：${resume.positionApplied }</span>  ， <span> 期待工作城市：${resume.exceptedCity }   </span> ， <span> 期待月薪：${resume.exceptedSalary }  </span> ， <span> 补充说明：${resume.postscript }  </span>  </span>
        </div>
        <div class="clea"></div>
        <hr class="hr">
    </div>

    <!--技能-->
    <div class="skill pad">
        <span class="group"><h2><span class="group-span"></span>技能评价</h2></span>
        <div class="group-content" style="text-align: left;padding-left: 30px">
            <span >${skill1 }</span><br>
            <span >${skill2 }</span><br>
            <span >${skill3 }</span><br>
        </div>
    </div>
</div>

</body>
</html>