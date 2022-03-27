$(function(){
	$(".search_field").on("change", function(){
		const selectedValue = $(this).val();
		$(".search_word").val('');
		const message = ["상품명", "카테고리명"];
		$(".search_word").attr("placeholder", message[selectedValue] + " 입력하세요");
	});
});