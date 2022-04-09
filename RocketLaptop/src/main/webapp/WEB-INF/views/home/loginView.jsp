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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginView.css" type="text/css">
		
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/js/loginView.js" type="text/javascript"></script>
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
	
		<title>RocketLaptop - 로그인</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		
		<input type="hidden" value="${result}" id="result"/>
		<div class="container-fluid">
			<div class="row">
				<div class="login-container mx-auto">
					<div class="mx-auto login-form">
						<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="300px" height="20%">
						<h1 class="text-start">Login</h1>
						<form name="loginform" action="/login" method="POST">
							<div class="row mb-3">
								<div class="col-sm-12">
									<input type="text" class="form-control border-top-0 border-start-0 border-end-0" placeholder="ID" id="login_id" name="user_id"
										<c:if test="${!empty saveId}">
											value="${saveId}"
										</c:if>/>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-12">
									<input type="password" class="form-control border-top-0 border-start-0 border-end-0" placeholder="Password" id="login_password" name="user_password"/>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-12 d-flex justify-content-between">
									<label>
										<input type="checkbox" name="remember" 
											<c:if test="${!empty saveId}">
												checked
											</c:if>/>
										&nbsp;아이디 기억
									</label>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<button type="submit" class="btn btn-dark rounded-pill w-75 fs-5">Login</button>
							</div>
							<div class="mt-2 d-flex justify-content-center">
								<a href="/register">회원가입</a>
								&nbsp;/&nbsp;
								<a href="/findIdPasswordView">아이디 비밀번호 찾기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>