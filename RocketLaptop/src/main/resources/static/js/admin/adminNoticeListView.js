$(function(){
	$(".noticeAddBtn").on("click", function(e){
		e.preventDefault();
		
		let notice_title = $.trim($("#notice_title").val());
		if(notice_title === ""){
			Swal.fire({
				icon: "error",
				title: "공지사항 등록",
				text: "공지사항 제목을 입력하세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let notice_content = $.trim($("#notice_content").val())
		if(notice_content === ""){
			Swal.fire({
				icon: "error",
				title: "공지사항 등록",
				text: "공지사항 내용을 입력하세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let data = {
			"notice_title" : notice_title,
			"notice_content" : notice_content,
		}
		
		$.ajax({
			url: "/admin/noticeAdd",
			type: "POST",
			data: data
		}).done(function(res) {
			if(res.status === 200){
				Swal.fire({
					icon: "success",
					title: "공지사항 등록",
					text: "공지사항 등록이 완료되었습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/admin/noticeList");
				})
			}else{
				Swal.fire({
					icon: "success",
					title: "공지사항 등록",
					text: "공지사항 등록을 실패했습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/admin/noticeList");
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
	
});