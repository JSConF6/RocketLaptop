$(function(){
	let user_id = $("#user_id").val();
	
	$(".leftBtn").on("click", function(){
		location.href="/";
	});
	
	$(".rightBtn").on("click", function(){
		location.href="/user/mypage/order/list?user_id=" + user_id;
	});
});