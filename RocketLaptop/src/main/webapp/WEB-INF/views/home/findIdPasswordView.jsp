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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/findIdPasswordView.css" type="text/css">
		
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/js/findIdPasswordView.js" type="text/javascript"></script>
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
		
		<!-- LoadingOverlay -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js" integrity="sha512-hktawXAt9BdIaDoaO9DlLp6LYhbHMi5A36LcXQeHgVKUH6kJMOQsAtIw2kmQ9RERDpnSTlafajo6USh9JUXckw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
		<title>RocketLaptop - 아이디 비밀번호 찾기</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		<input type="hidden" value="findId" id="find" />
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 p-0 mt-5 find-container mx-auto">
					<div class="d-flex justify-content-center">
						<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="300px" height="20%">
					</div>
					<ul class="nav nav-tabs nav-pills text-center justify-content-evenly bg-secondary align-items-center rounded-top mt-3" id="myTab" role="tablist">
					  <li class="nav-item w-25" role="presentation">
					    <a class="nav-link text-white rounded-1 active" id="find-id_tab" data-bs-toggle="tab" data-bs-target="#findId" type="button" role="tab" aria-selected="true">아이디찾기</a>
					  </li>
					  <li class="nav-item w-25" role="presentation">
					    <a class="nav-link text-white rounded-1" id="find-password_tab" data-bs-toggle="tab" data-bs-target="#findPassword" type="button" role="tab" aria-selected="false">비밀번호찾기</a>
					  </li>
					</ul>
					<div class="tab-content" id="myTabContent">
					  <div class="tab-pane fade show active" id="findId" role="tabpanel">
					  	<div class="col-12 find-form mx-auto border-start border-end border-bottom border-secondary rounded-bottom p-4">
					  		<div>
								<input type="text" class="form-control border-top-0 border-start-0 border-end-0 mb-3" placeholder="이름을 입력하세요" id="find_id_user_name" />
								<input type="email" class="form-control border-top-0 border-start-0 border-end-0 mb-4" placeholder="이메일을 입력하세요" id="find_id_user_email" />
								<div class="d-flex justify-content-center mt-3">
									<button class="btn btn-dark rounded-pill fs-5 find_id_btn find_btn">아이디 찾기</button>
								</div>
							</div>
						</div>
					  </div>
					  <div class="tab-pane fade" id="findPassword" role="tabpanel">
					  	<div class="col-12 find-form mx-auto border-start border-end border-bottom border-secondary rounded-bottom p-4">
					  		<div>
								<input type="text" class="form-control border-top-0 border-start-0 border-end-0 mb-3" placeholder="아이디를 입력하세요" id="find_password_user_id" />
								<input type="text" class="form-control border-top-0 border-start-0 border-end-0 mb-3" placeholder="이름을 입력하세요" id="find_password_user_name" />
								<input type="email" class="form-control border-top-0 border-start-0 border-end-0 mb-4" placeholder="이메일을 입력하세요" id="find_password_user_email" />
								<div class="d-flex justify-content-center mt-3">
									<button class="btn btn-dark rounded-pill fs-5 find_passwrod_btn find_btn">비밀번호 찾기</button>
								</div>
							</div>
						</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>