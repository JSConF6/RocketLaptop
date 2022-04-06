$(function(){
	$("#review_tab").on("click", function(){
		let product_code = $("#product_code").val();
		
		$.ajax({
			url: "/product/reviewList",
			type: "GET",
			data: {"product_code" : product_code}
		}).done(function(res) {
			console.log(res)
			
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
				let output  = "<div class='mt-3 text-center empty_review'><span class='fs-3'>등록된 상품리뷰가 없습니다.</span></div>";
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