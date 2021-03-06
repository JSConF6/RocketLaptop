$(function(){
	
	function MainCategoryList(){
		$.ajax({
			url: "/MainCategoryList",
			type: "GET",
		}).done(function(res) {
			console.log(res);
			$(".category > .category-menu").empty();
			let output = "<li><button class='dropdown-item' type='button'><a href='/product/list'>전체</a></button></li>";
			for(let i = 0; i < res.length; i++){
				output += "<li><button class='dropdown-item' type='button'><a href=" + "/product/category/list?" + "category_code=" + res[i].category_code + ">" + res[i].category_name + "</a></button></li>";
			}
			$(".category > .category-menu").append(output);
		}).fail(function(err) {
			console.log(err)
		})
	}
	
	MainCategoryList();
	
	if($("#user_id").val() !== undefined || $("user_role").val() === "ROLE_USER"){
		CartListCount();	
	}
	
	function CartListCount(){
		let user_id = $("#user_id").val();
		
		$.ajax({
			url: "/user/cartListCount",
			type: "GET",
			data: {"user_id": user_id}
		}).done(function(res) {
			$("#cart-badge").text(res);
		}).fail(function(err) {
			console.log(err)
		})
	}
});