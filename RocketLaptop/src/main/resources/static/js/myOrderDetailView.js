$(function(){
	let starRating = 0;
	
	$(".star").on("click", function(){
		if(!$(this).hasClass("star-checked")){
			let len = $(this).attr("data-val");
			starRating = len;
			
			for(let i = 1; i <= len; i++){
				$(".star" + i).addClass("star-checked");
			}
		}else{
			$(".star-rating").find(".star").removeClass("star-checked");
			let len = $(this).attr("data-val");
			starRating = len;
			
			for(let i = 1; i <= len; i++){
				$(".star" + i).addClass("star-checked");
			}
		}
	});
		
	$(".reviewBoxBtn").on("click", function(){
		$(".review-content").val('');
		
		let star = $(".star");
		
		for(let i = 0; i < star.length; i++){
			if($(star[i]).hasClass("star-checked")){				
				$(star[i]).removeClass("star-checked");
			}
		}
	});
		
	$(".reviewCancelBtn").on("click", function(){
		starRating = 0;
	});
		
	$(".reviewAddBtn").on("click", function(e){
		e.preventDefault();
		
		if(starRating === 0){
			Swal.fire({
				icon: "warning",
				title: "리뷰 등록",
				text: "별점을 선택해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let review_content = $.trim($(".review-content").val()); 
		if(review_content === ""){
			Swal.fire({
				icon: "warning",
				title: "리뷰 등록",
				text: "리뷰 내용을 써주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let user_id = $("#user_id").val();
		let product_code = $(".productReview").val();
		
		let order_id = $("#myOrder_id").val();
		
		let data = {
			"user_id" : user_id,
			"product_code" : product_code,
			"review_star_rating" : starRating,
			"review_content" : review_content,
			"order_id" : order_id
		}
		
		$.ajax({
			url: "/user/product/reviewAdd",
			type: "POST",
			data: data
		}).done(function(res) {
			console.log(res)
			if(res.status === 200){
				Swal.fire({
					icon: "success",
					title: "리뷰 등록",
					text: "리뷰 등록이 완료되었습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/order/detail?order_id=" + order_id + "&user_id=" + user_id);
				})
			}else{
				Swal.fire({
					icon: "error",
					title: "리뷰 등록",
					text: "리뷰 등록 실패 했습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/order/detail?order_id=" + order_id + "&user_id=" + user_id);
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
	
	$(".orderCancelBtn").on("click", function(e){
		e.preventDefault();
		
		let order_id = $(this).attr("data-orderId");
		let user_id = $("#user_id").val();
		
		let data = {
			"order_id" : order_id,
			"order_state" : "주문취소",
			"user_id" : user_id
		}
		
		Swal.fire({
			title: "주문 취소 하시겠습니까?",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#df2525",
			cancelButtonColor: "gray",
			confirmButtonText: "취소",
			cancelButtonText: "닫기",
			allowOutsideClick: false,
		}).then((result) => {
			if (result.isConfirmed) {
				$.LoadingOverlay('show');
				$.ajax({
					url: "/user/order/payment/cancel",
					type: "POST",
					data: data,
				}).done(function(res) {
					console.log(res)
					if(res.status === 200){
						$.LoadingOverlay('hide');
						location.replace("/user/mypage/order/detail?order_id=" + order_id + "&user_id=" + user_id);
					}else{
						$.LoadingOverlay('hide');
						Swal.fire({
							icon: "error",
							title: "주문 취소",
							text: "주문 취소 실패 했습니다.",
							allowOutsideClick: false,
						}).then(() => {
							location.replace("/user/mypage/order/detail?order_id=" + order_id + "&user_id=" + user_id);
						})
					}
				}).fail(function(err) {
					console.log(err)
				})
			}
		})
	});
})