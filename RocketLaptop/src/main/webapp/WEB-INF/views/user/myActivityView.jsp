<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myActivityView.css" type="text/css">
		
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/js/myQuestionView.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/myReviewView.js" type="text/javascript"></script>
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
		
		<!-- LoadingOverlay -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js" integrity="sha512-hktawXAt9BdIaDoaO9DlLp6LYhbHMi5A36LcXQeHgVKUH6kJMOQsAtIw2kmQ9RERDpnSTlafajo6USh9JUXckw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
		<title>RocketLaptop - 나의활동</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		
		<main class="my-activity-container">
			<div class="d-flex align-items-center mt-2 mb-2">
				<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="300px" height="10%"> 
				<div class="pt-5 pb-5 fw-bold fs-1">나의활동</div>
			</div>
			<ul class="nav nav-pills nav-justified mb-3" id="pills-tab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active" id="my-question-tab" data-bs-toggle="pill" data-bs-target="#myQuestion" type="button" role="tab" aria-selected="true">내가 쓴 문의사항</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="my-review-tab" data-bs-toggle="pill" data-bs-target="#myReview" type="button" role="tab" aria-selected="false">내가 쓴 리뷰</button>
			  </li>
			</ul>
			<div class="tab-content" id="pills-tabContent">
			  <div class="tab-pane fade show active" id="myQuestion" role="tabpanel">
				 <div class="d-flex justify-content-between myQuestionHeader">
					<span class="fs-5 myQuestionListCount">내가 쓴 문의사항 갯수</span>
				</div>
				 <table class="table my-question-table mt-3">
					<thead>
						<tr>
							<th>번호</th>
							<th>답변상태</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>답변대기</td>
							<td><span class="">제목&nbsp;&nbsp;&nbsp;<span class="text-secondary">[답변완료]</span></span></td>
							<td>작성자</td>
							<td>2022-02-02</td>
						</tr>
					</tbody>
				</table>
				<nav class="d-flex justify-content-center myQuestionPagination"></nav>
			  </div>
			  
			  <div class="tab-pane fade" id="myReview" role="tabpanel">
			  	<div class="d-flex justify-content-between myReviewHeader">
					<span class="fs-5 myReviewListCount">내가 쓴 리뷰 갯수</span>
				</div>
			  	<table class="table border-top border-bottom mt-3 myReviewTable">
					<tbody>
						<tr>
							<td>
								<div class="d-flex justify-content-between">
									<div class="d-flex">
										<div>
											<span class="star1-view" data-val=1><i class="fa-solid fa-star"></i></span>
									  		<span class="star2-view" data-val=2><i class="fa-solid fa-star"></i></span>
									  		<span class="star3-view" data-val=3><i class="fa-solid fa-star"></i></span>
									  		<span class="star4-view" data-val=4><i class="fa-solid fa-star"></i></span>
									  		<span class="star5-view" data-val=5><i class="fa-solid fa-star"></i></span>
								  		</div>
								  		<div class="d-flex flex-column ms-5">
											<div><span class="text-muted">15;(1종)오드데일리점퍼 카키88(2900원)[1개]</span></div>
											<div>추천 합니다. 배송이 빠릅니다.</div>
										</div>
								  	</div>
									<div class="d-flex flex-column">
										<div><span class="text-muted">작성자 : jsconf</span></div>
										<div><span class="text-muted">등록일 : 2022-03-03</span></div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<nav class="d-flex justify-content-center myReviewPagination"></nav>
			  </div>
			</div>
		</main>
		
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>