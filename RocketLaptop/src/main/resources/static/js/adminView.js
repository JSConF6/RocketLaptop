$(function(){
	let pageName = $.trim($(".pageName").val());
	$(".admin-link").removeClass('active');
	$("#" + pageName).addClass('active');
});