$(function(){
	$(document).on("click", ".qnaSecret", function(){		
		$(".qna-table").find(".commentOpen").removeClass("commentOpen");
		
		$(".answerBox").insertAfter($(this).parent().parent());
		
		$(this).addClass("commentOpen");
		
				
		let num = $(this).attr("data-qnaNum");
		console.log(num)
		$.ajax({
			url: "/product/question/detail",
			type: "GET",
			data: {"num": num}
		}).done(function(res) {
			console.log(res)
			
			if(res.data.qna_comment_yn === 'N'){
				$(".answer").css("display", "none");
				$(".regInfo").css("display", "none");
				$(".question span").text(res.data.qna_content);
			}else if(res.data.qna_comment_yn === "Y"){
				let date = res.data.comment_reg_date.substring(0, 10);
				$(".answer").css("display", "block");
				$(".regInfo").css("display", "block");
				$(".answer span").text(res.data.comment_content);
				$(".regInfo span").text("답변 등록일 : " + date);
				$(".question span").text(res.data.qna_content);
			}
		}).fail(function(err) {
			console.log(err)
		})
		
		$(".answerBox").css("display", 'table-row');
	});
	
	$(document).on("click", ".locked", function(){
		Swal.fire({
			icon: "warning",
			title: "상품문의",
			text: "비밀글은 작성자만 볼 수 있습니다.",
			allowOutsideClick: false,
		})
	});
	
	$(document).on("click", ".commentOpen", function(){
		$(".answerBox").appendTo(".qna-table");
		
		$(".answerBox").css("display", 'none');
		
		$(this).removeClass("commentOpen");
	});
	
	$(".productQnaAddBtn").on("click", function(e){
		e.preventDefault();
		
		let qna_title = $.trim($("#qnaTitle").val());
		if(qna_title === ""){
			Swal.fire({
				icon: "warning",
				title: "상품문의",
				text: "제목을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let qna_content = $.trim($("#qnaContent").val());
		if(qna_content === ""){
			Swal.fire({
				icon: "warning",
				title: "상품문의",
				text: "내용을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let qna_secret = $("#qnaSecretCheckBox").is(":checked");
		let user_id = $("#user_id").val();
		let product_code = $("#product_code").val();
		
		let data = {
			"user_id" : user_id,
			"product_code" : product_code,
			"qna_title" : qna_title,
			"qna_content" : qna_content,
			"qna_secret" : qna_secret,
		}
		
		$.ajax({
			url: "/user/product/question/add",
			type: "POST",
			data: data
		}).done(function(res) {
			console.log(res);
			if(res.status === 200){
				Swal.fire({
					icon: "success",
					title: "상품문의",
					text: "문의사항이 접수 되었습니다. 답변을 기다려 주세요.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/product/detail?product_code=" + product_code);
				})
			}else{
				Swal.fire({
					icon: "success",
					title: "상품문의",
					text: "문의사항이 접수 실패했습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/product/detail?product_code=" + product_code);
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
	
	$("#qna_tab").on("click", function(){
		let product_code = $("#product_code").val();
		let user_id = $("#user_id").val();
		let user_role = $("#user_role").val();
		
		$.ajax({
			url: "/product/question/list",
			type: "GET",
			data: {"product_code" : product_code}
		}).done(function(res) {
			console.log(res)
			
			if(res.data.pageHandler.listCount > 0){
				$(".qna-table").remove();
				$(".qnaAddBox").remove();
				
				$(".qnaListCount").text(res.data.pageHandler.listCount)
				
				let output = "<table class='table qna-table mt-3'>";
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
					
					if(item.qna_secret === 'true'){
						if(user_id === item.user_id || user_role === "ROLE_ADMIN"){							
							output += "<td><span class='qnaSecret focusPointer' data-qnaNum='" + item.qna_num + "'>" + item.qna_title + "&nbsp;";
						}else{
							output += "<td><span class='locked focusDefault'>" + item.qna_title + "&nbsp;";
						}
						output += "<i class='fa-solid fa-lock'></i>";
						output += "</span></td>";
					}else{
						output += "<td><span class='qnaSecret focusPointer' data-qnaNum='" + item.qna_num + "'>" + item.qna_title + "</span></td>";
					}
					
					output += "<td>" + item.user_id + "</td>";
					output += "<td>" + date + "</td></tr>";
				});
				output += "</tbody></table>";
				
				if(user_id !== undefined){
					output += "<div class='mt-3 text-end qnaAddBox'><button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#qna_box'>문의사항 쓰기</button></div>"
				}
				
				$(".product-qna").append(output);
				
				$(".qnaPagination").remove();
				output = '<nav class="d-flex justify-content-center qnaPagination"><ul class="pagination">';
			
				digit = '&laquo;';
				href = "";
				pageItem = "";
				if(res.data.pageHandler.page > 1){
					pageItem = "<li class='page-item'>";
					href = "href=javascript:qnaGo(" + (res.data.pageHandler.page - 1) + ")";
				}
				pageItem = "<li class='page-item'>";
				output += qnaSetPaging(href, digit, pageItem);
				
				for(let i = res.data.pageHandler.startPage; i <= res.data.pageHandler.endPage; i++){
					digit = i;
					href = "";
					pageItem = "";
					if(i !== res.data.pageHandler.page){
						href = "href=javascript:qnaGo(" + i + ")";
						pageItem = "<li class='page-item'>";
					}
					
					if(i === res.data.pageHandler.page){					
						pageItem = "<li class='page-item active'>";
					}
					output += qnaSetPaging(href, digit, pageItem);
				}
				
				digit = "&raquo;";
				href = "";
				if(res.data.pageHandler.page < res.data.pageHandler.maxPage){
					pageItem = "<li class='page-item'>";
					href = "href=javascript:qnaGo(" + (res.data.pageHandler.page + 1) + ")";
				}
				pageItem = "<li class='page-item'>";
				output += qnaSetPaging(href, digit, pageItem);
				output += '</ul></nav>';
				
				$(".product-qna").append(output);
				
				output = "<tr class='answerBox'><td colspan='5'>"
				output += "<div class='question'><i class='fa-solid fa-circle-question'></i>&nbsp;<span>asd</span></div>"
				output += "<div class='answer'><i class='fa-brands fa-adn'></i>&nbsp;<span>asd</span></div>"
				output += "<div class='regInfo'><span>asd</span></div></td></tr>"
				
				$(".qna-table tbody").append(output);
			}else if(res.data.pageHandler.listCount === 0){
				$(".qna-table").remove();
				$(".empty_qna").remove();
				$(".qnaAddBox").remove();
				$(".qnaPagination").remove();
				let output  = "<div class='mt-3 text-center empty_qna'><span class='fs-3'>등록된 문의사항이 없습니다.</span></div>";
				if(user_id !== undefined){
					output += "<div class='mt-3 text-end qnaAddBox'><button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#qna_box'>문의사항 쓰기</button></div>"
				}
				$(".product-qna").append(output);
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
});

function qnaGo(page){
	let product_code = $('#product_code').val();
	let data = "product_code=" + product_code + "&page=" + page;
	qnaAjax(data);
}
	
function qnaSetPaging(href, digit, pageItem){
	let output = pageItem;
	gray = "";
	if(href == ""){
		gray = " gray";
	}
	anchor = "<a class='page-link" + gray + "'" + href + "><span>" + digit + "</span></a></li>";
	output += anchor;
	return output;
}
	
function qnaAjax(data){
	console.log(data);
	let output = "";
	
	let user_id = $("#user_id").val();
	let user_role = $("#user_role").val();
	
	$.ajax({
		url: "/product/question/list",
		type: "GET",
		data: data
	}).done(function(res) {
		console.log(res)
		
		if(res.data.pageHandler.listCount > 0){
			$(".qna-table").remove();
			$(".qnaAddBox").remove();
			
			$(".qnaListCount").text(res.data.pageHandler.listCount)
			
			output = "<table class='table qna-table mt-3'>";
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
				
				if(item.qna_secret === 'true'){
					if(user_id === item.user_id || user_role === 'ROLE_ADMIN'){							
						output += "<td><span class='qnaSecret focusPointer' data-qnaNum='" + item.qna_num + "'>" + item.qna_title + "&nbsp;";
					}else{
						output += "<td><span class='locked focusDefault'>" + item.qna_title + "&nbsp;";
					}
					output += "<i class='fa-solid fa-lock'></i>";
					output += "</span></td>";
				}else{
					output += "<td><span class='qnaSecret focusPointer' data-qnaNum='" + item.qna_num + "'>" + item.qna_title + "</span></td>";
				}
				
				output += "<td>" + item.user_id + "</td>";
				output += "<td>" + date + "</td></tr>";
			});
			output += "</tbody></table>";
			
			if(user_id !== undefined){
				output += "<div class='mt-3 text-end qnaAddBox'><button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#qna_box'>문의사항 쓰기</button></div>"
			}
			
			$(".product-qna").append(output);
			
			$(".qnaPagination").remove();
			output = '<nav class="d-flex justify-content-center qnaPagination"><ul class="pagination">';
		
			digit = '&laquo;';
			href = "";
			pageItem = "";
			if(res.data.pageHandler.page > 1){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:qnaGo(" + (res.data.pageHandler.page - 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += qnaSetPaging(href, digit, pageItem);
			
			for(let i = res.data.pageHandler.startPage; i <= res.data.pageHandler.endPage; i++){
				digit = i;
				href = "";
				pageItem = "";
				if(i !== res.data.pageHandler.page){
					href = "href=javascript:qnaGo(" + i + ")";
					pageItem = "<li class='page-item'>";
				}
				
				if(i === res.data.pageHandler.page){					
					pageItem = "<li class='page-item active'>";
				}
				output += qnaSetPaging(href, digit, pageItem);
			}
			
			digit = "&raquo;";
			href = "";
			if(res.data.pageHandler.page < res.data.pageHandler.maxPage){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:qnaGo(" + (res.data.pageHandler.page + 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += qnaSetPaging(href, digit, pageItem);
			output += '</ul></nav>';

			$(".product-qna").append(output);
			
			output = "<tr class='answerBox'><td colspan='5'>"
			output += "<div class='question'><i class='fa-solid fa-circle-question'></i>&nbsp;<span>asd</span></div>"
			output += "<div class='answer'><i class='fa-brands fa-adn'></i>&nbsp;<span>asd</span></div>"
			output += "<div class='regInfo'><span>asd</span></div></td></tr>"
			
			$(".qna-table tbody").append(output);		
		}else if(res.data.pageHandler.listCount === 0){
			$(".qna-table").remove();
			$(".empty_qna").remove();
			$(".qnaAddBox").remove();
			$(".qnaPagination").remove();
			let output  = "<div class='mt-3 text-center empty_qna'><span class='fs-3'>등록된 문의사항이 없습니다.</span></div>";
			if(user_id !== undefined){
				output += "<div class='mt-3 text-end qnaAddBox'><button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#qna_box'>문의사항 쓰기</button></div>"
			}
			$(".product-qna").append(output);
		}
	}).fail(function(err) {
		console.log(err)
	})
}