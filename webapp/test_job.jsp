<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <title>选职位</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/test_job.css">
    <script type="text/javascript" src="js/jquery-1.11.3.js"></script>
</head>
<body>
    <div>
        <div id="mask"></div>
        <div class="select-function">
            <div class="sm-title">
                <span>选择职能</span>
                <a href="javascript:void(0)" class="close">×</a>
            </div>
            <!-- 显示已选 begin -->
            <div class="hasSelect">
                <em>最多选择<strong>1</strong>项</em>
                <!-- <span>高级软件工程师<i>×</i></span>
                <span>高级软件工程师<i>×</i></span> -->
                <p class="error">最多选择1项</p>
            </div>
            <!-- 显示已选 end -->

            <!-- 职能选项卡 begin -->
            <div class="first-type" id="first-type">
                <ul>
                    <li class="li-active">
                        <a href="javascript:void(0)">
                            <span>全部职能</span>
                            <i class="icon-dropdown"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- 职能选项卡 end -->

            <div class="classify-type">
                <!-- 首页通用职能 begin -->
                <div class="isHide common-type" id="common-type">
                    <div class="tip">
                        <span>通用职能</span>
                    </div>
                    <a href="javascript:void(0)">高级管理</a>
                    <a href="javascript:void(0)">人力资源</a>
                    <a href="javascript:void(0)">财务/审核/税务</a>
                    <a href="javascript:void(0)">市场</a>
                    <a href="javascript:void(0)">公关/媒介</a>
                    <a href="javascript:void(0)">销售/客服/技术支持</a>
                    <a href="javascript:void(0)">法务</a>
                    <a href="javascript:void(0)">行政/后勤/文秘</a>
                </div>
                <!-- 首页通用职能 end -->

                <!-- 首页专用职能 begin -->
                <div class="isHide marjor-type" id="marjor-type">
                    <div class="tip">
                        <span>专业职能</span>
                    </div>
                    <ul>
                        <li>
                            <a href="javascript:void(0)">IT/互联网/通信</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">房地产/建筑/物业</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">金融</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">生产/制造</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">质量管理/项目管理</a>
                        </li><li>
                            <a href="javascript:void(0)">教育/咨询/翻译</a>
                        </li><li>
                            <a href="javascript:void(0)">广告/传媒/设计</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">采购/贸易/交通/物流</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">医疗护理/生活服务</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">能源/矿产/环保</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)">公务员/农林牧渔/其他</a>
                        </li>
                    </ul>
                </div>
                <!-- 首页专用职能 end -->

                <!-- 首页通用职能-子职能 begin -->
                <div class="isHide common-type-content" id="common-type-content">
                    <ul>
                        <li><a href="javascript:void(0)">ni</a></li>
                        <li><a href="javascript:void(0)">ni</a></li>
                        <li><a href="javascript:void(0)">ni</a></li>
                        <li><a href="javascript:void(0)">ni</a></li>
                        <li><a href="javascript:void(0)">ni</a></li>
                    </ul>
                </div>
                <!-- 首页通用职能-子职能 end -->

                <!-- 首页专用职能-子职能 begin -->
                <div class="isHide marjor-type-child" id="marjor-type-child">
                    <ul>
                        <li>
                            <a href="javascript:void(0)">软件/互联网开发/系统集成</a>
                        </li>
                    </ul>
                </div>
                <!-- 首页专用职能-子职能 end -->

                <!-- 首页专用职能-子职能-子职能 begin -->
                <div class="isHide marjor-type-grandson" id="marjor-type-grandson">
                    <div class="right" id="grandson-right">
                        <ul>
                            <!-- <li>
                                <a href="javascript:void(0)">高级软件工程师</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">软件工程师</a>
                            </li> -->
                        </ul>
                    </div>
                    <div class="left" id="grandson-left">
                        <ul>
                            <li class="sli-active">
                                <a href="javascript:void(0)">前端开发</a>
                            </li>
                            <li>
                                <a href="javascript:void(0)">后端开发</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 首页专用职能-子职能-子职能 end -->
            </div>
            <div class="down-btn">
                <button class="btn btn-primary" type="button" id="sure">确定</button>
                <button class="btn btn-light close" type="button">取消</button>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="js/test_job.js"></script>
</body>
</html>
    