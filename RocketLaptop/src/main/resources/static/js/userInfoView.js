$(function(){
	$(".userUpdateBtn").on("click", function(e){
		e.preventDefault();
		
		let email = $.trim($("#update-email").val());
		if(email === ""){
			Swal.fire({
				icon: "warning",
				title: "회원정보수정",
				text: "이메일을 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		const emailReg = /^\w+@\w+[.]\w{3}$/;
		if(!emailReg.test(email)){
			Swal.fire({
				icon: "warning",
				title: "회원정보수정",
				text: "이메일을 형식에 맞게 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}

		let phone = $.trim($("#update-phone").val());
		if(phone === ""){
			Swal.fire({
				icon: "warning",
				title: "회원정보수정",
				text: "전화번호를 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		const phoneReg = /^\d{3}\d{3,4}\d{4}$/;
		if(!phoneReg.test(phone)){
			Swal.fire({
				icon: "warning",
				title: "회원정보수정",
				text: "전화번호를 형식에 맞게 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let data = {
			"user_id" : $("#user_id").val(),
			"user_email" : email,
			"user_phone" : phone,
		}
		
		$.ajax({
			url: "/user/mypage/userUpdate",
			type: "POST",
			data: data
		}).done(function(res) {
			console.log(res);
			if(res.status === 200){
				Swal.fire({
					icon: "success",
					title: "회원 정보 수정",
					text: "회원 정보 수정이 완료되었습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/userInfo?user_id=" + data.user_id);
				});
			}else{
				Swal.fire({
					icon: "error",
					title: "회원 정보 수정",
					text: "회원 정보 수정 실패했습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/userInfo?user_id=" + data.user_id);
				});
			}
		}).fail(function(err) {
			console.log(err);
		})
	});
	
	$(".passwordUpdateBtn").on("click", function(e){
		e.preventDefault();
		
		let currentPassword = $.trim($("#currentPassword").val());
		if(currentPassword === ""){
			Swal.fire({
				icon: "warning",
				title: "비밀번호 변경",
				text: "현재 비밀번호를 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let newPassword = $.trim($("#newPassword").val());
		if(newPassword === ""){
			Swal.fire({
				icon: "warning",
				title: "비밀번호 변경",
				text: "새로운 비밀번호를 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let reNewPassword = $.trim($("#reNewPassword").val());
		if(reNewPassword === ""){
			Swal.fire({
				icon: "warning",
				title: "비밀번호 변경",
				text: "새로운 비밀번호를 다시 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let data = {
			"user_id" : $("#user_id").val(),
			"currentPassword" : currentPassword,
			"newPassword" : newPassword,
			"reNewPassword" : reNewPassword,
		}
		
		$.ajax({
			url: "/user/mypage/updatePassword",
			type: "POST",
			data: data
		}).done(function(res) {
			console.log(res);
			if(res.data === 1){
				Swal.fire({
					icon: "success",
					title: "비밀번호 변경",
					text: "비밀번호가 변경되었습니다. 다시 로그인 해주세요.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/logout");
				});
			}else{
				Swal.fire({
					icon: "error",
					title: "비밀번호 변경",
					text: "다시 입력 해주세요.",
					allowOutsideClick: false,
				}).then(() => {
					$("#currentPassword").val("").focus();
					$("#newPassword").val("").focus();
					$("#reNewPassword").val("").focus();
				});
			}
		}).fail(function(err) {
			console.log(err);
		})
		
	});
});