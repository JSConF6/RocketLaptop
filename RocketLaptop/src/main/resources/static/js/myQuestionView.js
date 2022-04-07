$(function(){
	function questionList(){
		let user_id = $("#user_id").val();
		
		$.ajax({
			url: "/user/mypage/question/list",
			type: "GET",
			data: {"user_id" : user_id}
		}).done(function(res) {
			console.log(res)
			
			if(res.data.pageHandler.listCount > 0){
				$(".my-question-table").remove();
				
				$(".myQuestionListCount").text("내가 쓴 문의사항 갯수 : " + res.data.pageHandler.listCount + "개")
				
				let output = "<table class='table my-question-table mt-3 text-center'>";
				output += "<thead><tr><th>번호</th><th>답변상태</th><th>제목</th><th>작성자</th><th>등록일</th></tr></thead><tbody>";
				
				let num = res.data.pageHandler.listCount - (res.data.pageHandler.page - 1) * res.data.pageHandler.limit;
				$(res.data.questionList).each(function(index, item){
					let date = item.qna_reg_date.substring(0, 10);
					
					output += "<tr><td>" + num + "</td>";
					num = num - 1;
					
					if(item.qna_comment_yn === 'N'){
						output += "<td class='text-muted'>답변대기</td>";
					}else if(item.qna_comment_yn === 'Y'){
						output += "<td class='text-primary'>답변완료</td>";
					}
											
					output += "<td><a href='/user/mypage/question/detail?num=" + item.qna_num + "&user_id=" + user_id + "'>" + item.qna_title + "</a></td>";
					output += "<td>" + item.user_id + "</td>";
					output += "<td>" + date + "</td></tr>";
				});
				output += "</tbody></table>";
				
				$("#myQuestion").append(output);
				
				$(".myQuestionPagination").remove();
				output = '<nav class="d-flex justify-content-center myQuestionPagination"><ul class="pagination">';
			
				digit = '&laquo;';
				href = "";
				pageItem = "";
				if(res.data.pageHandler.page > 1){
					pageItem = "<li class='page-item'>";
					href = "href=javascript:myQnaGo(" + (res.data.pageHandler.page - 1) + ")";
				}
				pageItem = "<li class='page-item'>";
				output += myQnaSetPaging(href, digit, pageItem);
				
				for(let i = res.data.pageHandler.startPage; i <= res.data.pageHandler.endPage; i++){
					digit = i;
					href = "";
					pageItem = "";
					if(i !== res.data.pageHandler.page){
						href = "href=javascript:myQnaGo(" + i + ")";
						pageItem = "<li class='page-item'>";
					}
					
					if(i === res.data.pageHandler.page){					
						pageItem = "<li class='page-item active'>";
					}
					output += myQnaSetPaging(href, digit, pageItem);
				}
				
				digit = "&raquo;";
				href = "";
				if(res.data.pageHandler.page < res.data.pageHandler.maxPage){
					pageItem = "<li class='page-item'>";
					href = "href=javascript:myQnaGo(" + (res.data.pageHandler.page + 1) + ")";
				}
				pageItem = "<li class='page-item'>";
				output += myQnaSetPaging(href, digit, pageItem);
				output += '</ul></nav>';
				
				$("#myQuestion").append(output);
			}else if(res.data.pageHandler.listCount === 0){
				$(".my-question-table").remove();
				$(".empty_myQna").remove();
				$(".myQuestionPagination").remove();
				$(".myQuestionHeader").remove();
				let output  = "<div class='mt-5 text-center empty_myQna'><span class='fs-3'>등록하신 문의사항이 없습니다.</span></div>";
				$("#myQuestion").append(output);
			}
		}).fail(function(err) {
			console.log(err)
		})
	}
	questionList();
	
	$("#my-question-tab").on("click", function(){
		questionList();	
	})
});

function myQnaGo(page){
	let user_id = $('#user_id').val();
	let data = "user_id=" + user_id + "&page=" + page;
	myQnaAjax(data);
}
	
function myQnaSetPaging(href, digit, pageItem){
	let output = pageItem;
	gray = "";
	if(href == ""){
		gray = " gray";
	}
	anchor = "<a class='page-link" + gray + "'" + href + "><span>" + digit + "</span></a></li>";
	output += anchor;
	return output;
}
	
function myQnaAjax(data){
	console.log(data);
	let output = "";
	
	let user_id = $("#user_id").val();
		
	$.ajax({
		url: "/user/mypage/question/list",
		type: "GET",
		data: data
	}).done(function(res) {
		console.log(res)
		
		if(res.data.pageHandler.listCount > 0){
			$(".my-question-table").remove();
			
			$(".myQuestionListCount").text("내가 쓴 문의사항 갯수 : " + res.data.pageHandler.listCount + "개")
			
			output = "<table class='table my-question-table mt-3 text-center'>";
			output += "<thead><tr><th>번호</th><th>답변상태</th><th>제목</th><th>작성자</th><th>등록일</th></tr></thead><tbody>";
			
			let num = res.data.pageHandler.listCount - (res.data.pageHandler.page - 1) * res.data.pageHandler.limit;
			$(res.data.questionList).each(function(index, item){
				let date = item.qna_reg_date.substring(0, 10);
				
				output += "<tr><td>" + num + "</td>";
				num = num - 1;
				
				if(item.qna_comment_yn === 'N'){
					output += "<td class='text-muted'>답변대기</td>";
				}else if(item.qna_comment_yn === 'Y'){
					output += "<td class='text-primary'>답변완료</td>";
				}
										
				output += "<td><a href='/user/mypage/question/detail?num=" + item.qna_num + "&user_id=" + user_id + "'>" + item.qna_title + "</a></td>";
				output += "<td>" + item.user_id + "</td>";
				output += "<td>" + date + "</td></tr>";
			});
			output += "</tbody></table>";
			
			$("#myQuestion").append(output);
			
			$(".myQuestionPagination").remove();
			output = '<nav class="d-flex justify-content-center myQuestionPagination"><ul class="pagination">';
		
			digit = '&laquo;';
			href = "";
			pageItem = "";
			if(res.data.pageHandler.page > 1){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:myQnaGo(" + (res.data.pageHandler.page - 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += myQnaSetPaging(href, digit, pageItem);
			
			for(let i = res.data.pageHandler.startPage; i <= res.data.pageHandler.endPage; i++){
				digit = i;
				href = "";
				pageItem = "";
				if(i !== res.data.pageHandler.page){
					href = "href=javascript:myQnaGo(" + i + ")";
					pageItem = "<li class='page-item'>";
				}
				
				if(i === res.data.pageHandler.page){					
					pageItem = "<li class='page-item active'>";
				}
				output += myQnaSetPaging(href, digit, pageItem);
			}
			
			digit = "&raquo;";
			href = "";
			if(res.data.pageHandler.page < res.data.pageHandler.maxPage){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:myQnaGo(" + (res.data.pageHandler.page + 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += myQnaSetPaging(href, digit, pageItem);
			output += '</ul></nav>';
			
			$("#myQuestion").append(output);
		}else if(res.data.pageHandler.listCount === 0){
			$(".my-question-table").remove();
			$(".empty_myQna").remove();
			$(".myQuestionPagination").remove();
			$(".myQuestionHeader").remove();
			let output  = "<div class='mt-5 text-center empty_myQna'><span class='fs-3'>등록하신 문의사항이 없습니다.</span></div>";
			$("#myQuestion").append(output);
		}
	}).fail(function(err) {
		console.log(err)
	})
}