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
/*function checkFile(){
    /!*文件认证*!/
    $("#logo").blur(function() {
        /!*判断文件格式*!/
        var filepath=$("input[name='logo']").val();

        //文件为空
       /!* if(isNull(filepath)){
            $("#logo").css("border-color", "red");
            $("#logo-tip").css("display","inline");
            $("#logo-tip2").css("display","none");
            $("#logo-tip3").css("display","none");
            return false;
        }*!/
        var extStart=filepath.lastIndexOf(".");
        var ext=filepath.substring(extStart,filepath.length).toUpperCase();
        if(ext!=".BMP"&&ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"&&ext!=".JPEG"){
            $("#logo").css("border-color", "red");
            $("#logo-tip2").css("display","inline");
            $("#logo-tip").css("display","none");
            $("#logo-tip3").css("display","none");

            return false;
        }

        /!*判断文件大小*!/
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

}*/


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
    var logo = $("#logo");
    logo.change( function(){
        var filepath=$("input[name='logo']").val();

        var extStart=filepath.lastIndexOf(".");
        var ext=filepath.substring(extStart,filepath.length).toUpperCase();
        if(ext!=".BMP"&&ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"&&ext!=".JPEG"){
            alert("图片限于bmp,png,gif,jpeg,jpg格式");
            return false;
        }
        if(!isNull(filepath)){
            $("#img").css("display","none");
        }
    });

}

function initEditInfo(location,sex,industry) {
	$("#industry option[value='"+industry+"']").attr('selected',true);
	$("#sex input[value='"+sex+"']").attr('checked',true);
    //城市选择
    $('.search').kuCity();

    //认证
    showTip("company_name");
    showTip("location");
    showTip("address");
    showTip("industry");
    showTip("contacts");
    showTip("c_instruction");
    checkFile();
    showPhoneTip();
    showTelephoneTip();

    //提交认证
    $("#btn").click(function () {
        onclickShowTip("company_name");
        onclickShowTip("location");
        onclickShowTip("address");
        onclickShowTip("industry");
        onclickShowTip("contacts");
        onclickShowTip("phone");
        onclickShowTip("telephone");
        onclickShowTip("c_instruction");
        $("#editForm").submit();
    });

}