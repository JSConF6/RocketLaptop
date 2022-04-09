<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="/images/favicon.ico">

<!-- Daum 주소 검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<!-- Style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/productListView.css" type="text/css">

<!-- JS -->
<script src="${pageContext.request.contextPath}/js/header.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/mainView.js" type="text/javascript"></script>

<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">

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
							<sec:authentication property="principal.userDto.user_role" var="user_role"/>
							<input type="hidden" value="${user_role}" id="user_role"/>
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