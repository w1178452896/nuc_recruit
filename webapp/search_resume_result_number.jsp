<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>搜索简历结果</title>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/search_resume_result.css">
    <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="js/kuCity.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/kuCity.css" rel="stylesheet" type="text/css">
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
            var pp = '${basePath}';
            $("#checkedAll").bind("click", function () {
                if ($("#checkedAll").is(':checked')) {
                    $(".chkItem:checkbox").prop("checked", true);
                } else {
                    $(".chkItem:checkbox").prop("checked", false);
                }
            });

            /*设置页数*/
            $("#page").blur(function(){
                var page = $(this).val();
                var url = pp + "${basePath}findResume.action?keys=${keys}&positionApplied=${page.positionApplied}&education=${page.education}&workYear=${page.workYear}&exceptedCity=${page.exceptedCity}&page="+page;
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
                $("#send #sendTo").val(idArr);
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
                            alert("请求失败");
                        }
                    });
                });
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
</head>
<body>
    <form action="${basePath}findResume.action" method="post" class="form-horizontal form" enctype="multipart/form-data" name="form-condition" id="form-condition">
         <input type="hidden" class="form-control" name="page" value="1">
        <div class="form-group">
            <label for="experience" class=" col-sm-offset-1 col-sm-1 control-label">工作年限</label>
            <div class="col-sm-2">
                <select name="workYear" id="experience" class="form-control">
                    <option value="" selected="selected">不限</option>
                    <option value="1">一年</option>
                    <option value="2">两年</option>
                    <option value="3">三年</option>
                    <option value="4">四年</option>
                    <option value="5">五年及以上</option>
                </select>
                </div>

            <label for="edu_request" class="col-sm-1 control-label">学历要求</label>
            <div class="col-sm-2">
                <select name="education" id="edu_request" class="form-control">
                    <option value="" selected="selected">不限</option>
                    <option value="1">大专</option>
                    <option value="2">本科</option>
                    <option value="3">硕士</option>
                    <option value="4">博士</option>
                    <option value="5">其他</option>
                </select>
            </div>

            <label for="place" class="col-sm-1 control-label">地区</label>
            <div class="col-sm-3">
                <input type="text" class=" search form-control " name="exceptedCity" id="place"
                       placeholder="请选择地区">
            </div>
        </div>

        <div class="form-group">
            <label for="position" class=" col-sm-offset-1 col-sm-1 control-label">期待职位</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="positionApplied" id="position"
                       placeholder="请填写期待职位">
            </div>

            <label for="key-word" class="col-sm-1 control-label">关键词</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name="keys" id="key-word"
                       placeholder="请填写关键词,空格隔开">
            </div>
            <input type="submit" class="btn-sm btn-primary " value="搜索" >
        </div>
    </form>

    <table>
        <tbody id="result">
        <c:forEach items="${list}" var="list">
        <tr>
            <td width="60" class="text-center list-option">
                <input type="checkbox" value="${list.uid}" class="chkItem"/>
            </td>
            <td width="100" class="text-center">
                <a href="" class="head-box" target="_blank">
                    <img src="${list.personPic}" alt="" id="circle" />
                </a>
            </td>
            <td width="400" class="basic">
                <div class="msg">
                    <p><a  href="${pageContext.request.contextPath}/user/findMyResume.action?type=1&id=${list.uid}" target="_blank">${list.name}  |  ${list.sex}　|　${list.age}岁　|　${list.nativePlace}　|　${list.education}　|　${list.workYear} </a></p>
                    期待职位：<span>${list.positionApplied}</span> | 期待工作地点：<span>${list.exceptedCity}</span> | 期待月薪：<span>${list.exceptedSalary}</span>
                </div>
            </td>
            <td class="experience">
                <div class="msg">
                个人评价：<span>${fn:substring(list.introduction,0,50)}......</span>
                </div>
            </td>
        </tr>
       </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <span class="left">
            <input type="checkbox" id="checkedAll">&nbsp;全选
            <input type="button" value="转发到邮箱" class="btn btn-primary" id="sendToEmail" data-toggle="modal" data-target="#sendToEmailModal">
            <input type="button" value="保存到电脑" class="btn btn-primary" id="sendToComputer">&nbsp;&nbsp;&nbsp; 
        </span>
    </div>
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
</body>
    <!-- 分页 -->
    <form action="" method="post" id="pageForm"></form> 
    
    <!--转发到邮箱form-->
    <form action="" method="post" id="send">
        <input type="hidden" id="pid" name="pid" value='${resume.pid}'>
        <input type="hidden" id="pid" name="currentPage" value='${resume.currentPage}'>
        <input type="hidden" id="sendTo" name="idArr">
    </form> 
</html>