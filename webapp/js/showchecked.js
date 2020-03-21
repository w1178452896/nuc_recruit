$(document).ready(function() {
	$("#keyword").val($("#hidkw").val());
	console.log($("#keyword").val());

	$("input[name='experience']").each(function() {
		if ($(this).val() == $("#hidwy").val()) {
			$(this).attr("checked", 'checked');
		}
	});

	$("input[name='eduRequest']").each(function() {
		if ($(this).val() == $("#hided").val()) {
			$(this).attr("checked", 'checked');
		}
	});

	$("input[name='salary']").each(function() {
		if ($(this).val() == $("#hidmn").val()) {
			$(this).attr("checked", 'checked');
		}
	});

	$("#city").val($("#hidct").val());

})