$(function(){
	$(".noticeAddBtn").on("click", function(e){
		e.preventDefault();
		
		if($.trim($("#notice_title").val()) === ""){
			Swal.fire({
				icon: "error",
				title: "공지사항 등록",
				text: "공지사항 제목을 입력하세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		if($.trim($("#notice_content").val()) === ""){
			Swal.fire({
				icon: "error",
				title: "공지사항 등록",
				text: "공지사항 내용을 입력하세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		$(".notice-form").submit();
	});
	
	$(".noticeDeleteBtn").on("click", function(e){
		e.preventDefault();
		
		let num = $(".notice_num").val();
		
		Swal.fire({
			title: "공지사항을 삭제하시겠습니까?",
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
					url: "/admin/noticeDelete",
					type: "POST",
					data: {"num": num},
				}).done(function(res) {
					if(res === 1){
						Swal.fire({
							icon: "success",
							title: "공지사항 삭제",
							text: "공지사항 삭제 완료되었습니다.",
							allowOutsideClick: false,
						}).then(() => {
							location.replace("/admin/noticeList");
						})
					}
				}).fail(function(err) {
					console.log(err)
				})
			}
		})
	});
	
});