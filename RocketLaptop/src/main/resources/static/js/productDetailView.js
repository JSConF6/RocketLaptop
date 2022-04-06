$(function(){
	let price = $("#price").val();
	let totalPrice = price;
	
	$(".productTotalPrice").text(Number(price).toLocaleString("en") + "원");
	
	$(".plus").on("click", function(){
		let num = $(".productCount").val();
		let plusNum = Number(num) + 1;
		
		if(plusNum >= 1000){
			$(".productCount").val(num);
		}else{
			totalPrice = price * plusNum;
			$(".productTotalPrice").text(Number(totalPrice).toLocaleString("en") + "원");
			$(".productCount").val(plusNum);
		}
	});
	
	$(".minus").click(function(){
		var num = $(".productCount").val();
		var minusNum = Number(num) - 1;
		   
		if(minusNum <= 0) {
			$(".productCount").val(num);
		} else {
			totalPrice = totalPrice - price;
			$(".productTotalPrice").text(Number(totalPrice).toLocaleString("en") + "원");
			$(".productCount").val(minusNum);          
		}
	});
	
	$(".cartBtn").on("click", function(e){
		e.preventDefault();
		let product_code = $("#product_code").val();
		let order_de_amount = $(".productCount").val();
		let user_id = $("#user_id").val();
		
		if(user_id === undefined){
			Swal.fire({
				icon: "warning",
				title: "장바구니 담기",
				text: "로그인 후 담을 수 있습니다.",
				allowOutsideClick: false,
			}).then(() => {
				location.href = "/login";
			})
			return false;
		}
		
		$.ajax({
				url: "/user/cart/add",
				type: "POST",
				data: {"product_code": product_code, "order_de_amount" : order_de_amount, "user_id": user_id},
		}).done(function(res) {
			console.log(res)
			if(res.status === 200){
				CartListCount();
				Swal.fire({
				  title: '장바구니 담기',
				  text: res.data,
				  icon: 'success',
				  showCancelButton: true,
				  confirmButtonColor: '#0d6efd',
				  cancelButtonColor: 'gray',
				  cancelButtonText: '계속 쇼핑',
				  confirmButtonText: '장바구니로',
				  allowOutsideClick: false,
				}).then((result) => {
				  if (result.isConfirmed) {
				    location.href = "/user/cart/list?user_id=" + user_id
				  }
				})
			}else{
				Swal.fire({
					icon: "warning",
					title: "장바구니 담기",
					text: res.data,
					allowOutsideClick: false,
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
		
	});
	
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
	
	$(".productDetailOrderBtn").on("click", function(e){
		e.preventDefault();
		
		let product_code = $("#product_code").val();
		let user_id = $("#user_id").val();
		let order_de_amount = $(".productCount").val();
		
		if(user_id === undefined){
			Swal.fire({
				icon: "warning",
				title: "상품 주문",
				text: "로그인 후 상품을 주문 하실 수 있습니다.",
				allowOutsideClick: false,
			}).then(() => {
				location.href = "/login";
			})
			return false;
		}
		
		$("#productDetailOrderAdd").append(orderAddFromInputAdd("order_de_amount", order_de_amount));
		$("#productDetailOrderAdd").append(orderAddFromInputAdd("user_id", user_id));
		$("#productDetailOrderAdd").append(orderAddFromInputAdd("product_code", product_code));
		
		$("#productDetailOrderAdd").submit();
	})
	
	function orderAddFromInputAdd(name, data){
		let output = "<input type='hidden' value=" + data + " name=" + name + " />";
		return output;
	}
	
	$("#details_tab").addClass("active");
	
	$("#review_tab").on("click", function(){
		let product_code = $("#product_code").val();
		
		$.ajax({
			url: "/product/reviewList",
			type: "GET",
			data: {"product_code" : product_code}
		}).done(function(res) {
			console.log(res)
			
			let starRating = 0;
			
			if(res.data.pageHandler.listCount > 0){
				$(".review-table").remove();
				
				$(".reviewListCount").text(res.data.pageHandler.listCount)
				
				let output = "<table class='table review-table border-top border-bottom mt-3'><tbody>";
				
				$(res.data.reviewList).each(function(index, item){
					let date = item.review_reg_date.substring(0, 10);
					
					output += "<tr><td><div class='d-flex justify-content-between'><div class='d-flex'><div>";
					
					for(let i = 0; i < item.review_star_rating; i++){
						output += "<span class='star-checked'>";
						output += "<i class='fa-solid fa-star'></i></span>";
					}
					
					for(let j = 0; j < (5 - item.review_star_rating); j++){
						output += "<span>";
						output += "<i class='fa-solid fa-star'></i></span>";
					}
					
					output += "</div>";
					output += "<div class='d-flex flex-column ms-5'>";
					output += "<div><span class='text-muted'>" + item.product_name + "</span></div>";
					output += "<div>" + item.review_content + "</div>";
					output += "</div></div>";
					output += "<div class='d-flex flex-column'>";
					output += "<div><span class='text-muted'>작성자 : " + item.user_id + "</span></div>";
					output += "<div><span class='text-muted'>등록일 : " + date + "</span></div>";
					output += "</div></div></td></tr>";
				});
				output += "</tbody></table>";
				
				$(".product-review").append(output);
				
				$(".reviewPagination").remove();
				output = '<nav class="d-flex justify-content-center reviewPagination"><ul class="pagination">';
			
				digit = '&laquo;';
				href = "";
				pageItem = "";
				if(res.data.pageHandler.page > 1){
					pageItem = "<li class='page-item'>";
					href = "href=javascript:reviewGo(" + (res.data.pageHandler.page - 1) + ")";
				}
				pageItem = "<li class='page-item'>";
				output += reviewSetPaging(href, digit, pageItem);
				
				for(let i = res.data.pageHandler.startPage; i <= res.data.pageHandler.endPage; i++){
					digit = i;
					href = "";
					pageItem = "";
					if(i !== res.data.pageHandler.page){
						href = "href=javascript:reviewGo(" + i + ")";
						pageItem = "<li class='page-item'>";
					}
					
					if(i === res.data.pageHandler.page){					
						pageItem = "<li class='page-item active'>";
					}
					output += reviewSetPaging(href, digit, pageItem);
				}
				
				digit = "&raquo;";
				href = "";
				if(res.data.pageHandler.page < res.data.pageHandler.maxPage){
					pageItem = "<li class='page-item'>";
					href = "href=javascript:reviewGo(" + (res.data.pageHandler.page + 1) + ")";
				}
				pageItem = "<li class='page-item'>";
				output += reviewSetPaging(href, digit, pageItem);
				output += '</ul></nav>';
				
				$(".product-review").append(output);
			}else if(res.data.pageHandler.listCount === 0){
				$(".review-table").remove();
				$(".empty_review").remove();
				$(".reviewPagination").remove();
				let output  = "<div class='mt-3 text-center'><span class='fs-3'>등록된 상품리뷰가 없습니다.</span></div>";
				$(".product-review").append(output);
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
});

function reviewGo(page){
	let product_code = $('#product_code').val();
	let data = "product_code=" + product_code + "&page=" + page;
	reviewAjax(data);
}
	
function reviewSetPaging(href, digit, pageItem){
	let output = pageItem;
	gray = "";
	if(href == ""){
		gray = " gray";
	}
	anchor = "<a class='page-link" + gray + "'" + href + "><span>" + digit + "</span></a></li>";
	output += anchor;
	return output;
}
	
function reviewAjax(data){
	console.log(data);
	let output = "";
	
	$.ajax({
		url : "/product/reviewList",
		type: "GET",
		data : data,
	}).done(function(res){
		console.log(res)
		if(res.data.pageHandler.listCount > 0){
			$(".review-table").remove();
			
			$(".reviewListCount").text(res.data.pageHandler.listCount);
			
			let starRating = 0;
			
			output = "<table class='table review-table border-top border-bottom mt-3'><tbody>";
			
			$(res.data.reviewList).each(function(index, item){
				let date = item.review_reg_date.substring(0, 10);
				
				output += "<tr><td><div class='d-flex justify-content-between'><div class='d-flex'><div>";
				for(let i = 0; i < item.review_star_rating; i++){
					output += "<span class='star-checked'>";
					output += "<i class='fa-solid fa-star'></i></span>";
				}
					
				for(let j = 0; j < (5 - item.review_star_rating); j++){
					output += "<span>";
					output += "<i class='fa-solid fa-star'></i></span>";
				}
				output += "</div>";
				output += "<div class='d-flex flex-column ms-5'>";
				output += "<div><span class='text-muted'>" + item.product_name + "</span></div>";
				output += "<div>" + item.review_content + "</div>";
				output += "</div></div>";
				output += "<div class='d-flex flex-column'>";
				output += "<div><span class='text-muted'>작성자 : " + item.user_id + "</span></div>";
				output += "<div><span class='text-muted'>등록일 : " + date + "</span></div>";
				output += "</div></div></td></tr>";
			});
			output += "</tbody></table>";
			
			$(".product-review").append(output);
			
			$(".reviewPagination").remove();
			output = '<nav class="d-flex justify-content-center reviewPagination"><ul class="pagination">';
		
			digit = '&laquo;';
			href = "";
			pageItem = "";
			if(res.data.pageHandler.page > 1){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:reviewGo(" + (res.data.pageHandler.page - 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += reviewSetPaging(href, digit, pageItem);
			
			for(let i = res.data.pageHandler.startPage; i <= res.data.pageHandler.endPage; i++){
				digit = i;
				href = "";
				pageItem = "";
				if(i !== res.data.pageHandler.page){
					href = "href=javascript:reviewGo(" + i + ")";
					pageItem = "<li class='page-item'>";
				}
				
				if(i === res.data.pageHandler.page){					
					pageItem = "<li class='page-item active'>";
				}
				output += reviewSetPaging(href, digit, pageItem);
			}
			
			digit = "&raquo;";
			href = "";
			if(res.data.pageHandler.page < res.data.pageHandler.maxPage){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:reviewGo(" + (res.data.pageHandler.page + 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += reviewSetPaging(href, digit, pageItem);
			output += '</ul></nav>';
			
			$(".product-review").append(output);
		}else if(res.data.pageHandler.listCount === 0){
			$(".review-table").remove();
			$(".empty_review").remove();
			$(".reviewPagination").remove();
			let output  = "<div class='mt-3 text-center'><span class='fs-3'>등록된 상품리뷰가 없습니다.</span></div>";
			$(".product-review").append(output);
		}
	}).fail(function(err){
		console.log(err);
	});
}