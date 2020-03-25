<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发布职位</title>
    <link rel="stylesheet" href="css/nav.css" type="text/css">
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="css/kuCity.css" type="text/css">
    <script src="js/jquery-1.11.3.js"></script>
    <script src="js/kuCity.js"></script>
    <!--日期选择-->
    <link rel="stylesheet" href="css/BeatPicker.css"/>
    <script src="js/BeatPicker.js"></script>
    <script src="js/test_job.js"></script>

    <script>
        //判断是否为空或者空字符
        function isNull( str ){
            if ( str == "" ) return true;
            var regu = "^[ ]+$";
            var re = new RegExp(regu);
            return re.test(str);
        }

        //是否为邮箱
        function isEmail(str){
            var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+\.([a-zA-Z0-9_-]){2,6}$/;
            return reg.test(str);
        }

        //邮箱格式不对时，改变颜色和显示提示
        function showEmailTip(){

            var checkEmail = $("#email");
            checkEmail.blur(function () {
                var tip = $("#email-tip");
                var tip2 = $("#email-tip2");
                if (isNull(checkEmail.val())) {
                    //邮箱为空时
                    checkEmail.css("border-color", "red");
                    tip.css("display","inline");
                    tip2.css("display","none");
                    return false;
                } else {
                    //不为空时
                    if (isEmail(checkEmail.val())) {
                        //是邮箱
                       
                        checkEmail.css("border-color", "#E8E8E8");
                        tip2.css("display","none");
                        tip.css("display","none");
                        return false;
                    }else{
                        //格式不对
                        checkEmail.css("border-color", "red");
                        tip2.css("display","inline");
                        tip.css("display","none");
                    }
                }
            });
        }

        //失去焦点时，判断值是否为空和为多个空格，改变颜色和显示提示
        function showTip(checkId){
            var checkIdName = $("#"+checkId);
            checkIdName.blur(function () {
                var tip = $("#"+checkId+"-tip");
                if (isNull(checkIdName.val())) {
                    checkIdName.css("border-color", "red");
                    tip.css("display","inline");
                    return false;
                } else {
                    checkIdName.css("border-color", "#E8E8E8");
                    tip.css("display","none");
                    return true;
                }
            });
        }

        function testTip(checkId){
            var checkIdName = $("#"+checkId);
            checkIdName.click(function () {
                var tip = $("#"+checkId+"-tip");
                if (!(isNull(checkIdName.val()))) {
                    checkIdName.css("border-color", "#E8E8E8");
                    tip.css("display","none");
                    return true;
                } 
            });
        }
        
        
      //截止日期失去焦点时，判断值是否为空和为多个空格，改变颜色和显示提示
        function timeShowTip(checkId){
            var checkIdName = $("#"+checkId);
            checkIdName.change(function () {
                var tip = $("#"+checkId+"-tip");
                if (isNull(checkIdName.val())) {
                    checkIdName.css("border-color", "red");
                    tip.css("display","inline");
                    return false;
                } else {
                    checkIdName.css("border-color", "#E8E8E8");
                    tip.css("display","none");
                    return true;
                }
            });
        }

        //点击提交时，判断值是否为空，为空，显示颜色和显示提示
        function onclickShowTip(checkId){
            var checkIdName = $("#"+checkId);
            var tip = $("#"+checkId+"-tip");
            if (isNull(checkIdName.val())) {
                checkIdName.css("border-color", "red");
                tip.css("display","inline");
                return false;
            } else {
                checkIdName.css("border-color", "#E8E8E8");
                tip.css("display","none");
                return true;
            }
        };

        $(document).ready(function () {
            //城市选择
            $('.search').kuCity();

            //认证
            showTip("position");
            showTip("department");
            testTip("classification");
            timeShowTip("deadline");
            showTip("statement");
            //showTip("email");s
            showEmailTip();
            //提交认证
            var btn = $("#btn");
            btn.click(function () {
                var position = onclickShowTip("position");
                var department = onclickShowTip("department");
                var deadline = onclickShowTip("deadline");
                var statement = onclickShowTip("statement");
                var email = onclickShowTip("email");
                var classification = onclickShowTip("classification");
                if(position&&department&&deadline&&statement&&email&&classification){
                    alert("发布成功！");
                    $("#perfectForm").submit();
                }
            });
        });
        
        function get(){
            $("#xx").show();
        }
    </script>
    <style>
        iframe{
            width: 100%;
            height: 100%;
            border: solid 1px #E8E8E8;
        }
        .title {
            width: 1100px;
            height: 80px;
            font-size: 30px;
            line-height: 80px;
            text-align: center;
            margin: 0 auto 60px auto;
            font-weight: bold;
            background-color: rgb(252, 177, 174);
        }
        #xx{
            display: none;
            width: 100%;
            height: 100%;
            position: fixed;
            top:0;
            left: 0;
            z-index: 1;
        }
    </style>
