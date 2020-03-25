<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>企业信息页面</title>
    <style>
        /*初始化代码*/
        * {
            padding: 0;
            margin: 0;
        }

        body {
            background: #E7E7E7;
            color: #333;
            font-size: 12px;
            font-family: "SimSun", "宋体", "Arial Narrow";

        }

        /*导航条上方欢迎和退出*/
        .head-contain {
            background-color: #33444c;
            color: #86CFED;
        }

        .head {
            height: 32px;
            width: 1100px;
            margin: 0 auto;
            line-height: 30px;
        }

        .head-right {
            float: right;
            margin-right: 30px;

        }

        .head-left {
            margin-left: 30px;
        }

        /*导航条*/
        .nav-contain {
            background-color: #2d5d81;
        }

        .nav {
            width: 1100px;
            height: 50px;
            margin: 0 auto;
            font-size: 20px;
            font-weight: bold;
            line-height: 50px;
            color: white;
        }

        .nav ul li {
            display: inline-block;
            margin-right: 50px;
            /*background-color: white;*/
        }

        .nav ul li a {
            text-decoration: none;
            padding: 0 15px;
            color: white;
            display: block;
        }

        .nav ul li a:hover ,a:visited {
            background-color: white;
            color: black;
        }

        .nav-right {
            float: right;
        }

        .nav .logo img {
            width: 200px;
            height: 30px;
        }

        /*主体部分*/
        .main-contain {
            background-color: #E7E7E7;
            padding-top: 100px;
        }

        .main {
            width: 1100px;
            height: 900px;
            margin: 0px auto;
            background-color: #F7F7F7;
            border: solid 1px #E8E8E8;

        }
        iframe{
            width: 100%;
            height: 100%;
            border: solid 1px #E8E8E8;
        }

        /*清除浮动*/
        .clean {
            clear: both;
        }
    </style>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-1.11.3.js"></script>
    <script>

        $(document).ready(function () {

            /*编辑企业信息跳转*/
          /*  $("#edit-company-info").click(function(){
                $("#iframe").src="https://www.baidu.com/";
            })*/

        });

    </script>

</head>
<body>
<header>
    <!--导航条上方欢迎和退出-->
    <div class="head-contain">
        <div class="head">
            <span class="head-left"><strong></strong></span>
            <span class="head-right">你好，${sessionScope.companyname}</span>
            <a href="#" class="head-right" style=" color: #86CFED;">退出</a>
            <a href="enterprise_edit_info.html" class="head-right"style=" color: #86CFED;" target="iframe" >编辑信息</a>
            <!--清除浮动-->
            <span class="clean"></span>
        </div>
    </div>

    <!--导航条-->
    <div class="nav-contain">
        <div class="nav">
            <ul>
                <!--logo-->
                <li class="logo"><a href="#"><img src="head.jpg"></a></li>
                <!--导航-->
                <li class="nav-right"><a href="#">简历管理</a></li>
                <li class="nav-right"><a href="#">职位管理</a></li>
                <li class="nav-right"><a href="search_resume.html" target="iframe">找简历</a></li>
                <li class="nav-right" ><a href="edit_job.html" target="iframe">发职位</a></li>
                <span class="clean"></span>
            </ul>
        </div>
    </div>

</header>
<!--完善企业信息-->
<div class="main-contain">
    <div class="main">
        <iframe src="register_enterprise_info.jsp"  scrolling="no"  name="iframe"></iframe>
    </div>
</div>
<footer></footer>
</body>
</html>