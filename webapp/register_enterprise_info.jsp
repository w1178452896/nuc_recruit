<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>填写企业基本信息</title>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="css/kuCity.css" type="text/css">
    <script src="js/jquery-1.11.3.js"></script>
    <script src="js/kuCity.js"></script>
  	<style>
    </style>
   
    <script type="text/javascript">

        //判断是否为手机号码
        function isMobilePhone(str){
            if (!(/^1[3|4|5|7|8]\d{9}$/.test(str))){
                //手机号码不符合要求
                return false;
            }else{
                return true;
            }
        }

        //判断是否为固定电话
        function isTelephone(str){
            if (!/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/.test(str)){
                //不是固定电话
                return false;
            }else{
                return true;
            }
        }

        //手机号码格式不对时，改变颜色和提示
        function showPhoneTip(){
            var checkPhone = $("#phone");
            checkPhone.blur(function () {
                var tip = $("#phone-tip");
                var tip2 = $("#phone-tip2");
                if (isNull(checkPhone.val())) {
                    //手机号码为空时
                    checkPhone.css("border-color", "red");
                    tip.css("display","inline");
                    tip2.css("display","none");
                    return false;
                } else {
                    //不为空时
                    if (isMobilePhone(checkPhone.val())) {
                        //是电话
                        checkPhone.css("border-color", "");
                        tip.css("display","none");
                        tip2.css("display","none");
                        return false;
                    }else{
                        //格式不对
                        checkPhone.css("border-color", "red");
                        tip2.css("display","inline");
                        tip.css("display","none");
                    }
                }
            });
        }

        //固定电话格式不对时，改变颜色和提示
        function showTelephoneTip(){
            var checkTelephone = $("#telephone");
            checkTelephone.blur(function () {
                var tip = $("#telephone-tip");
                var tip2 = $("#telephone-tip2");
                if (isNull(checkTelephone.val())) {
                    //固定电话为空时
                    checkTelephone.css("border-color", "red");
                    tip.css("display","inline");
                    tip2.css("display","none");
                    return false;
                } else {
                    //不为空时
                    if (isTelephone(checkTelephone.val())) {
                        //是固定电话
                        checkTelephone.css("border-color", "");
                        tip.css("display","none");
                        tip2.css("display","none");
                        return false;
                    }else{
                        //格式不对
                        checkTelephone.css("border-color", "red");
                        tip2.css("display","inline");
                        tip.css("display","none");
                    }
                }
            });
        }

        //文件认证
        function checkFile(){
            /*文件认证*/
            $("#logo").blur(function() {
                /*判断文件格式*/
                var filepath=$("input[name='logo']").val();

                //文件为空
                if(isNull(filepath)){
                    $("#logo").css("border-color", "red");
                    $("#logo-tip").css("display","inline");
                    $("#logo-tip2").css("display","none");
                    $("#logo-tip3").css("display","none");
                    return false;
                }
                var extStart=filepath.lastIndexOf(".");
                var ext=filepath.substring(extStart,filepath.length).toUpperCase();
                if(ext!=".BMP"&&ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"&&ext!=".JPEG"){
                    $("#logo").css("border-color", "red");
                    $("#logo-tip2").css("display","inline");
                    $("#logo-tip").css("display","none");
                    $("#logo-tip3").css("display","none");

                    return false;
                }

                /*判断文件大小*/
                var img=new Image();
                img.src=filepath;
                while(true){
                    if(img.fileSize>0){
                        if(img.fileSize>3*1024){
                            $("#logo").css("border-color", "red");
                            $("#logo-tip3").css("display","inline");
                            $("#logo-tip").css("display","none");
                            $("#logo-tip2").css("display","none");
                            return false;
                        }
                        break;
                    }
                }
                return true;
            });

        }


        //判断是否为空或者空字符
        function isNull( str ){
            if ( str == "" ) return true;
            var regu = "^[ ]+$";
            var re = new RegExp(regu);
            return re.test(str);
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
                    return false;
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
            } else {
                checkIdName.css("border-color", "#E8E8E8");
                tip.css("display","none");
            }
        };

        //文件验证

        function checkFile(){
        /*文件认证*/
        /*判断文件格式*/
        var filepath=$("input[name='logo']").val();
        var extStart=filepath.lastIndexOf(".");
        var ext=filepath.substring(extStart,filepath.length).toUpperCase();
        if(ext!=".BMP"&&ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"&&ext!=".JPEG"){
            alert("图片限于bmp,png,gif,jpeg,jpg格式");
            return false;
        }
        }


        $(document).ready(function () {
            //城市选择
            $('.search').kuCity();

            //认证
            showTip("company_name");
            showTip("location");
            showTip("address");
            showTip("industry");
            showTip("contacts");
            showTip("c_instruction");
            //checkFile();
            showPhoneTip();
            showTelephoneTip();

            //提交认证
            var submit = $("#submit");
            submit.click(function () {
                onclickShowTip("company_name");
                onclickShowTip("location");
                onclickShowTip("address");
                onclickShowTip("industry");
                onclickShowTip("contacts");
                onclickShowTip("phone");
                onclickShowTip("telephone");
                onclickShowTip("c_instruction");
                //onclickShowTip("logo");
                //checkFile();
                });

        });
    </script>
    <style>
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

    </style>
