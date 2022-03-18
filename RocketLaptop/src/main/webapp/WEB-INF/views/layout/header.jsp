<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 제이쿼리 -->
<script src="../js/jquery-3.6.0.min.js"></script>

<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Style -->
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/loginView.css">
<link rel="stylesheet" href="../css/registerView.css">
<link rel="stylesheet" href="../css/cartView.css">
<link rel="stylesheet" href="../css/productListView.css">
<link rel="stylesheet" href="../css/swiper.css">

<!-- JS -->
<script src="../js/registerView.js"></script>
<script src="../js/loginView.js"></script>
<script src="../js/mainView.js"></script>

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
			<a href="/" class="navbar-brand text-black" style="width: 210px"> <img alt="" src="../images/RocketLaptopLogo.svg" width="100%" height="100%">
			</a>
			<div class="input-group" id="search-bar">
				<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					<span>전체</span>
				</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">전체</a></li>
					<li><a class="dropdown-item" href="#">상품명</a></li>
					<li><a class="dropdown-item" href="#">카테고리명</a></li>
				</ul>
				<input type="text" class="form-control" aria-label="Text input with 2 dropdown buttons" />
				<button class="btn btn-outline-secondary" type="button">
					<a href="#"> <i class="fa-solid fa-magnifying-glass fa-2x"></i>
					</a>
				</button>
			</div>
			<ul class="nav">
				<li class="nav-item position-relative"><a href="/cart" class="nav-link d-flex flex-column align-items-center text-secondary" id="cart-icon"> <i class="fa-solid fa-cart-shopping fa-2x"></i> <span class="position-absolute top-5 translate-middle badge rounded-pill bg-danger" id="cart-badge"> 0 <span class="visually-hidden">unread messages</span>
					</span> <span class="fs-5 cart-icon-title">장바구니</span>
				</a></li>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a href="/login" class="nav-link d-flex flex-column align-items-center text-secondary" id="cuser-icon"> <i class="fa-solid fa-circle-user fa-2x"></i> <span class="fs-5 cuser-icon-title">로그인</span>
					</a></li>
					<li class="nav-item"><a href="register" class="nav-link d-flex flex-column align-items-center text-secondary" id="puser-icon"> <i class="fa-solid fa-user-plus fa-2x"></i> <span class="fs-5 puser-icon-title">회원가입</span>
					</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<div class="d-flex">
						<sec:authorize access="hasRole('ROLE_USER')">
							<li class="nav-item"><a href="#" class="nav-link d-flex flex-column align-items-center text-secondary" id="mypage-icon"> <i class="fa-solid fa-circle-user fa-2x"></i> <span class="fs-5 mypage-icon-title">마이페이지</span>
							</a></li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')"> 
							<li class="nav-item"><a href="/admin?pageName=home" class="nav-link d-flex flex-column align-items-center text-secondary" id="mypage-icon"> <i class="fa-solid fa-circle-user fa-2x"></i> <span class="fs-5 mypage-icon-title">관리자페이지</span>
							</a></li>
						</sec:authorize>
						<li class="nav-item"><a class="nav-link d-flex flex-column align-items-center text-secondary" id="cuser-icon" href="/logout"> <i class="fa-solid fa-right-from-bracket fa-2x"></i> <span class="fs-5 cuser-icon-title">로그아웃</span>
						</a></li>
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
						<div class="dropdown">
							<button class="btn text-secondary d-flex align-items-center" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="fa-solid fa-bars fa-2x"></i> <span class="fs-4">&nbsp;&nbsp;카테고리</span>
							</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<li>
									<button class="dropdown-item" type="button">
										<a href="/productList">전체</a>
									</button>
								</li>
								<li>
									<button class="dropdown-item" type="button">
										<a href="#">노트북</a>
									</button>
								</li>
								<li>
									<button class="dropdown-item" type="button">
										<a href="#">스마트폰</a>
									</button>
								</li>
								<li>
									<button class="dropdown-item" type="button">
										<a href="#">카메라</a>
									</button>
								</li>
							</ul>
						</div>
					</li>
					<li class="nav-item"><a href="#" class="nav-link me-3 text-secondary fs-4">베스트상품</a></li>
					<li class="nav-item"><a href="#" class="nav-link me-3 text-secondary fs-4">신규상품</a></li>
					<li class="nav-item"><a class="nav-link me-3 text-secondary fs-4" href="/notice">공지사항</a></li>
					<li class="nav-item"><a href="question" class="nav-link me-3 text-secondary fs-4">문의사항</a></li>
				</ul>
			</div>
		</div>
	</div>