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
	
	$(".update_icon").on("click", function(){
		let type = $(this)[0].id;
		
		$.ajax({
			url: "/admin/updateListCount",
			type: "GET",
			data: {"type" : type},
		}).done(function(res) {
			console.log(res);
			if(res.updateClass === "userListCount"){
				$("." + res.updateClass).find('h3').text(res.listCount + "명")
			}else{
				$("." + res.updateClass).find('h3').text(res.listCount + "개")
			}
		}).fail(function(err) {
			console.log(err)
		})
	})
});