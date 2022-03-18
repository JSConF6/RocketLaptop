<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RocketLaptop - 중복로그인</title>

<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">

</head>
<body>
	<script>
		Swal.fire({
			icon: "error",
			title: "중복로그인",
			text: "이미 로그인을 했습니다. 홈으로 이동합니다.",
			allowOutsideClick: false,
			allowEscapeKey: false,
		}).then(() => {
			location.replace("/");
		})
	</script>
</body>
</html>