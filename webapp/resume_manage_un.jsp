<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>简历管理</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/nav.css" rel="stylesheet">
    <link href="css/table.css" rel="stylesheet">
    <script src="js/jquery-1.11.3.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
    </style>
    <script>
        $(document).ready(function () {
            var pp = '${basePath}';
            // 全选
            $("#checkedAll").bind("click", function () {
                if ($("#checkedAll").is(':checked')) {
                    $("[name = chkItem]:checkbox").attr("checked", true);
                } else {
                    $("[name = chkItem]:checkbox").attr("checked", false);
                }
            });
            
            /*设置页数*/
            $("#page").blur(function(){
                var page = $(this).val();
                var pid = ${resume.pid};
                var url = pp + "findPositionResume.action?currentPage="+page+"&pid="+pid+"&state=R";
                $("#pageForm").attr("action",url);
                $("#pageForm").submit();
            });

            /*发送到我的电脑*/
            $("#sendToComputer").click(function(){
                var aa = pp+'exportResume.action';
                var idArr = [];
                $("#result input[type=checkbox]:checked").each(function(){
                    idArr.push($(this).val());
                });
                $("#sendTo").val(idArr);
                $("#send").attr("action",aa);
                $("#send").submit();
            });

            /*转发简历到邮箱*/
            $("#sendToEmail").click(function(){
                var aa = pp+'sentResumeMail.action';
                var idArr = [];
                $("#result input[type=checkbox]:checked").each(function(){
                    idArr.push($(this).val());
                });
                $("#sendToEmailBtn").click(function(){
                    var to = $("#emailTo").val();
                    var subject = $("#emailSubject").val();
                    var message = $("#emailMessage").val();
                    var data = {'idArr':idArr,'to':to,'subject':subject,'message':message};
                    $.ajax({
                        url:aa,
                        type:'post',
                        dataType:'json',
                        contentType:'application/json;charset=UTF-8',
                        data:JSON.stringify(data),
                        success:function(r){
                            if((r.result).toUpperCase() == 'FALSE'){
                                alert("转发简历到邮箱失败");
                            }
                            else if((r.result).toUpperCase() == 'TRUE'){
                                alert("转发简历到邮箱成功");
                            }
                        },
                        error:function(){
                            console.log("请求失败");
                        }
                    });
                });
            });
        });

    </script>
</head>
<body>

<!--正在招聘页面-->
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
<%--                <li class="logo"><img src="images/login.png"></li>--%>
                <!--导航-->
                <li class="nav-right"><a href="${basePath}findPositionByCid.action?state=1&currentPage=1" style="background-color: #337AB7">简历管理</a></li>
                <li class="nav-right"><a href="${pageContext.request.contextPath}/findOnPosition.action?currentPage=1" >职位管理</a></li>
                <li class="nav-right"><a href="search_resume.jsp" >找简历</a></li>
                <li class="nav-right" ><a href="edit_job.jsp" >发职位</a></li>
                <span class="clean"></span>
            </ul>
        </div>
    </div>

</header>
<div class="main-content">
    <div class="bar">
        <ul class="nav nav-pills">
            <li><a href="${basePath}findPositionResume.action?currentPage=1&pid=${resume.pid}&state=w" target="_self">待处理</a></li>
            <li><a href="${basePath}findPositionResume.action?currentPage=1&pid=${resume.pid}&state=s" target="_self">已发送邀请</a></li>
            <li class="active"><a href="${basePath}findPositionResume.action?currentPage=1&pid=${resume.pid}&state=r" target="_self">不合适</a></li>
            <li ><a href="${basePath}findPositionResume.action?currentPage=1&pid=${resume.pid}&state=e" target="_self">聘用</a></li>
        </ul>
    </div>
    <form action="" enctype="multipart/form-data" method="post">
        <div class="content">
            <table class="table table-hover ">
                <thead>
                <tr>
                    <th></th>
                    <th>姓名</th>
                    <th>职位名称</th>
                    <th>性别</th>
                    <th>实习经验</th>
                    <th>学历</th>
                    <th>毕业学校</th>
                    <th>投递日期</th>
                </tr>
                </thead>
                <tbody id="result">
                    <c:forEach items="${resume.positionResume}" var="positionResume">
                        <tr>
                        <td><input type="checkbox" name="chkItem" value="${positionResume.uid}"/></td>
                        <td><a href="${pageContext.request.contextPath}/user/findMyResume.action?type=1&id=${positionResume.uid}">${positionResume.name}</a></td>
                        <td>${resume.position}</td>
                        <td>${positionResume.sex}</td>
                        <td>${positionResume.workYear}</td>
                        <td>${positionResume.education}</td>
                        <td>中北大学</td>
                        <td>
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${positionResume.deliveryDate}" />
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="page" style="margin-bottom: 40px"> &nbsp;&nbsp;
            <input type="checkbox" id="checkedAll">&nbsp;全选&nbsp;&nbsp;&nbsp; 
            <a href="${basePath}findPositionResume.action?currentPage=1&pid=${resume.pid}&state=r">首页</a>&nbsp;&nbsp;&nbsp;
            <a href="${basePath}findPositionResume.action?currentPage=${resume.totalPage}&pid=${resume.pid}&state=r">尾页</a>&nbsp;&nbsp;&nbsp;               
            第${resume.currentPage}/${resume.totalPage}页&nbsp;&nbsp;&nbsp;去&nbsp;&nbsp;
            <input type="text" style="width: 40px;text-align:center;" id="page" value="">&nbsp;&nbsp;页
            <br><br>
            <ul class="nav nav-pills">
                <li class="active"><a href="javascript:void(0)" id="sendToComputer">保存到我的电脑</a></li>
                <li class="active"><a href="javascript:void(0)" id="sendToEmail" data-toggle="modal" data-target="#sendToEmailModal">转发简历到邮箱</a></li>
            </ul>
        </div>
    </form>
    
    <!-- 转发简历到邮箱 begin -->
    <div class="modal fade" id="sendToEmailModal" tabindex="-1" role="dialog" aria-labelledby="sendToEmail">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">转发简历到邮箱</h4>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="recipient-name" class="control-label">邮箱:</label>
                <input type="text" class="form-control" id="emailTo">
              </div>
              <div class="form-group">
                <label for="recipient-name" class="control-label">邮箱标题:</label>
                <input type="text" class="form-control" id="emailSubject">
              </div>
              <div class="form-group">
                <label for="message-text" class="control-label">主体信息:</label>
                <textarea class="form-control" id="emailMessage"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal" id="sendToEmailBtn">发送</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 转发简历到邮箱 end -->

    <form action="" method="post" id="pageForm">
    </form> 
    
    <!--转发到邮箱form-->
    <form action="" method="post" id="send">
        <input type="hidden" name="pid" value='${resume.pid}'>
        <input type="hidden" name="currentPage" value='${resume.currentPage}'>
        <input type="hidden" id="sendTo" name="idArr">
        <input type="hidden" id="message" name="message">
        <input type="hidden" id="subject" name="subject">
        <input type="hidden" id="state" name="state" value="s">
    </form> 
</div>

</body>
</html>