</head>
<body>


<!--填写公司基本信息-->
<div class="main-contain">
    <div class="main">
        
<form action="${pageContext.request.contextPath}/companyInfoAdd.action" method="post" class="form-horizontal" enctype="multipart/form-data">
    <div class="title">
        <span>填写企业基本信息</span>
    </div>
    <div class="form-group">
        <label for="company_name" class="col-sm-4 control-label">公司名称</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="companyName" id="company_name"
                   placeholder="请填写您公司营业执照上的公司全称" >
        </div>
        <label id="company_name-tip"  class="control-label" style="color:red; display: none">公司名称不能为空</label>
    </div>

    <div class="form-group">
        <label for="location" class="col-sm-4 control-label">所在地</label>
        <div class="col-sm-5">
            <input type="text" class="form-control search" name="location" id="location"
                   placeholder="请选择公司所在城市" value="广州" >

        </div>
        <label id="location-tip"  class="control-label" style="color:red; display: none">所在地不能为空</label>

    </div>

    <div class="form-group">
        <label for="address" class="col-sm-4 control-label">公司地址</label>

        <div class="col-sm-5">
            <input type="text" class="form-control" name="address" id="address" placeholder="请填写公司具体地址" >
        </div>
        <label id="address-tip"  class="control-label" style="color:red; display: none">公司地址不能为空</label>

    </div>
    <div class="form-group">
        <label for="industry" class="col-sm-4 control-label">所在行业</label>

        <div class="col-sm-5">
            <select name="industry" id="industry" class="form-control">
                <option value="">选择行业</option>
                <option value="高新科技">高新科技</option>
                <option value="互联网">&nbsp;&nbsp;&nbsp;互联网</option>
                <option value="电子商务">&nbsp;&nbsp;&nbsp;电子商务</option>
                <option value="电子游戏">&nbsp;&nbsp;&nbsp;电子游戏</option>
                <option value="计算机软件">&nbsp;&nbsp;&nbsp;计算机软件</option>
                <option value="计算机硬件">&nbsp;&nbsp;&nbsp;计算机硬件</option>
                <option value="信息传媒">信息传媒</option>
                <option value="出版业">&nbsp;&nbsp;&nbsp;出版业</option>
                <option value="电影录音">&nbsp;&nbsp;&nbsp;电影录音</option>
                <option value="广播电视">&nbsp;&nbsp;&nbsp;广播电视</option>
                <option value="通信">&nbsp;&nbsp;&nbsp;通信</option>
                <option value="金融">金融</option>
                <option value="银行">&nbsp;&nbsp;&nbsp;银行</option>
                <option value="资本投资">&nbsp;&nbsp;&nbsp;资本投资</option>
                <option value="证券投资">&nbsp;&nbsp;&nbsp;证券投资</option>
                <option value="保险">&nbsp;&nbsp;&nbsp;保险</option>
                <option value="信贷">&nbsp;&nbsp;&nbsp;信贷</option>
                <option value="财务">&nbsp;&nbsp;&nbsp;财务</option>
                <option value="审计">&nbsp;&nbsp;&nbsp;审计</option>
                <option value="服务业">服务业</option>
                <option value="法律">&nbsp;&nbsp;&nbsp;法律</option>
                <option value="餐饮">&nbsp;&nbsp;&nbsp;餐饮</option>
                <option value="酒店">&nbsp;&nbsp;&nbsp;酒店</option>
                <option value="旅游">&nbsp;&nbsp;&nbsp;旅游</option>
                <option value="广告">&nbsp;&nbsp;&nbsp;广告</option>
                <option value="公关">&nbsp;&nbsp;&nbsp;公关</option>
                <option value="景观">&nbsp;&nbsp;&nbsp;景观</option>
                <option value="咨询分析">&nbsp;&nbsp;&nbsp;咨询分析</option>
                <option value="市场推广">&nbsp;&nbsp;&nbsp;市场推广</option>
                <option value="人力资源">&nbsp;&nbsp;&nbsp;人力资源</option>
                <option value="社工服务">&nbsp;&nbsp;&nbsp;社工服务</option>
                <option value="养老服务">&nbsp;&nbsp;&nbsp;养老服务</option>
                <option value="教育">教育</option>
                <option value="高等教育">&nbsp;&nbsp;&nbsp;高等教育</option>
                <option value="基础教育">&nbsp;&nbsp;&nbsp;基础教育</option>
                <option value="职业教育">&nbsp;&nbsp;&nbsp;职业教育</option>
                <option value="幼儿教育">&nbsp;&nbsp;&nbsp;幼儿教育</option>
                <option value="特殊教育">&nbsp;&nbsp;&nbsp;特殊教育</option>
                <option value="培训">&nbsp;&nbsp;&nbsp;培训</option>
                <option value="医疗服务">医疗服务</option>
                <option value="临床医疗">&nbsp;&nbsp;&nbsp;临床医疗</option>
                <option value="制药">&nbsp;&nbsp;&nbsp;制药</option>
                <option value="保健">&nbsp;&nbsp;&nbsp;保健</option>
                <option value="美容">&nbsp;&nbsp;&nbsp;美容</option>
                <option value="医疗器材">&nbsp;&nbsp;&nbsp;医疗器材</option>
                <option value="生物工程">&nbsp;&nbsp;&nbsp;生物工程</option>
                <option value="疗养服务">&nbsp;&nbsp;&nbsp;疗养服务</option>
                <option value="护理服务">&nbsp;&nbsp;&nbsp;护理服务</option>
                <option value="艺术娱乐">艺术娱乐</option>
                <option value="创意艺术">&nbsp;&nbsp;&nbsp;创意艺术</option>
                <option value="体育健身">&nbsp;&nbsp;&nbsp;体育健身</option>
                <option value="娱乐休闲">&nbsp;&nbsp;&nbsp;娱乐休闲</option>
                <option value="图书馆">&nbsp;&nbsp;&nbsp;图书馆</option>
                <option value="博物馆">&nbsp;&nbsp;&nbsp;博物馆</option>
                <option value="策展">&nbsp;&nbsp;&nbsp;策展</option>
                <option value="博彩">&nbsp;&nbsp;&nbsp;博彩</option>
                <option value="制造加工">制造加工</option>
                <option value="食品饮料业">&nbsp;&nbsp;&nbsp;食品饮料业</option>
                <option value="纺织皮革业">&nbsp;&nbsp;&nbsp;纺织皮革业</option>
                <option value="服装业">&nbsp;&nbsp;&nbsp;服装业</option>
                <option value="烟草业">&nbsp;&nbsp;&nbsp;烟草业</option>
                <option value="造纸业">&nbsp;&nbsp;&nbsp;造纸业</option>
                <option value="印刷业">&nbsp;&nbsp;&nbsp;印刷业</option>
                <option value="化工业">&nbsp;&nbsp;&nbsp;化工业</option>
                <option value="汽车">&nbsp;&nbsp;&nbsp;汽车</option>
                <option value="家具">&nbsp;&nbsp;&nbsp;家具</option>
                <option value="电子电器">&nbsp;&nbsp;&nbsp;电子电器</option>
                <option value="机械设备">&nbsp;&nbsp;&nbsp;机械设备</option>
                <option value="塑料工业">&nbsp;&nbsp;&nbsp;塑料工业</option>
                <option value="金属加工">&nbsp;&nbsp;&nbsp;金属加工</option>
                <option value="军火">&nbsp;&nbsp;&nbsp;军火</option>
                <option value="地产建筑">地产建筑</option>
                <option value="房地产">&nbsp;&nbsp;&nbsp;房地产</option>
                <option value="装饰装潢">&nbsp;&nbsp;&nbsp;装饰装潢</option>
                <option value="物业服务">&nbsp;&nbsp;&nbsp;物业服务</option>
                <option value="特殊建造">&nbsp;&nbsp;&nbsp;特殊建造</option>
                <option value="建筑设备">&nbsp;&nbsp;&nbsp;建筑设备</option>
                <option value="贸易零售">贸易零售</option>
                <option value="零售">&nbsp;&nbsp;&nbsp;零售</option>
                <option value="大宗交易">&nbsp;&nbsp;&nbsp;大宗交易</option>
                <option value="进出口贸易">&nbsp;&nbsp;&nbsp;进出口贸易</option>
                <option value="公共服务">公共服务</option>
                <option value="政府">&nbsp;&nbsp;&nbsp;政府</option>
                <option value="国防军事">&nbsp;&nbsp;&nbsp;国防军事</option>
                <option value="航天">&nbsp;&nbsp;&nbsp;航天</option>
                <option value="科研">&nbsp;&nbsp;&nbsp;科研</option>
                <option value="给排水">&nbsp;&nbsp;&nbsp;给排水</option>
                <option value="水利能源">&nbsp;&nbsp;&nbsp;水利能源</option>
                <option value="电力电网">&nbsp;&nbsp;&nbsp;电力电网</option>
                <option value="公共管理">&nbsp;&nbsp;&nbsp;公共管理</option>
                <option value="环境保护">&nbsp;&nbsp;&nbsp;环境保护</option>
                <option value="非盈利组织">&nbsp;&nbsp;&nbsp;非盈利组织</option>
                <option value="开采冶金">开采冶金</option>
                <option value="煤炭工业">&nbsp;&nbsp;&nbsp;煤炭工业</option>
                <option value="石油工业">&nbsp;&nbsp;&nbsp;石油工业</option>
                <option value="黑色金属">&nbsp;&nbsp;&nbsp;黑色金属</option>
                <option value="有色金属">&nbsp;&nbsp;&nbsp;有色金属</option>
                <option value="土砂石开采">&nbsp;&nbsp;&nbsp;土砂石开采</option>
                <option value="地热开采">&nbsp;&nbsp;&nbsp;地热开采</option>
                <option value="交通仓储">交通仓储</option>
                <option value="邮政">&nbsp;&nbsp;&nbsp;邮政</option>
                <option value="物流递送">&nbsp;&nbsp;&nbsp;物流递送</option>
                <option value="地面运输">&nbsp;&nbsp;&nbsp;地面运输</option>
                <option value="铁路运输">&nbsp;&nbsp;&nbsp;铁路运输</option>
                <option value="管线运输">&nbsp;&nbsp;&nbsp;管线运输</option>
                <option value="航运业">&nbsp;&nbsp;&nbsp;航运业</option>
                <option value="民用航空业">&nbsp;&nbsp;&nbsp;民用航空业</option>
                <option value="农林牧渔">农林牧渔</option>
                <option value="种植业">&nbsp;&nbsp;&nbsp;种植业</option>
                <option value="畜牧养殖业">&nbsp;&nbsp;&nbsp;畜牧养殖业</option>
                <option value="林业">&nbsp;&nbsp;&nbsp;林业</option>
                <option value="渔业">&nbsp;&nbsp;&nbsp;渔业</option>
            </select>
        </div>
        <label id="industry-tip"  class="control-label" style="color:red; display: none">所在行业不能为空</label>

    </div>

    <div class="form-group">
        <label for="contacts" class="col-sm-4 control-label">联系人</label>

        <div class="col-sm-5">
            <input type="text" class="form-control" name="contacts" id="contacts" placeholder="请填写联系人名字" >
        </div>
        <label id="contacts-tip"  class="control-label" style="color:red; display: none">联系人不能为空</label>

    </div>

    <div class="form-group">
        <label for="sex" class="col-sm-4 control-label">性别</label>

        <div class="col-sm-5">
            <label class="radio-inline">
                <input type="radio" name="sex" id="sex" value="男" checked>男
            </label>
            <label class="radio-inline">
                <input type="radio" name="sex" value="女"> 女
            </label>
        </div>
    </div>

    <div class="form-group">
        <label for="phone" class="col-sm-4 control-label">手机号码</label>

        <div class="col-sm-5">
            <input type="tel" class="form-control" name="phone" id="phone" placeholder="请填写手机号码" >
        </div>
        <label id="phone-tip"  class="control-label" style="color:red; display: none">手机号码不能为空</label>
        <label id="phone-tip2"  class="control-label" style="color:red; display: none">手机号码格式不正确</label>

    </div>

    <div class="form-group">
        <label for="telephone" class="col-sm-4 control-label">公司前台固话</label>

        <div class="col-sm-5">
            <input type="tel" class="form-control" name="telephone" id="telephone" placeholder="请填写前台电话" >
        </div>
        <label id="telephone-tip"  class="control-label" style="color:red; display: none">前台固话不能为空</label>
        <label id="telephone-tip2"  class="control-label" style="color:red; display: none">前台固话格式不正确</label>

    </div>

    <div class="form-group">
        <label for="c_instruction" class="col-sm-4 control-label">公司简介</label>

        <div class="col-sm-5">
                    <textarea class="form-control" rows="3" name="companyInstruction" id="c_instruction"
                              placeholder="请填写公司简介"></textarea>
        </div>
        <label id="c_instruction-tip"  class="control-label" style="color:red; display: none">公司简介不能为空</label>

    </div>

    <div class="form-group">
        <label for="logo" class="col-sm-4 control-label">公司logo</label>

        <div class="col-sm-3">
            <input type="file" class="form-control" name="logopic" id="logo">
        </div>
        <label id="logo-tip"  class="control-label" style="color:red; display: none">公司logo不能为空</label>
        <label id="logo-tip2"  class="control-label" style="color:red; display: none">图片限于bmp,png,gif,jpeg,jpg格式</label>
        <label id="logo-tip3"  class="control-label" style="color:red; display: none">图片不大于300KB</label>

    </div> 


    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-10">
            <input type="submit" class="btn-lg btn-primary" value="提交" id="submit">
        </div>
    </div>

</form>

    </div>
</div>

</body>
</html>

</body>
</html>