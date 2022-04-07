$(function(){
	$("#my-review-tab").on("click", function(){
		let user_id = $("#user_id").val();
		
		$.ajax({
			url: "/user/mypage/review/list",
			type: "GET",
			data: {"user_id" : user_id}
		}).done(function(res) {
			console.log(res)
			
			if(res.data.pageHandler.listCount > 0){
				$(".myReviewTable").remove();
				
				$(".myReviewListCount").text("내가 쓴 리뷰 갯수 : " + res.data.pageHandler.listCount + "개")
				
				let output = "<table class='table myReviewTable border-top border-bottom mt-3'><tbody>";
				
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
				
				$("#myReview").append(output);
				
				$(".myReviewPagination").remove();
				output = '<nav class="d-flex justify-content-center myReviewPagination"><ul class="pagination">';
			
				digit = '&laquo;';
				href = "";
				pageItem = "";
				if(res.data.pageHandler.page > 1){
					pageItem = "<li class='page-item'>";
					href = "href=javascript:myReviewGo(" + (res.data.pageHandler.page - 1) + ")";
				}
				pageItem = "<li class='page-item'>";
				output += myReviewSetPaging(href, digit, pageItem);
				
				for(let i = res.data.pageHandler.startPage; i <= res.data.pageHandler.endPage; i++){
					digit = i;
					href = "";
					pageItem = "";
					if(i !== res.data.pageHandler.page){
						href = "href=javascript:myReviewGo(" + i + ")";
						pageItem = "<li class='page-item'>";
					}
					
					if(i === res.data.pageHandler.page){					
						pageItem = "<li class='page-item active'>";
					}
					output += myReviewSetPaging(href, digit, pageItem);
				}
				
				digit = "&raquo;";
				href = "";
				if(res.data.pageHandler.page < res.data.pageHandler.maxPage){
					pageItem = "<li class='page-item'>";
					href = "href=javascript:myReviewGo(" + (res.data.pageHandler.page + 1) + ")";
				}
				pageItem = "<li class='page-item'>";
				output += myReviewSetPaging(href, digit, pageItem);
				output += '</ul></nav>';
				
				$("#myReview").append(output);
			}else if(res.data.pageHandler.listCount === 0){
				$(".myReviewTable").remove();
				$(".empty_myReview").remove();
				$(".myReviewPagination").remove();
				$(".myReviewHeader").remove();
				let output  = "<div class='mt-5 text-center empty_myReview'><span class='fs-3'>등록하신 상품리뷰가 없습니다.</span></div>";
				$("#myReview").append(output);
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
});

function myReviewGo(page){
	let user_id = $('#user_id').val();
	let data = "user_id=" + user_id + "&page=" + page;
	myReviewAjax(data);
}
	
function myReviewSetPaging(href, digit, pageItem){
	let output = pageItem;
	gray = "";
	if(href == ""){
		gray = " gray";
	}
	anchor = "<a class='page-link" + gray + "'" + href + "><span>" + digit + "</span></a></li>";
	output += anchor;
	return output;
}
	
function myReviewAjax(data){
	console.log(data);
	let output = "";
	
	$.ajax({
		url : "/user/mypage/review/list",
		type: "GET",
		data : data,
	}).done(function(res){
		console.log(res)
		
		if(res.data.pageHandler.listCount > 0){
			$(".myReviewTable").remove();
			
			$(".myReviewListCount").text("내가 쓴 리뷰 갯수 : " + res.data.pageHandler.listCount + "개")
			
			let output = "<table class='table myReviewTable border-top border-bottom mt-3'><tbody>";
			
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
			
			$("#myReview").append(output);
			
			$(".myReviewPagination").remove();
			output = '<nav class="d-flex justify-content-center myReviewPagination"><ul class="pagination">';
		
			digit = '&laquo;';
			href = "";
			pageItem = "";
			if(res.data.pageHandler.page > 1){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:myReviewGo(" + (res.data.pageHandler.page - 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += myReviewSetPaging(href, digit, pageItem);
			
			for(let i = res.data.pageHandler.startPage; i <= res.data.pageHandler.endPage; i++){
				digit = i;
				href = "";
				pageItem = "";
				if(i !== res.data.pageHandler.page){
					href = "href=javascript:myReviewGo(" + i + ")";
					pageItem = "<li class='page-item'>";
				}
				
				if(i === res.data.pageHandler.page){					
					pageItem = "<li class='page-item active'>";
				}
				output += myReviewSetPaging(href, digit, pageItem);
			}
			
			digit = "&raquo;";
			href = "";
			if(res.data.pageHandler.page < res.data.pageHandler.maxPage){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:myReviewGo(" + (res.data.pageHandler.page + 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += myReviewSetPaging(href, digit, pageItem);
			output += '</ul></nav>';
			
			$("#myReview").append(output);
		}else if(res.data.pageHandler.listCount === 0){
			$(".myReviewTable").remove();
			$(".empty_myReview").remove();
			$(".myReviewPagination").remove();
			$(".myReviewHeader").remove();
			let output  = "<div class='mt-5 text-center empty_myReview'><span class='fs-3'>등록하신 상품리뷰가 없습니다.</span></div>";
			$("#myReview").append(output);
		}
	}).fail(function(err) {
		console.log(err)
	})
}