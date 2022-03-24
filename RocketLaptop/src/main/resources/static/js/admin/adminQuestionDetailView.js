$(function(){
	
	$(".CommentAddBtn").on("click", function(e){
		e.preventDefault();
		
		let num = $("#question_num").val();
		
		let comment_content = $.trim($("#comment_content").val());
		if(comment_content === ""){
			Swal.fire({
				icon: "warning",
				title: "답변달기",
				text: "답변 내용을 써주세요.",
				allowOutsideClick: false,
			})
			
			return false;
		}
		
		$.ajax({
			url: "/admin/commentAdd",
			type: "POST",
			data: {"num": num, "comment_content" : comment_content},
		}).done(function(res) {
			console.log(res)
			if(res === 1){
				Swal.fire({
					icon: "success",
					title: "답변",
					text: "답변 달기 성공했습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/admin/questionDetail?num=" + num);
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
	
	$(".questionDetailDeleteBtn").on("click", function(e){
		e.preventDefault();
		
		let num = $("#question_num").val();
		
		Swal.fire({
			title: "문의사항을 삭제하시겠습니까?",
			icon: "warning",
			showCancelButton: true,
			confirmButtonColor: "#df2525",
			cancelButtonColor: "gray",
			confirmButtonText: "삭제",
			cancelButtonText: "닫기",
			allowOutsideClick: false,
		}).then((result) => {
			if (result.isConfirmed) {

				$.ajax({
					url: "/admin/questionDelete",
					type: "POST",
					data: {"num": num},
				}).done(function(res) {
					if(res === 1){
						Swal.fire({
							icon: "success",
							title: "문의사항 삭제",
							text: "문의사항 삭제 완료되었습니다.",
							allowOutsideClick: false,
						}).then(() => {
							location.replace("/admin/questionList");
						})
					}
				}).fail(function(err) {
					console.log(err)
				})
			}
		})
	});
	
	$(".questionListBtn").on("click", function(e){
		e.preventDefault();
		history.back();
	});
});