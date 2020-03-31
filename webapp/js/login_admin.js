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
	var liActive = window.localStorage.getItem("liActive");
	if(liActive == "学生登录"){
		$(".sign-nav li").eq(0).addClass("li-active").siblings().removeClass("li-active");
		$(".sign-nav li").eq(0).attr("id","type").siblings().attr("id","");
	}else{
		$(".sign-nav li").eq(1).addClass("li-active").siblings().removeClass("li-active");
		$(".sign-nav li").eq(1).attr("id","type").siblings().attr("id","");
	}
	/*if(result !== ""){
		showTip(warnTips[2],"账号与密码不匹配");
	}*/
	//导航条切换函数
	function showTip(element,tip){
		element.innerText = tip;
		element.style.display = "block";
	}

	$(".sign-nav li").click(function(){
		$(this).addClass("li-active").siblings().removeClass("li-active");
		$(this).attr("id","type").siblings().attr("id","");
		$(".warn-tips").text('');
		window.localStorage.setItem("email","");
		window.localStorage.setItem("pwd","");
		$("#email").val();
		$("#pwd").val();
		window.localStorage.setItem("liActive",$(this).text());
	});

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
		if(type == "学生登录" || type == "个人用户绑定"){
			$("#iptType").val("0");
		}
		else if(type == "企业登录" || type == "企业用户绑定"){
			$("#iptType").val("1");
		}
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
		window.localStorage.setItem("email",$("#email").val());
		window.localStorage.setItem("pwd",$("#pwd").val());
	/*		$.ajax({
			url:"login.action",
			type:"post",
			data:{"mail":email,"password":pwd,"type":$("#iptType").val()},
			dataType:"string",
			success:function(data){
				if(data == "error"){
					showTip(warnTips[2],"账号与密码不匹配");
				}
				else if(data == "register_active_tip"){
					window.location.href = "register_active_tip.jsp";
				}
				else if(data == "register_user_info"){
					window.location.href = "register_user_info.jsp";
				}
				else if(data == "user_index"){
					window.location.href = "user_index.jsp";
				}
			},
			error:function(){
				showTip(warnTips[2],"登录失败");
			}
		});*/
		$("#loginForm").submit();
	}
});
