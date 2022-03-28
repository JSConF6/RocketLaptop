$(function(){
	$(".find_id").addClass("active");
	$(".find_id_input").css("display", "none");
	
	$(".find_id").on("click", function(e){
		e.preventDefault();
		
		$(".find_password").removeClass("active");
		$(".find_id").addClass("active");
		
		$(".find_id_input").css("display", "none");
		
		$(".find_btn").text("아이디 찾기");
		
		$("#find").val("findId");
		
		$("#find_user_id").val('');
		$("#find_user_name").val('');
		$("#find_user_email").val('');
	});
	
	$(".find_password").on("click", function(e){
		e.preventDefault();
		
		$(".find_id").removeClass("active");
		$(".find_password").addClass("active");
		
		$(".find_id_input").css("display", "block");
		
		$(".find_btn").text("비밀번호 찾기");
		
		$("#find").val("findPassword");
		
		$("#find_user_id").val('');
		$("#find_user_name").val('');
		$("#find_user_email").val('');
	});
	
	$(".find_btn").on("click", function(e){
		e.preventDefault();
		
		let findUserId = $.trim($("#find_user_id").val());
		if($("#find").val() === 'findPassword'){
			if(findUserId === ""){
				Swal.fire({
					icon: "warning",
					title: "아이디 비밀번호 찾기",
					text: "아이디를 입력해주세요.",
					allowOutsideClick: false,
				})
				return false;
			}
		}
		
		let findUserName = $.trim($("#find_user_name").val());
		if(findUserName === ""){
			Swal.fire({
				icon: "warning",
				title: "아이디 비밀번호 찾기",
				text: "이름을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let findUserEmail = $.trim($("#find_user_email").val());
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
			"find" : $("#find").val(),
		};
		
		$.ajax({
			url: "/findProcess",
			type: "POST",
			data: data
		}).done(function(res) {
			if(res.status === 200){
				if($("#find").val() === "findId"){
					Swal.fire({
						icon: "success",
						title: "아이디 비밀번호 찾기",
						text: "해당하는 정보의 아이디는 " + res.data + " 입니다.",
						allowOutsideClick: false,
					}).then(() => {
						$("#find_user_id").val('');
						$("#find_user_name").val('');
						$("#find_user_email").val('');
					})
				}else if($("#find").val() === "findPassword"){
					Swal.fire({
						icon: "success",
						title: "아이디 비밀번호 찾기",
						text: res.data,
						allowOutsideClick: false,
					}).then(() => {
						location.replace("/login");
					})
				}
			}else{
				Swal.fire({
					icon: "error",
					title: "아이디 비밀번호 찾기",
					text: res.data,
					allowOutsideClick: false,
				}).then(() => {
					$("#find_user_id").val('');
					$("#find_user_name").val('');
					$("#find_user_email").val('');
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
});