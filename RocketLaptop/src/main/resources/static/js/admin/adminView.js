$(function(){
	let url = window.location.pathname.split("/")[2];
	
	if(url === undefined){
		$("#home").addClass('active');	
	}else if(url.includes("notice")){
		$("#notice").addClass('active');
	}else if(url.includes("question")){
		$("#question").addClass('active');
	}else if(url.includes("order")){
		$("#order").addClass('active');
	}else if(url.includes("product")){
		$("#product").addClass('active');
	}else if(url.includes("user")){
		$("#user").addClass('active');
	}
});