</head>
<body>
<header>
    <iframe name='child' src="test_job.jsp" id="xx"></iframe>
    <!--导航条上方欢迎和退出-->
    <div class="head-contain">
        <div class="head">
            <span class="head-left"><strong></strong></span>
            <span class="head-right">你好，${sessionScope.companyname}</span>
            <a href="${pageContext.request.contextPath}/loginOut.action" class="head-right" >退出</a>
            <a href="${pageContext.request.contextPath}/companyInfoFind.action" class="head-right "  >编辑信息</a>
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
                <li class="nav-right"><a href="${basePath}findPositionByCid.action?state=1&currentPage=1" >简历管理</a></li>
                <li class="nav-right"><a href="${pageContext.request.contextPath}/findOnPosition.action?currentPage=1">职位管理</a></li>
                <li class="nav-right"><a href="search_resume.jsp" >找简历</a></li>
                <li class="nav-right" ><a href="edit_job.jsp" style="background-color: #286090">发职位</a></li>
                <span class="clean"></span>
            </ul>
        </div>
    </div>

</header>
<!--完善企业信息-->
<div class="main-contain">
    <div class="main">
        <form action="${pageContext.request.contextPath}/addPosition.action" method="post" class="form-horizontal" enctype="multipart/form-data" id="perfectForm">
            <div class="title">
                <span>发布职位</span>
            </div>
            <div class="form-group">
                <label for="position" class="col-sm-4 control-label">职位名称</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="position" id="position"
                           placeholder="请填写职位">
                </div>
                <label id="position-tip"  class="control-label" style="color:red;display: none;">职位名字不能为空</label>
            </div>
            <div class="form-group">
                <label for="workplace" class="col-sm-4 control-label">工作地点</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control search" name="workplace" id="workplace"
                           placeholder="请选择公司所在城市" value="广州">
                </div>
            </div>

            <div class="form-group">
                <label for="classification" class="col-sm-4 control-label">职能分类</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="classification" id="classification" placeholder="请填写职能分类" onclick='get()'>
                </div>
                <label id="classification-tip"  class="control-label" style="color:red;display: none;">职能分类不能为空</label>
            </div>

            <div class="form-group">
                <label for="department" class="col-sm-4 control-label">所属部门</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" name="department" id="department"
                           placeholder="请填写所属部门">
                </div>
                <label id="department-tip"  class="control-label" style="color:red;display: none;">所属不能为空</label>
            </div>

            <div class="form-group">
                <label for="salary" class="col-sm-4 control-label">职位月薪</label>
                <div class="col-sm-5">
                    <select name="salary" id="salary" class="form-control">
                        <option value="1" selected="selected">面谈</option>
                        <option value="2">5k以下</option>
                        <option value="3">5k-10k</option>
                        <option value="4" >10k-15k</option>
                        <option value="5">15k-20k</option>
                        <option value="6">20k以上</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="deadline" class="col-sm-4 control-label">截止日期</label>
                <div class="col-sm-3">
                    <input type="text" data-beatpicker="true" data-beatpicker-position="['*','*']"  data-beatpicker-module="today,clear" name="deadline" id="deadline"
                           placeholder="请选择截止日期" />

                </div>
                <label id="deadline-tip"  class="control-label" style="color:red;display: none;">截止日期不能为空</label>
            </div>

            <div class="form-group">
                <label for="statement" class="col-sm-4 control-label">职位描述</label>

                <div class="col-sm-5">
                    <textarea class="form-control" rows="3" name="statement" id="statement"
                              placeholder="请填写职位描述" ></textarea>
                </div>
                <label id="statement-tip"  class="control-label" style="color:red;display: none;">职位描述不能为空</label>
            </div>

            <div class="form-group">
                <label for="experience" class="col-sm-4 control-label">工作经验</label>
                <div class="col-sm-2">
                    <select name="experience" id="experience" class="form-control">
                        <option value="1" selected="selected">应届毕业生</option>
                        <option value="2">3年及以下</option>
                        <option value="3">3-5年</option>
                        <option value="4">5-10年</option>
                        <option value="5">10年以上</option>
                        <option value="6">不要求</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="edu_request" class="col-sm-4 control-label">学历要求</label>
                <div class="col-sm-2">
                    <select name="eduRequest" id="edu_request" class="form-control">
                        <option value="1" selected="selected">大专</option>
                        <option value="2">本科</option>
                        <option value="3">硕士</option>
                        <option value="4">博士</option>
                        <option value="5">不限</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-4 control-label">应聘简历发送至</label>
                <div class="col-sm-5">
                    <input type="email" class="form-control" name="email" id="email"
                           placeholder="请填写接收邮件的地址">
                </div>
                <label id="email-tip"  class="control-label" style="color:red;display: none;">邮箱不能为空</label>
                <label id="email-tip2"  class="control-label" style="color:red;display: none;">邮箱格式不对</label>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-10">
                    <input type="button" class="btn-lg btn-primary" value="提交" id="btn">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>