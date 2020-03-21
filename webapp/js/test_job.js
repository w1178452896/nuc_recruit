$(function(){
	var size=window.top;
	var top = ($(size).height() - $(".select-function").height())/2 + 'px';
	var left = ($(size).width() - $(".select-function").width())/2 + 'px';
	$(".select-function").css({'left':left,'top':top});
	$.ajax({
		url:'js/function.json',
		type:'get',
		dataType:'json',
		success:function(r){
			show(r);
		},
		error:function(){
			console.log("获取function.json数据失败！");
		}
	});
})
function show(r){
	var result = r;
	var common = r.common;
	var marjor = r.marjor;
	$.ajax({
		url:'js/marjor.json',
		type:'get',
		dataType:'json',
		success:function(r){
			returnR(r);
		},
		error:function(){
			console.log("获取marjor.json失败！");
		}
	});
	function returnR(r){
		var marjorChildCont = r;
		$("#common-type a").click(function(){
			var isSelected = $(this).attr('class');
			if(isSelected != 'a-selected'){
				$(this).addClass('a-selected').siblings().removeClass('a-selected');
				$("#marjor-type").hide();
				var that = $(this).html();
				var len = common[that].length;
				var str = "";
				for(var i=0; i<len; i++){
					str += '<li><a href="javascript:void(0)">'+common[that][i] + '</a></li>';
					if($(".hasSelect span").attr("name")==common[that][i]){
						self=i;
					}
				}
				$("#common-type-content").html(str).show();
				if($(".hasSelect span").attr("name") == $("#common-type-content a:eq("+self+")").text()){
					$("#common-type-content a:eq("+self+")").addClass('visit');
				}
			}
			else{
				$("#common-type a").removeClass('a-selected');
				$("#marjor-type").show();
				$("#common-type-content").hide();
			}
		});
		$("#marjor-type a").click(function(){
			var cont = "";
			$("#first-type li").removeClass('li-active');
			var str = '<li class="li-active">' +
	                  '<a href="javascript:void(0)">' +
	                  '<span>' + $(this).html() + '</span>'+
	                  ' <i class="icon-dropdown"></i>' +
	                  '</a>' +
	                  '</li>';
	        $("#first-type ul").append(str);
	        $(".isHide").hide();
	        var that = $(this).html();
	        var marjorCont = marjor[that];
	        for(var i in marjorCont){
	        	cont += '<li><a href="javascript:void(0)">' + i + '</a></li>';
	        }
	        $("#marjor-type-child").html(cont).show();
		});
		$("#marjor-type-child").on('click','a',function(){
			var leftCont = "",rightCont = "";
			var marjorChildKey = $(this).html();
	        var cont = marjorChildCont[marjorChildKey];
			$("#first-type li").removeClass('li-active');
			var str = '<li class="li-active">' +
	                  '<a href="javascript:void(0)">' +
	                  '<span>' + marjorChildKey + '</span>'+
	                  ' <i class="icon-dropdown"></i>' +
	                  '</a>' +
	                  '</li>';
	        $("#first-type ul").append(str);
	        $(".isHide").hide();
	        for(var i in cont){
	        	leftContParent = i;
	        	rightContParent = cont[i];
	        	break;
	        }
	        for(var i in cont){
	        	if(leftContParent === i){
	        		leftCont += '<li class="sli-active"><a href="javascript:void(0)">' + i + '</a></li>';
	        	}
	        	else{
	        		leftCont += '<li><a href="javascript:void(0)">' + i + '</a></li>';
	        	}
	        }
	        for(var i=0,len=rightContParent.length; i<len; i++){
	        	rightCont += '<li><a href="javascript:void(0)">' + rightContParent[i] + '</a></li>';
	        }
	        $("#grandson-left ul").html(leftCont);
	        $("#grandson-right ul").html(rightCont);
	        $("#marjor-type-grandson").show();
			$("#grandson-left").on('click','a',function(){
				var rightGrandsonCont = "";
				var marjorGrandsonKey = $(this).html();
				var gradsonCont = cont[marjorGrandsonKey];
				for(var i=0,len=gradsonCont.length; i<len; i++){
		        	rightGrandsonCont += '<li><a href="javascript:void(0)">' + gradsonCont[i] + '</a></li>';
		        	if($(".hasSelect span").attr("name")==gradsonCont[i]){
						self=i;
					}
		        }
		        $("#grandson-right ul").html(rightGrandsonCont);
		        if($(".hasSelect span").attr("name") == $("#grandson-right a:eq("+self+")").text()){
					$("#grandson-right a:eq("+self+")").addClass('visit');
				}
			});
		});
		$("#first-type").on('click','li',function(){
			$(this).nextAll().remove();
			$(this).addClass('li-active').siblings().removeClass('li-active');
			$(".isHide").hide();
		});
		$("#first-type").on('click','li:eq(0)',function(){
			$("#common-type").show();
			$("#common-type a").removeClass('a-selected');
			$("#marjor-type").show();
		});
		$("#first-type").on('click','li:eq(1)',function(){
			$("#marjor-type-child").show();
		});
		$("#first-type").on('click','li:eq(2)',function(){
			$("#marjor-type-grandson").show();
		});
		$("#common-type-content").on('click','a',function(){
			var isSelected = $(this).attr('class');
			if(isSelected !== 'visit'){
				if($(".hasSelect").children('span').length >= 1){
					$('.error').show();
					setTimeout(function(){
						$('.error').hide();
					},2000);
					return false;
				}
				else{
					$(this).addClass("visit").siblings().removeClass('visit');
					var str = '<span name="'+ $(this).html() +'">' + $(this).html() + '<i>×</i></span>';
					$(".hasSelect").append(str);
				}
			}
			else{
				$(this).removeClass("visit");
				var id = $(this).html();
				$(".hasSelect span[name='" + id + "']").remove();
			}
		});
		$(".hasSelect").on('click','i',function(){
			$(this).parent().remove();
			$('a').removeClass('visit');

		});
		$("#grandson-left").on('click','li',function(){
			$(this).addClass('sli-active').siblings().removeClass('sli-active');
		});
		$("#grandson-right").on('click','a',function(){
			var isSelected = $(this).attr('class');
			if(isSelected !== 'visit'){
				if($(".hasSelect").children('span').length >= 1){
					$('.error').show();
					setTimeout(function(){
						$('.error').hide();
					},2000);
					return false;
				}
				else{
					$(this).addClass("visit").siblings().removeClass('visit');
					var str = '<span name="'+ $(this).html() +'">' + $(this).html() + '<i>×</i></span>';
					$(".hasSelect").append(str);
				}
			}
			else{
				$(this).removeClass("visit");
				var id = $(this).html();
				$(".hasSelect span[name='" + id + "']").remove();
			}
		});
		$(".close").on('click',function(){
			parent.$("#xx").hide();
		});
		$('#sure').on('click',function(){
			parent.$("#xx").hide();
			var result = ($('.hasSelect span').html()).split('<')[0];
			parent.$('#classification').val(result);
		});
	}
}
