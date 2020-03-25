<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>完善企业信息</title>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="css/kuCity.css" type="text/css">
    <link rel="stylesheet" href="css/nav.css" type="text/css">
    <script src="js/jquery-1.11.3.js"></script>
    <script src="js/kuCity.js"></script>
    <script type="text/javascript" src="js/enterprise_edit_info.js"></script>
     
    <script>
        $(function(){
        	var location = '${companyInfo.location}';
        	var sex = '${companyInfo.sex}';
        	var industry = '${companyInfo.industry}';
        	initEditInfo(location,sex,industry);
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
<header>
    <!--导航条上方欢迎和退出-->
    <div class="head-contain">
        <div class="head">
            <span class="head-left"><strong></strong></span>
            <span class="head-right">你好 ! ${sessionScope.companyname}</span>
            <a href="${pageContext.request.contextPath}/loginOut.action" class="head-right" >退出</a>
            <a href="${pageContext.request.contextPath}/companyInfoFind.action" class="head-right"style=" color: #86CFED;">编辑信息</a>
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
                <li class="nav-right"><a href="${pageContext.request.contextPath}/findOnPosition.action?currentPage=1">职位管理</a></li>
                <li class="nav-right"><a href="search_resume.jsp" >找简历</a></li>
                <li class="nav-right" ><a href="edit_job.jsp" >发职位</a></li>
                <span class="clean"></span>
            </ul>
        </div>
    </div>

</header>
<!--完善企业信息-->
<div class="main-contain">
    <div class="main">
        

<form action="${pageContext.request.contextPath}/companyInfoUpdate.action" method="post" class="form-horizontal" enctype="multipart/form-data" id="editForm">
    <div class="title">
        <span>完善企业信息</span>
    </div>
    <div class="form-group">
        <label for="company_name" class="col-sm-4 control-label">公司名称</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="companyName" id="company_name"
                   placeholder="请填写您公司营业执照上的公司全称" value="${companyInfo.companyName }">
        </div>
        <label id="company_name-tip"  class="control-label" style="color:red; display: none">公司名称不能为空</label>
    </div>

    <div class="form-group">
        <label for="location" class="col-sm-4 control-label" >所在地</label>
        <div class="col-sm-5">
            <input type="text" class="form-control search" name="location" id="location"
                   placeholder="请选择公司所在城市" value="${companyInfo.location}">

        </div>
        <label id="location-tip"  class="control-label" style="color:red; display: none">所在地不能为空</label>

    </div>

    <div class="form-group">
        <label for="address" class="col-sm-4 control-label">公司地址</label>

        <div class="col-sm-5">
            <input type="text" class="form-control" name="address" id="address" placeholder="请填写公司具体地址" value="${companyInfo.address}">
        </div>
        <label id="address-tip"  class="control-label" style="color:red; display: none">公司地址不能为空</label>

    </div>
    <div class="form-group">
        <label for="industry" class="col-sm-4 control-label">所在行业</label>

        <div class="col-sm-5">
            <select name="industry" id="industry" class="form-control">
                <option value="">选择行业</option>
                <option value="高新科技">高新科技</option>
                <option value="互联网" selected="selected">&nbsp;&nbsp;&nbsp;互联网</option>
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
            <input type="text" class="form-control" name="contacts" id="contacts" placeholder="请填写联系人名字" value="${companyInfo.contacts}" >
        </div>
        <label id="contacts-tip"  class="control-label" style="color:red; display: none">联系人不能为空</label>

    </div>

    <div class="form-group">
        <label for="sex" class="col-sm-4 control-label">性别</label>

        <div class="col-sm-5" id="sex">
            <label class="radio-inline">
                <input type="radio" name="sex" value="男">男
            </label>
            <label class="radio-inline">
                <input type="radio" name="sex" value="女"> 女
            </label>
        </div>
    </div>

    <div class="form-group">
        <label for="phone" class="col-sm-4 control-label" >手机号码</label>

        <div class="col-sm-5">
            <input type="tel" class="form-control" name="phone" id="phone" placeholder="请填写手机号码" value="${companyInfo.phone}">
        </div>
        <label id="phone-tip"  class="control-label" style="color:red; display: none">手机号码不能为空</label>
        <label id="phone-tip2"  class="control-label" style="color:red; display: none">手机号码格式不正确</label>

    </div>

    <div class="form-group">
        <label for="telephone" class="col-sm-4 control-label">公司前台固话</label>

        <div class="col-sm-5">
            <input type="tel" class="form-control" name="telephone" id="telephone" placeholder="请填写前台电话" value="${companyInfo.telephone}">
        </div>
        <label id="telephone-tip"  class="control-label" style="color:red; display: none">前台固话不能为空</label>
        <label id="telephone-tip2"  class="control-label" style="color:red; display: none">前台固话格式不正确</label>

    </div>

    <div class="form-group">
        <label for="c_instruction" class="col-sm-4 control-label">公司简介</label>

        <div class="col-sm-5">
                    <textarea class="form-control" rows="3" name="companyInstruction" id="c_instruction"
                              placeholder="请填写公司简介">${companyInfo.companyInstruction}</textarea>
        </div>
        <label id="c_instruction-tip"  class="control-label" style="color:red; display: none">公司简介不能为空</label>

    </div>

    <div class="form-group">
        <label for="logo" class="col-sm-4 control-label">公司logo</label>

        <div class="col-sm-2">
            <input type="file" class="form-control" name="logopic" id="logo" >
        </div>
        <img src="${pageContext.request.contextPath}/upload/${companyInfo.logo}" style="width: 100px;height: 100px" id="img">
        <label id="logo-tip"  class="control-label" style="color:red; display: none">公司logo不能为空</label>
        <label id="logo-tip2"  class="control-label" style="color:red; display: none">图片限于bmp,png,gif,jpeg,jpg格式</label>
        <label id="logo-tip3"  class="control-label" style="color:red; display: none">图片不大于300KB</label>
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
