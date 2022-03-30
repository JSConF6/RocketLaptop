function go(page){
	let comment_state = $('#comment_state').val();
	let data = "comment_state=" + comment_state + "&page=" + page;
	ajax(data);
}

function setPaging(href, digit, pageItem){
	let output = pageItem;
	gray = "";
	if(href == ""){
		gray = " gray";
	}
	anchor = "<a class='page-link" + gray + "'" + href + "><span>" + digit + "</span></a></li>";
	output += anchor;
	return output;
}

function ajax(data){
	console.log(data);
	let output = "";
	
	$.ajax({
		url : "/question/list/ajax",
		type: "POST",
		data : data,
	}).done(function(res){
		console.log(res);
		$('#comment_state').val(res.comment_state);
		$(".questionListCount").text("문의사항 갯수 : " + res.pageHandler.listCount) + "개";
		if(res.pageHandler.listCount > 0){
			$(".empty_qna").remove();
			$(".qna_table").remove();
			
			let output = "<table class='table table-striped table-hover text-center qna_table'>";
				output += "<thead><tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th></tr></thead><tbody>";
				
			let num = res.pageHandler.listCount - (res.pageHandler.page - 1) * res.pageHandler.limit;
			$(res.questionList).each(function(index, item){
				console.log(item);
				let date = item.qna_reg_date
				let qna_date = date.substring(0, 10);
				
				output += "<tr><td>" + num + "</td>";
				num = num - 1;
				output += "<td><a href='/question/detail?num=" + item.qna_num + "'>";
				output += item.qna_title + "&nbsp;&nbsp;&nbsp;</a>";
				
				if(item.comment_content === null){
					output += "<span class='text-secondary'>[답변대기]</span>";
				}
				
				if(item.comment_content !== null){
					output += "<span class='text-secondary'>[답변완료]</span>";
				}
				
				output += "</td><td>" + item.user_id + "</td>";
				output += "<td>" + qna_date + "</td>";
				output += "<td>" + item.qna_readcount + "</td></tr>";
			});
			output += "</tbody></table>";
			$(".qna-content").append(output);
			
			$(".qna_pagination_nav").remove();
			output = '<nav class="d-flex justify-content-center qna_pagination_nav"><ul class="pagination">';
			
			digit = '&laquo;';
			href = "";
			pageItem = "";
			if(res.pageHandler.page > 1){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:go(" + (res.pageHandler.page - 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += setPaging(href, digit, pageItem);
			
			for(let i = res.pageHandler.startPage; i <= res.pageHandler.endPage; i++){
				digit = i;
				href = "";
				pageItem = "";
				if(i !== res.pageHandler.page){
					href = "href=javascript:go(" + i + ")";
					pageItem = "<li class='page-item'>";
				}
				
				if(i === res.pageHandler.page){					
					pageItem = "<li class='page-item active'>";
				}
				output += setPaging(href, digit, pageItem);
			}
			
			digit = "&raquo;";
			href = "";
			if(res.pageHandler.page < res.pageHandler.maxPage){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:go(" + (res.pageHandler.page + 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += setPaging(href, digit, pageItem);
			output += '</ul></nav>';
			
			$(".qna-content").append(output);
		}else if(res.pageHandler.listCount === 0){
			output = '';
			$(".qna_table").remove();
			$(".qna_pagination_nav").remove();
			$(".empty_qna").remove();
			let comment_state = $('#comment_state').val();
			var message = ['문의사항이 없습니다.', '답변대기 글이 없습니다.', '답변완료 글이 없습니다.'];
			output += '<div class="text-center mt-5 mb-5 qnaNo"><h1>' + message[comment_state] + '</h1></div>';
			$('.qna-content').append(output);
		}
	}).fail(function(err){
		console.log(err);
	});
}

$(function(){
	$("#comment_state").on("change", function(){
		go(1);
	});
});