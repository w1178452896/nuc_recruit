$(function(){
	var warnTips = $(".warn-tips");

	function showTip(element,tip){
		element.innerText = tip;
		element.style.display = "block";
	}

	$("#email").focus(function(){
		//$("#email").val("");
		warnTips[0].style.display = "none";
	});
	$("#pwd").focus(function(){
		showTip(warnTips[1],"密码长度6-16位，包括符号、数组或字母");
	});
	$("#nPwd").focus(function(){
		//$("#nPwd").val("");
		warnTips[2].style.display = "none";
	});

	$("#email").blur(function(){
		var email = $("#email").val();
		var isEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+\.([a-zA-Z0-9_-]){2,6}$/; 
		if(email === ""){
			showTip(warnTips[0],"邮箱不能为空");
			return false;
		}
		else if(!(isEmail.test(email))){
			showTip(warnTips[0],"邮箱格式不正确");
			return false;
		}
		//邮箱验证，具体参数见后台格式
		/*$.ajax({
			"url":'',
			"dataType":"json",
			"type":"post",
			"data":{"email":email},
			success:function(){

			},
			error:function(){

			}
		})*/
	});

	$("#pwd").blur(function(){
		var pwd = $("#pwd").val();
		if(pwd === ""){
			showTip(warnTips[1],"密码不能为空");
			return false;
		}
		else if(pwd.length < 6){
			showTip(warnTips[1],"密码长度不能少于6位");
			return false;
		}
		else if(pwd.length > 16){
			showTip(warnTips[1],"密码长度不能大于16位");
			return false;
		}
		else{
			warnTips[1].style.display = "none";
		}
	});

	$("#nPwd").blur(function(){
		var pwd = $("#pwd").val();
		var nPwd = $("#nPwd").val();
		if(nPwd === ""){
			showTip(warnTips[2],"请输入确认密码");
			return false;
		}
		else if(pwd !== nPwd){
			showTip(warnTips[2],"两次密码输入不一致");
			return false;
		}
	});

	$(".register-type input").click(function(){
		$(this).attr('id','type').siblings().attr('id','');
		$(this).css('border','1px solid #f3c7c9').siblings().css('border','1px solid #e0dede');
		warnTips[3].style.display = "none";
	});
	
	$("#register").click(function(){
		var email = $("#email").val();
		var pwd = $("#pwd").val();
		var nPwd = $("#nPwd").val();
		var type = $("#type").val();    
		if(email === ""){
			showTip(warnTips[0],"邮箱不能为空");
			return false;
		}
		if(pwd === ""){
			showTip(warnTips[1],"密码不能为空");
			return false;
		}
		if(nPwd === ""){
			showTip(warnTips[2],"请输入确认密码");
			return false;
		}
		if(pwd !== nPwd){
			showTip(warnTips[2],"两次密码输入不一致");
			return false;
		}
		if(type === "" || type === undefined){
			showTip(warnTips[3],"请选择类型");
			return false;
		}
		if($("#agree").attr("checked") != "checked"){
			showTip(warnTips[4],"请勾选同意协议");
			return false;
		}
		else{
			warnTips[4].style.display = "none";
		}
		if(type == "找工作"){
			$("#iptType").val('0');
		}
		else if(type == "招人"){
			$("#iptType").val('1');
		}
		$("#registerForm").submit();
	});
	
});