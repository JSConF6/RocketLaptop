$(function(){
	$(".search_field").on("change", function(){
		const selectedValue = $(this).val();
		$(".search_word").val('');
		const message = ["상품명", "카테고리명"];
		$(".search_word").attr("placeholder", message[selectedValue] + " 입력하세요");
	});
	
	$(".productSearchBtn").on("click", function(e){
		e.preventDefault();
		
		if($(".search_word").val() === ""){
			Swal.fire({
				icon: "warning",
				title: "상품검색",
				text: "검색어를 입력 해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		$("#search-bar").submit();
	})
	
	const searchUrl = window.location.pathname.split("/")[2];
	
	if(searchUrl === 'search'){
		$(".product_search_field").val($(".search_field").val());
	}
});