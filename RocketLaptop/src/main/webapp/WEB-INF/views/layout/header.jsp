<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<!-- Daum 주소 검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<!-- Style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/registerView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cartView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productListView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/findIdPasswordView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetailView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPageView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderListView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addressListView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myActivityView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderView.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderComplete.css" type="text/css">

<!-- JS -->
<script src="${pageContext.request.contextPath}/js/registerView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/loginView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/mainView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/productDetailView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/cartListView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/orderView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/userInfoView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/header.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/findIdPasswordView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/noticeDetailView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/questionDetailView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/myQuestionListView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/myQuestionDetailView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/questionListView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/myOrderDetailView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/productReview.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/productQna.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/mypageView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/addressListView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/myQuestionView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/myReviewView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/orderListView.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/orderComplete.js" type="text/javascript"></script>

<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">

<!-- Swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<title>RocketLaptop</title>
</head>
<body>
	<nav class="navbar navbar-light bg-light justify-content-between ps-0 pe-0">
		<div class="container-fluid pe-0">
			<a href="/" class="navbar-brand text-black" style="width: 210px"> <img alt="" src="/images/RocketLaptopLogo.svg" width="100%" height="100%">
			</a>
			<input type="hidden" value="${search_field}" class="search_field">
			<form action="/product/search/list" method="GET" id="search-bar">
				<div class="input-group">
					<select class="rounded-start product_search_field" name="search_field">
						<option value="0" selected>상품명</option>
						<option value="1">카테고리명</option>
					</select> 
					<input type="text" class="form-control search_word" placeholder="상품명을 입력해주세요" value="${search_word}" name="search_word"/>
					<button class="btn btn-outline-secondary productSearchBtn" type="button">
							<i class="fa-solid fa-magnifying-glass fa-2x"></i>
					</button>
				</div>
			</form>
			<ul class="nav">
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a href="/login" class="nav-link d-flex flex-column align-items-center text-secondary" id="cuser-icon"> <i class="fa-solid fa-circle-user fa-2x"></i> <span class="fs-5 cuser-icon-title">로그인</span>
					</a></li>
					<li class="nav-item"><a href="/register" class="nav-link d-flex flex-column align-items-center text-secondary" id="puser-icon"> <i class="fa-solid fa-user-plus fa-2x"></i> <span class="fs-5 puser-icon-title">회원가입</span>
					</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<div class="d-flex">
						<sec:authorize access="hasRole('ROLE_USER')">
							<sec:authentication property="principal.userDto.user_id" var="user_id" />
							<input type="hidden" value="${user_id}" id="user_id" />
							<li class="nav-item position-relative">
								<a href="/user/cart/list?user_id=${user_id}" class="nav-link d-flex flex-column align-items-center text-secondary" id="cart-icon"> 
									<i class="fa-solid fa-cart-shopping fa-2x"></i> 
									<span class="position-absolute top-5 translate-middle badge rounded-pill bg-success" id="cart-badge">0</span> <span class="fs-5 cart-icon-title">장바구니</span>
								</a>
							</li>
							<li class="nav-item">
								<div class="mypage-dropdown">
									<a href="/user/mypage?user_id=${user_id}" class="nav-link d-flex flex-column align-items-center text-secondary" id="mypage-icon"> 
										<i class="fa-solid fa-circle-user fa-2x"></i> 
										<span class="fs-5 mypage-icon-title">마이페이지</span>
									</a>
									<ul class="mypage-menu">
								    	<li class="mypage-item"><a href="/user/mypage/order/list?user_id=${user_id}">주문목록</a></li>
								    	<li class="mypage-item"><a href="/user/mypage/activity/list?user_id=${user_id}">나의활동</a></li>
								    	<li class="mypage-item"><a href="/user/mypage/address/list?user_id=${user_id}">배송지관리</a></li>
									</ul>
								</div>
							</li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<sec:authentication property="principal.userDto.user_role" var="user_role"/>
							<input type="hidden" value="${user_role}" id="user_role"/>
							<li class="nav-item">
								<a href="/admin?pageName=home" class="nav-link d-flex flex-column align-items-center text-secondary" id="mypage-icon"> 
									<i class="fa-solid fa-circle-user fa-2x"></i> 
									<span class="fs-5 mypage-icon-title">관리자페이지</span>
								</a>
							</li>
						</sec:authorize>
						<li class="nav-item">
							<a class="nav-link d-flex flex-column align-items-center text-secondary" id="cuser-icon" href="/logout"> 
								<i class="fa-solid fa-right-from-bracket fa-2x"></i> 
								<span class="fs-5 cuser-icon-title">로그아웃</span>
							</a>
						</li>
					</div>
				</sec:authorize>
			</ul>
		</div>
	</nav>
	<div class="navbar navbar-expand-lg navbar-light bg-light border-top border-bottom border-3">
		<div class="container-fluid">
			<a href="#" class="navbar-brand"></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-center" id="navbarNav">
				<ul class="nav justify-content-center align-items-center">
					<li class="nav-item me-3">
						<div class="dropdown category">
							<button class="btn text-secondary d-flex align-items-center" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="fa-solid fa-bars fa-2x"></i> <span class="fs-4">&nbsp;&nbsp;카테고리</span>
							</button>
							<ul class="dropdown-menu category-menu">

							</ul>
						</div>
					</li>
					<li class="nav-item"><a href="/product/bestProductList" class="nav-link me-3 text-secondary fs-4">베스트상품</a></li>
					<li class="nav-item"><a href="/product/newProductList" class="nav-link me-3 text-secondary fs-4">신규상품</a></li>
					<li class="nav-item"><a class="nav-link me-3 text-secondary fs-4" href="/notice/list">공지사항</a></li>
				</ul>
			</div>
		</div>
	</div>