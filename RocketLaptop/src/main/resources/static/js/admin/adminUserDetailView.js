$(function(){
	
	$(".userListBtn").on("click", function(e){
		e.preventDefault();
		location.href = "/admmin/userList";
	});
});