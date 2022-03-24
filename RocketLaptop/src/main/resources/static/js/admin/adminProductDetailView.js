$(function() {
	$(".productDeleteBtn").on("click", function(e) {
		e.preventDefault();

		let productCode = $("#productCode").val();

		Swal.fire({
			title: "상품을 삭제하시겠습니까?",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#df2525",
			cancelButtonColor: "gray",
			confirmButtonText: "삭제",
			cancelButtonText: "닫기",
			allowOutsideClick: false,
		}).then((result) => {
			if (result.isConfirmed) {
				console.log("SSS");

				$.ajax({
					url: "/admin/productDelete",
					type: "POST",
					data: { "product_code": productCode},
				}).done(function(res) {
					if(res === 1){
						Swal.fire({
							icon: "success",
							title: "상품삭제",
							text: "상품 삭제 완료되었습니다.",
							allowOutsideClick: false,
						}).then(() => {
							location.replace("/admin/productList");
						})
					}
				}).fail(function(err) {
					console.log(err)
				})
			}
		})

	});

	$(".productListBtn").on("click", function(e) {
		e.preventDefault();
		history.back();
	});
});