<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="icon" href="/images/favicon.ico">
	
		<!-- 제이쿼리 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer" type=""></script>
		
		<!-- 구글 폰트 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
		
		<!-- 부트스트랩 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<!-- Font Awesome -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		
		<!-- CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/registerView.css" type="text/css">
		
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/js/registerView.js" type="text/javascript"></script>
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
	
		<title>RocketLaptop - 회원가입</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		
		<input type="hidden" value="${result}" id="result" />
		<div class="container-fluid">
			<div class="row">
				<div class="register-container mx-auto">
					<div class="register-form mx-auto">
						<div class="d-flex justify-content-center align-items-center mb-5">
							<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="20%" height="10%"> <span class="fs-1">회원가입</span>
						</div>
						<form class="w-50 mx-auto" name="joinForm" id="joinForm" action="/registerProcess" method="POST">
							<div class="row mb-3">
								<label for="register_id" class="text-start ps-0">아이디</label>
								<input type="text" class="form-control" placeholder="영문자 숫자 _로 5~12자 입력하세요." required maxlength="12" name="user_id" id="register-id"/>
								<span class="id_message text-center"></span>
							</div>
							<div class="row mb-3">
								<label for="register-username" class="text-start ps-0">이름</label>
								<input type="text" class="form-control" placeholder="한글 공백없이 입력해주세요." required maxlength="15" name="user_name" id="register-username"/>
							</div>
							<div class="row mb-3">
								<label for="register-email" class="text-start ps-0">이메일</label>
								<input type="email" class="form-control" placeholder="이메일 주소를 입력해주세요. ex) rocket@naver.com" required name="user_email" id="register-email"/>
								<span class="email_message text-center"></span>
							</div>
							<div class="row mb-3">
								<label for="register-birth" class="text-start ps-0">생년월일</label>
								<input type="text" class="form-control" placeholder="'-'빼고 입력해주세요. ex) 20220101" required name="user_birth" id="register-birth"/>
								<span class="birth_message text-center"></span>
							</div>
							<div class="row mb-3">
								<label for="register-phone" class="text-start ps-0">휴대전화</label>
								<input type="text" class="form-control" placeholder="'-'빼고 입력해주세요. ex) 01011112222" required name="user_phone" id="register-phone"/>
								<span class="phone_message text-center"></span>
							</div>
							<div class="row mb-3">
								<label for="register-password" class="text-start ps-0">비밀번호</label>
								<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." required name="user_password" id="register-password"/>
							</div>
							<div class="row mb-3">
								<label for="register-repassword" class="text-start ps-0">비밀번호 확인</label>
								<input type="password" class="form-control" placeholder="비밀번호를 다시 입력해주세요." required id="register-repassword"/>
							</div>
							<div class="row mb-3">
								<div class="text-start ps-0">
									<label>성별&nbsp;&nbsp;</label>
									<input class="form-check-input" type="radio" value="남성" checked name="user_gender"/>
									남성 &nbsp;
									<input class="form-check-input" type="radio" value="여성" name="user_gender"/>
									여성
								</div>
							</div>
							<div class="row mb-3">
								<button type="submit" class="btn btn-secondary fs-4">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>