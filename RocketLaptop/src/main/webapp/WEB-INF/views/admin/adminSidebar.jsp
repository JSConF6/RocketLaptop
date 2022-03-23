<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RocketLaptop - 관리자페이지</title>

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

<!-- sweetalert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">

<!-- Style -->
<link rel="stylesheet" href="../css/admin/adminView.css">
<link rel="stylesheet" href="../css/admin/adminProductAddView.css">

<!-- JS -->
<script type="text/javascript" src="../js/admin/adminView.js"></script>
<script type="text/javascript" src="../js/admin/adminProductAddView.js"></script>
<script type="text/javascript" src="../js/admin/adminProductDetailView.js"></script>
<script type="text/javascript" src="../js/admin/adminProductModifyView.js"></script>
<script type="text/javascript" src="../js/admin/adminNoticeListView.js"></script>
<script type="text/javascript" src="../js/admin/adminNoticeDetailView.js"></script>
<script type="text/javascript" src="../js/admin/adminNoticeModifyView.js"></script>
<script type="text/javascript" src="../js/admin/adminQuestionDetailView.js"></script>

</head>
<body>
	<header>
		<div class="d-flex flex-column flex-shrink-0 p-3 bg-light vh-100 shadow-lg fixed-top" style="width: 280px;">
			<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none"> <img alt="Logo" src="../images/RocketLaptopLogo.svg" width="100%" height="100%">
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item"><a href="/admin" class="nav-link link-dark fs-5 admin-link" id="home" aria-current="page"> <i class="fa-solid fa-house"></i>&nbsp;&nbsp;대시보드
				</a></li>
				<li><a href="/admin/noticeList" class="nav-link link-dark fs-5 admin-link" id="notice"> <i class="fa-solid fa-clipboard"></i>&nbsp;&nbsp;공지사항
				</a></li>
				<li><a href="/admin/questionList" class="nav-link link-dark fs-5 admin-link" id="question"> <i class="fa-solid fa-question"></i>&nbsp;&nbsp;문의사항
				</a></li>
				<li><a href="/admin/orderList" class="nav-link link-dark fs-5 admin-link" id="order"> <i class="fa-solid fa-calculator"></i>&nbsp;&nbsp;주문목록
				</a></li>
				<li><a href="/admin/productList" class="nav-link link-dark fs-5 admin-link" id="product"> <i class="fa-solid fa-boxes-stacked"></i>&nbsp;&nbsp;상품목록
				</a></li>
				<li><a href="/admin/userList" class="nav-link link-dark fs-5 admin-link" id="user"> <i class="fa-solid fa-user"></i>&nbsp;&nbsp;유저목록
				</a></li>
			</ul>
			<hr>
			<div class="dropdown">
				<a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle fs-5" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false"> <i class="fa-solid fa-user-gear"></i>&nbsp;&nbsp; <strong>관리자</strong>
				</a>
				<ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
					<li><a class="dropdown-item" href="/logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</header>