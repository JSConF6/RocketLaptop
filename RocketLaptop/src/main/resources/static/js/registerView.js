$(function() {
	if($.trim($("#result").val()) === "fail"){
		Swal.fire({
			icon: "error",
			title: "회원가입",
			text: "회원가입을 실패했습니다. 다시 가입해주세요.",
			allowOutsideClick: false,
		})
		return false;
	}
	
	let checkId = false;
	let checkEmail = false;
	let checkPhone = false;
	let checkBirth = false;
	
	$("#joinForm").submit(function(event){
		event.preventDefault();
		
		if(!checkId){
			Swal.fire({
				icon: "error",
				title: "아이디 확인",
				text: "아이디를 확인해주세요.",
				allowOutsideClick: false,
			})
			$("#register-id").val("").focus();
			return false;
		}
		
		const pattern = /^[ㄱ-ㅎ|가-힣]+$/;
		let username = $.trim($("#register-username").val());
		if(!pattern.test(username)){
			Swal.fire({
				icon: "error",
				title: "이름 확인",
				text: "이름을 확인해주세요.",
				allowOutsideClick: false,
			});
			$("#register-username").val("").focus();
			return false;
		}
		
		if(!checkEmail){
			Swal.fire({
				icon: "error",
				title: "이메일 확인",
				text: "이메일을 확인해주세요.",
				allowOutsideClick: false,
			})
			$("#register-email").val("").focus();
			return false;
		}
		
		if(!checkPhone){
			Swal.fire({
				icon: "error",
				title: "전화번호 확인",
				text: "전화번호를 확인해주세요.",
				allowOutsideClick: false,
			})
			$("#register-phone").val("").focus();
			return false;
		}
		
		if(!checkBirth){
			Swal.fire({
				icon: "error",
				title: "생년월일 확인",
				text: "생년월일을 확인해주세요.",
				allowOutsideClick: false,
			})
			$("#register-birth").val("").focus();
			return false;
		}
		
		let password = $.trim($("#register-password").val());
		let rePassword = $.trim($("#register-repassword").val());
		if(password !== rePassword){
			Swal.fire({
				icon: "error",
				title: "비밀번호 확인",
				text: "비밀번호를 확인해주세요.",
				allowOutsideClick: false,
			})
			$("#register-password").val("").focus();
			$("#register-repassword").val("").focus();
			return false;
		}
		
		this.submit();
	}); // joinForm submit
	
	$("#register-id").on("input", function(){
		$(".id_message").empty();
		
		const pattern = /^\w{5,12}$/;
		let registerId = $.trim($("#register-id").val());
		if(!pattern.test(registerId)){
			$(".id_message").css('color', 'red').html("영문자 숫자 _로 5~12자 가능합니다.");
			checkId = false;
			return;
		}
		$.ajax({
			url: "/register/idcheck",
			type: "GET",
			data: {"id" : registerId},
		})
		.done(function(res){
			if(res == -1){
				$(".id_message").css("color", "green").html("사용 가능한 아이디 입니다.");
				checkId = true;
			}else{
				$(".id_message").css("color", "red").html("사용중인 아이디 입니다.");
				checkId = false;
			}
		})
		.fail(function(err){
			consle.log(err)
		})
	}); // Id Keyup 이벤트처리
	
	$("#register-email").on("keyup", function(){
		$(".email_message").empty();
		
		const pattern = /^\w+@\w+[.]\w{3}$/;
		let registerEmail = $.trim($("#register-email").val());
		if(!pattern.test(registerEmail)){
			$(".email_message").css('color', 'red').html("이메일 형식 맞지 않습니다.");
			checkEmail = false;
		}else{
			$(".email_message").css('color', 'green').html("이메일 형식에 맞습니다.");
			checkEmail = true;
		}
	}); // Email Keyup 이벤트처리
	
	$("#register-birth").on("keyup", function(){
		$(".birth_message").empty();
		
		const pattern =  /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		let registerBirth = $.trim($("#register-birth").val());
		if(!pattern.test(registerBirth)){
			$(".birth_message").css('color', 'red').html("생년월일 형식 맞지 않습니다.");
			checkBirth = false;
		}else{
			$(".birth_message").css('color', 'green').html("생년월일 형식에 맞습니다.");
			checkBirth = true;
		}
	}); // Birth Keyup 이벤트처리
	
	$("#register-phone").on("keyup", function(){
		$(".phone_message").empty();
		
		const pattern = /^010\d{3,4}\d{4}$/;
		let registerPhone = $.trim($("#register-phone").val());
		if(!pattern.test(registerPhone)){
			$(".phone_message").css('color', 'red').html("전화번호 형식 맞지 않습니다.");
			checkPhone = false;
		}else{
			$(".phone_message").css('color', 'green').html("전화번호 형식에 맞습니다.");
			checkPhone = true;
		}
	}); // Phone Keyup 이벤트처리
	
})