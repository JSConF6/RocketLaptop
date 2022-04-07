$(function(){
	let user_id = $("#user_id").val();
	
	$(".mypageOrder").on("click", function(){
		location.href="/user/mypage/order/list?user_id=" + user_id;
	});
	
	$(".mypageUserInfo").on("click", function(){
		location.href="/user/mypage/userInfo?user_id=" + user_id;
	});
	
	$(".mypageActivity").on("click", function(){
		location.href="/user/mypage/activity/list?user_id=" + user_id;
	});
	
	$(".mypageAddress").on("click", function(){
		location.href="/user/mypage/address/list?user_id=" + user_id;
	});
});