$(function(){
	var vertifyR;
	var warnTips = $(".warn-tips");
	var email = window.localStorage.getItem("email");
	var pwd = window.localStorage.getItem("pwd");
	$("#vertifyCode").attr("src","createCode.action?temp=" + Math.random());
	$("#email").val(email);
	$("#pwd").val(pwd);
	$("img").load(function(){
		console.log("img请求完成");
		$.ajax({
			url:'getcode.action',
			type:'get',
			dataType:'text',
			success:function(code){
				codefunc(code.trim());
				console.log(code);
			},
			error:function(){
				console.log("发送请求失败。");
			}
		});
	});
	function codefunc(code){
		vertifyR = code;
	}
	$("#reroate").click(function(){
		window.localStorage.setItem("email",$("#email").val());
		window.localStorage.setItem("pwd",$("#pwd").val());
		$("#reroateForm").submit();
	});

	/*if(result !== ""){
		showTip(warnTips[2],"账号与密码不匹配");
	}*/
	//导航条切换函数
	function showTip(element,tip){
		element.innerText = tip;
		element.style.display = "block";
	}

	//三者是否为空验证
	$("#email").blur(function(){
		var email = $("#email").val();
		if(email === ""){
			showTip(warnTips[0],"请输入邮箱");
			return false;
		}
	});
	$("#pwd").blur(function(){
		var pwd = $("#pwd").val();
		if(pwd === ""){
			showTip(warnTips[1],"请输入密码");
			return false;
		}
	});
	$("#email").focus(function(){
		$(".warn-tips").eq(0).hide();
		$(".errorTip").hide();
	});
	$("#pwd").focus(function(){
		$(".warn-tips").eq(1).hide();
		$(".errorTip").hide();
	});
	$("#vertify").focus(function(){
		$(".warn-tips").eq(2).hide();
	});
	$("#vertify").blur(function(){
		var vertify = $("#vertify").val();
		if(vertify === ""){
			showTip(warnTips[2],"请输入验证码");
			return false;
		}
		else if(vertifyR.toUpperCase() != vertify.toUpperCase()){
			showTip(warnTips[2],"验证码不正确");
			return false;
		}
	});
	
	document.onkeydown = function(event){
	    var e = event?event:(window.event?window.event:null);
	    if(e.keyCode == 13){
	        login();
	    }
	}
	
	$("#login").click(function(){
		login();
	});

	function login(){
		var email = $("#email").val();
		var pwd = $("#pwd").val();
		var vertify = $("#vertify").val();
		var type = $("#type").html();
		if(email === ""){
			showTip(warnTips[0],"请输入邮箱");
			return false;
		}
		if(pwd === ""){
			showTip(warnTips[1],"请输入密码");
			return false;
		}
		if(vertify === ""){
			showTip(warnTips[2],"请输入验证码");
			return false;
		}
		else if(vertifyR.toUpperCase() != vertify.toUpperCase()){
			showTip(warnTips[2],"验证码不正确");
			return false;
		}
		$("#loginForm").submit();
	}
});
