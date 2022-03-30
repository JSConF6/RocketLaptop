$(function(){
	$(".myQuestionListBtn").on("click", function(e){
		e.preventDefault();
		
		history.back();
	})
	
	$(".myQuestionDetailDeleteBtn").on("click", function(e){
		e.preventDefault();
		
		let num = $("#question_num").val();
		let user_id = $("#user_id").val();
		
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
					url: "/user/mypage/question/delete",
					type: "POST",
					data: {"num": num, "user_id" : user_id},
				}).done(function(res) {
					if(res === 1){
						Swal.fire({
							icon: "success",
							title: "문의사항 삭제",
							text: "문의사항 삭제 완료되었습니다.",
							allowOutsideClick: false,
						}).then(() => {
							location.replace("/user/mypage/question/list?user_id=" + user_id);
						})
					}
				}).fail(function(err) {
					console.log(err)
				})
			}
		})
	});
});