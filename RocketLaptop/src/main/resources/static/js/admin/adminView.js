$(function(){
	let pageName = $.trim($(".pageName").val());
	$(".admin-link").removeClass('active');
	$("#" + pageName).addClass('active');
	
	let result = $(".result").val();
	if(result === "productAddSuccess"){
		Swal.fire({
			icon: "success",
			title: "상품등록",
			text: "상품이 등록되었습니다.",
			allowOutsideClick: false,
		})
	}
});