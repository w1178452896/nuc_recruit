$("#resform").submit(function() {
	if ($("#file_input").val() == "") {
		alert("头像不能为空！");
		return false;
	} else if ($("#birhday").val() == "") {
		alert("出生年月不能为空！");
		return false;
	} else if ($("#city").val() == "") {
		alert("居住城市不能为空！");
		return false;
	} else if ($("#s_time").val() == "") {
		alert("教育经历的开始时间不能为空！");
		return false;
	} else if ($("#e_time").val() == "") {
		alert("教育经历的结束时间不能为空！");
		return false;
	} 
	else if ($("#pes_time").val() == "") {
		alert("实习经历的开始时间不能为空！");
		return false;
	} 
	else if ($("#pee_time").val() == "") {
		alert("实习经历的结束时间不能为空！");
		return false;
	} 
	else if ($("#ps_time").val() == "") {
		alert("项目一的开始时间不能为空！");
		return false;
	} 
		else if ($("#pe_time").val() == "") {
		alert("项目一的结束时间不能为空！");
		return false;
	} 
		else if ($("#ps_time1").val() == "") {
		alert("项目二的开始时间不能为空！");
		return false;
	} 
		else if ($("#pe_time1").val() == "") {
		alert("项目二的结束时间不能为空！");
		return false;
	} 
})