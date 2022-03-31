function myGo(page){
	let comment_state = $('#myComment_state').val();
	let user_id = $("#user_id").val();
	let data = "comment_state=" + comment_state + "&page=" + page + "&user_id=" + user_id;
	myAjax(data);
}

function mySetPaging(href, digit, pageItem){
	let output = pageItem;
	gray = "";
	if(href == ""){
		gray = " gray";
	}
	anchor = "<a class='page-link" + gray + "'" + href + "><span>" + digit + "</span></a></li>";
	output += anchor;
	return output;
}

function myAjax(data){
	console.log(data);
	let output = "";
	
	$.ajax({
		url : "/user/mypage/question/list/ajax",
		type: "POST",
		data : data,
	}).done(function(res){
		console.log(res);
		$('#myComment_state').val(res.comment_state);
		$(".myQuestionListCount").text("문의사항 갯수 : " + res.pageHandler.listCount) + "개";
		if(res.pageHandler.listCount > 0){
			$(".empty_myQna").remove();
			$(".myQna_table").remove();
			
			let output = "<table class='table table-striped table-hover text-center myQna_table'>";
				output += "<thead><tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th></tr></thead><tbody>";
				
			let num = res.pageHandler.listCount - (res.pageHandler.page - 1) * res.pageHandler.limit;
			$(res.questionList).each(function(index, item){
				console.log(item);
				let date = item.qna_reg_date
				let qna_date = date.substring(0, 10);
				
				output += "<tr><td>" + num + "</td>";
				num = num - 1;
				output += "<td><a href='/user/mypage/question/detail?user_id=" + item.user_id + "&num=" + item.qna_num + "'>";
				output += item.qna_title + "&nbsp;&nbsp;&nbsp;</a>";
				
				if(item.comment_content === null){
					output += "<span class='text-secondary'>[답변대기]</span>";
				}
				
				if(item.comment_content !== null){
					output += "<span class='text-secondary'>[답변완료]</span>";
				}
				
				output += "</td><td>" + item.user_id + "</td>";
				output += "<td>" + qna_date + "</td></tr>";
			});
			$(".myQuestionAddBtnDiv").remove();
			output += "</tbody></table>";
			output += "<div class='text-end myQuestionAddBtnDiv'>"
			output += "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#myQuestionAddModal'>문의사항 쓰기</button>";
			output += "</div>";
			$(".myQna-content").append(output);
			
			$(".myQna_Pagination_nav").remove();
			output = '<nav class="d-flex justify-content-center myQna_Pagination_nav"><ul class="pagination">';
			
			digit = '&laquo;';
			href = "";
			pageItem = "";
			if(res.pageHandler.page > 1){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:myGo(" + (res.pageHandler.page - 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += mySetPaging(href, digit, pageItem);
			
			for(let i = res.pageHandler.startPage; i <= res.pageHandler.endPage; i++){
				digit = i;
				href = "";
				pageItem = "";
				if(i !== res.pageHandler.page){
					href = "href=javascript:myGo(" + i + ")";
					pageItem = "<li class='page-item'>";
				}
				
				if(i === res.pageHandler.page){					
					pageItem = "<li class='page-item active'>";
				}
				output += mySetPaging(href, digit, pageItem);
			}
			
			digit = "&raquo;";
			href = "";
			if(res.pageHandler.page < res.pageHandler.maxPage){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:myGo(" + (res.pageHandler.page + 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += mySetPaging(href, digit, pageItem);
			output += '</ul></nav>';
			
			$(".myQna-content").append(output);
		}else if(res.pageHandler.listCount === 0){
			output = '';
			$(".myQna_table").remove();
			$(".myQna_Pagination_nav").remove();
			$(".empty_myQna").remove();
			$(".myQuestionAddBtnDiv").remove();
			let comment_state = $('#myComment_state').val();
			var message = ['문의사항이 없습니다.', '답변대기 글이 없습니다.', '답변완료 글이 없습니다.'];
			output += '<div class="text-center mt-5 mb-5 empty_myQna"><h1>' + message[comment_state] + '</h1></div>';
			output += "<div class='text-end myQuestionAddBtnDiv'>"
			output += "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#myQuestionAddModal'>문의사항 쓰기</button>";
			output += "</div>";
			$('.myQna-content').append(output);
		}
	}).fail(function(err){
		console.log(err);
	});
}

$(function(){
	$(".myQuestionAddBtn").on("click", function(e){
		e.preventDefault();
		
		let qna_title = $.trim($("#question_title").val());
		if(qna_title === ""){
			Swal.fire({
				icon: "error",
				title: "문의사항 등록",
				text: "문의사항 제목을 입력하세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let qna_content = $.trim($("#question_content").val())
		if(qna_content === ""){
			Swal.fire({
				icon: "error",
				title: "문의사항 등록",
				text: "문의사항 내용을 입력하세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let data = {
			"user_id" : $("#user_id").val(),
			"qna_title" : qna_title,
			"qna_content" : qna_content,
		}
		
		$.ajax({
			url: "/user/mypage/question/add",
			type: "POST",
			data: data
		}).done(function(res) {
			if(res.status === 200){
				Swal.fire({
					icon: "success",
					title: "문의사항 등록",
					text: "문의사항 등록이 완료 되었습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/question/list?user_id=" + data.user_id);
				})
			}else{
				Swal.fire({
					icon: "success",
					title: "문의사항 등록",
					text: "문의사항 등록을 실패 했습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/question/list?user_id=" + data.user_id);
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
	})
	
	$("#myComment_state").on("change", function(){
		myGo(1);
	});
});