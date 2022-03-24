$(function(){
	
	$(".noticeModifyBtn").on("click", function(e){
		e.preventDefault();
		
		let notice_num = $("#notice_num").val();
		let notice_title = $("#notice_title").val();
		let notice_content = $("#notice_content").val(); 
		
		$.ajax({
			url: "/admin/noticeModify",
			type: "POST",
			data: {"notice_num": notice_num, 
				   "notice_title" : notice_title,
				   "notice_content" : notice_content},
		}).done(function(res) {
			console.log(res)
			if(res.status === 200){
				Swal.fire({
					icon: "success",
					title: "공지사항 수정",
					text: "공지사항 수정 완료",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/admin/noticeDetail?num=" + notice_num);
				})
			}else{
				Swal.fire({
					icon: "success",
					title: "공지사항 수정",
					text: "공지사항 수정 실패",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/admin/noticeList");
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
	
	$(".noticeModifyCancelBtn").on("click", function(e){
		e.preventDefault();
		history.back();
	}); // productAddCancelBtn end
});