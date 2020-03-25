<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>搜索简历</title>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/nav.css">
    <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        //失去焦点时，判断值是否为数字，改变颜色和显示提示
        function showTip(checkId){
            var checkIdName = $("#"+checkId);
            checkIdName.blur(function () {
                var tip = $("#"+checkId+"-tip");
                if (!isNum(checkIdName.val())) {
                    checkIdName.css("border-color", "red");
                    tip.css("display","inline");
                    return false;
                } else {
                    checkIdName.css("border-color", "#E8E8E8");
                    tip.css("display","none");
                    return false;
                }
            });
        }
        //判断是否是正整数
        function isNum(s)
        {
            if(s!=null){
                var r,re;
                re = /\d*/i; //\d表示数字,*表示匹配多个数字
                r = s.match(re);
                return (r==s)?true:false;
            }
            return false;
        }

        $(document).ready(function () {
            $(".bar a").click(function(){
                $(this).addClass("visited").siblings().removeClass("visited");
            });

            //城市选择
            $('.search').kuCity();

            //表单切换
            var search_condition = $("#search-condition");
            search_condition.click(function () {
                $("#form-condition").css("display","block");
                $("#form-number").css("display","none");
                return false;
            });

            var search_order = $("#search-order");
            search_order.click(function(){
                $("#form-condition").css("display","none");
                $("#form-number").css("display","block");
                return false;
            })

            //编号查询认证
            showTip("number1");
            showTip("number2");
            showTip("number3");
            showTip("number4");
            showTip("number5");
        });

    </script>
    <style>
        .title {
            width: 1100px;
            height: 80px;
            font-size: 30px;
            line-height: 80px;
            text-align: center;
            margin: 0 auto ;
            font-weight: bold;
            background-color: rgb(252, 177, 174);
        }
        .bar{
            width: 1100px;
            height: 80px;
            margin: 0 auto;
            font-size: 25px;
            text-align: center;
        }

        .bar a{
            display: inline-block;
            width: 200px;
            list-style: none;
            margin-top: 20px;
            border-radius: 10px;
            background-color: #e9bfbd;
            text-decoration: none;
        }

        .bar .visited{
            color:#fff;
            background-color: #2e6da4;
        }
    </style>
    <script src="js/kuCity.js"></script>
    <link href="css/kuCity.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
    <!--导航条上方欢迎和退出-->
    <div class="head-contain">
        <div class="head">
            <span class="head-left"><strong></strong></span>
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
                <li class="logo"><img src="images/login.png"></li>
                <!--导航-->
                <li class="nav-right"><a href="${basePath}findPositionByCid.action?state=1&currentPage=1">简历管理</a></li>
                <li class="nav-right"><a href="${pageContext.request.contextPath}/findOnPosition.action?currentPage=1" >职位管理</a></li>
                <li class="nav-right"><a href="earch_ressume.jsp" style="background-color: #286090">找简历</a></li>
                <li class="nav-right" ><a href="edit_job.jsp" >发职位</a></li>
                <span class="clean"></span>
            </ul>
        </div>
    </div>

</header>
<!--完善企业信息-->
<div class="main-contain">
    <div class="main">

        <div class="title">
            <span>搜索简历</span>
        </div>
        <div class="bar">
            <a href=" " id="search-condition" class="visited">按条件搜索</a>
            <a href=" " id="search-order">按照编号搜索</a>
        </div>
    <form action="${basePath}findResume.action" method="post" class="form-horizontal" enctype="multipart/form-data" name="form-condition" id="form-condition">
     <input type="hidden" name="page" value="1"/>
    <div class="form-group">
        <label for="key-word" class="col-sm-4 control-label">关键词</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="keys" id="key-word"
                   placeholder="请填写关键词 ,最多十个，以空格隔开">
        </div>
    </div>
    <div class="form-group">
        <label for="place" class="col-sm-4 control-label">地区</label>
        <div class="col-sm-5">
            <input type="text" class=" search form-control " name="exceptedCity" id="place"
                   placeholder="请选择地区">
        </div>
    </div>

    <div class="form-group">
        <label for="position" class="col-sm-4 control-label">期待职位</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="positionApplied" id="position"
                   placeholder="请填写期待职位">
        </div>
    </div>

    <div class="form-group">
        <label for="edu_request1" class="col-sm-4 control-label">学历</label>
        <div class="col-sm-5">
            <label class="radio-inline">
                <input type="radio" id="edu_request1" value="" name="education" checked> 不限
            </label>
            <label class="radio-inline">
                <input type="radio" id="edu_request2" value="4" name="education" > 博士
            </label>
            <label class="radio-inline">
                <input type="radio" id="edu_request4" value="3" name="education" > 硕士
            </label>
            <label class="radio-inline">
                <input type="radio" id="edu_request5" value="2" name="education" > 本科
            </label>
            <label class="radio-inline">
                <input type="radio" id="edu_request6" value="1" name="education" > 大专
            </label>
            <label class="radio-inline">
                <input type="radio" id="edu_request6" value="5" name="education" > 其他
            </label>
        </div>
    </div>

    <div class="form-group">
        <label for="experience" class="col-sm-4 control-label">工作年限</label>
        <div class="col-sm-2">
            <select name="workYear" id="experience" class="form-control">
                <option value="" selected="selected">不限</option>
                <option value="1">应届毕业生</option>
                <option value="2">3年及其以下</option>
                <option value="3">3-5年</option>
                <option value="4">5-10年</option>
                <option value="5">5.10年以上</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-10">
            <input type="submit" class="btn-lg btn-primary" value="提交" >
        </div>
    </div>
</form>

<form action="${basePath}findResumeById.action" method="post" class="form-horizontal" enctype="multipart/form-data" name="form-number"style="display: none;" id="form-number">
    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-10">
            <label f class="control-label">请输入简历编号，一行一个简历编号，最多5个</label>
        </div>
    </div>
    <div class="form-group">
        <div class=" col-sm-offset-4 col-sm-5">
            <input type="text" class="form-control" name="uid0" placeholder="请输入简历编号">
        </div>
    </div>
    <div class="form-group">
        <div class=" col-sm-offset-4 col-sm-5">
            <input type="text" class="form-control" name="uid1" placeholder="请输入简历编号">
        </div>
    </div>
    <div class="form-group">
        <div class=" col-sm-offset-4 col-sm-5">
            <input type="text" class="form-control" name="uid2" placeholder="请输入简历编号">
        </div>
    </div>
    <div class="form-group">
        <div class=" col-sm-offset-4 col-sm-5">
            <input type="text" class="form-control" name="uid3" placeholder="请输入简历编号">
        </div>
    </div>
    <div class="form-group">
        <div class=" col-sm-offset-4 col-sm-5">
            <input type="text" class="form-control" name="uid14" placeholder="请输入简历编号">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-10">
            <input type="submit" class="btn-lg btn-primary" value="提交" >
        </div>
    </div>
</form>

    </div>
</div>

</body>
</html>