$(function(){
	let result = $.trim($("#result").val());
	if(result === "registerSuccess"){
		Swal.fire({
			icon: "success",
			title: "회원가입",
			text: "회원가입을 축하합니다.",
			allowOutsideClick: false,
		})
		return false;
	}else if(result === "fail"){
		Swal.fire({
			icon: "error",
			title: "로그인",
			text: "아이디 또는 비밀번호가 틀립니다.",
			allowOutsideClick: false,
		})
		return false;
	}
});