$(function(){
	$(".find_id_btn").on("click", function(e){
		e.preventDefault();
		
		let findUserName = $.trim($("#find_id_user_name").val());
		if(findUserName === ""){
			Swal.fire({
				icon: "warning",
				title: "아이디 비밀번호 찾기",
				text: "이름을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let findUserEmail = $.trim($("#find_id_user_email").val());
		if(findUserEmail === ""){
			Swal.fire({
				icon: "warning",
				title: "아이디 비밀번호 찾기",
				text: "이메일을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		const pattern = /^\w+@\w+[.]\w{3}$/;
		if(!pattern.test(findUserEmail)){
			Swal.fire({
				icon: "warning",
				title: "아이디 비밀번호 찾기",
				text: "이메일 형식에 맞게 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let data = {
			"user_name" : findUserName,
			"user_email" : findUserEmail,
		};
		
		$.ajax({
			url: "/findIdProcess",
			type: "POST",
			data: data
		}).done(function(res) {
			if(res.status === 200){
					Swal.fire({
						icon: "success",
						title: "아이디 비밀번호 찾기",
						text: "해당하는 정보의 아이디는 " + res.data + " 입니다.",
						allowOutsideClick: false,
					}).then(() => {
						$("#find_id_user_name").val('');
						$("#find_id_user_email").val('');
					})
			}else{
				Swal.fire({
					icon: "error",
					title: "아이디 비밀번호 찾기",
					text: res.data,
					allowOutsideClick: false,
				}).then(() => {
					$("#find_id_user_name").val('');
					$("#find_id_user_email").val('');
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
	
	$(".find_passwrod_btn").on("click", function(e){
		e.preventDefault();
		
		let findUserId = $.trim($("#find_password_user_id").val());
		if(findUserId === ""){
			Swal.fire({
				icon: "warning",
				title: "아이디 비밀번호 찾기",
				text: "아이디를 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let findUserName = $.trim($("#find_password_user_name").val());
		if(findUserName === ""){
			Swal.fire({
				icon: "warning",
				title: "아이디 비밀번호 찾기",
				text: "이름을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let findUserEmail = $.trim($("#find_password_user_email").val());
		if(findUserEmail === ""){
			Swal.fire({
				icon: "warning",
				title: "아이디 비밀번호 찾기",
				text: "이메일을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		const pattern = /^\w+@\w+[.]\w{3}$/;
		if(!pattern.test(findUserEmail)){
			Swal.fire({
				icon: "warning",
				title: "아이디 비밀번호 찾기",
				text: "이메일 형식에 맞게 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let data = {
			"user_id" : findUserId,
			"user_name" : findUserName,
			"user_email" : findUserEmail,
		};
		
		$.LoadingOverlay('show');
		
		$.ajax({
			url: "/findPasswordProcess",
			type: "POST",
			data: data
		}).done(function(res) {
			if(res.status === 200){
				$.LoadingOverlay("hide");
					Swal.fire({
						icon: "success",
						title: "아이디 비밀번호 찾기",
						text: res.data,
						allowOutsideClick: false,
					}).then(() => {
						location.replace("/login");
					})
			}else{
				Swal.fire({
					icon: "error",
					title: "아이디 비밀번호 찾기",
					text: res.data,
					allowOutsideClick: false,
				}).then(() => {
					$("#find_password_user_id").val('');
					$("#find_password_user_name").val('');
					$("#find_password_user_email").val('');
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
});