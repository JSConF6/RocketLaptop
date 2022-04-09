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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPageView.css" type="text/css">
		
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/js/mypageView.js" type="text/javascript"></script>
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
		
		<!-- LoadingOverlay -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js" integrity="sha512-hktawXAt9BdIaDoaO9DlLp6LYhbHMi5A36LcXQeHgVKUH6kJMOQsAtIw2kmQ9RERDpnSTlafajo6USh9JUXckw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
		<title>RocketLaptop - 마이페이지</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		
		<section class="d-flex flex-column align-items-center">
			<div class="d-flex align-items-center mt-2 mb-2">
				<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="300px" height="10%"> 
				<div class="pt-5 pb-5 fw-bold fs-1">마이페이지</div>
			</div>
			
			<div class="mypage_orderstate border border-secondary">
				<div class="pt-2 pb-2 ps-3 pe-3 fs-5 border-bottom border-secondary text-center">나의 주문현황</div>
				<div class="d-flex justify-content-center mt-4 mb-4">
					<div class="mypage_orderstate_item border-end border-secondary d-flex justify-content-center align-items-center flex-column border-start">
						<div class="fs-6">배송준비중</div>
						<div class="text-black fw-bold fs-5">
							<a href="/user/mypage/order/list?user_id=${param.user_id}">${deliveryReadyCount}</a>
						</div>
					</div>
					<div class="mypage_orderstate_item border-end border-secondary d-flex justify-content-center align-items-center flex-column">
						<div class="fs-6">배송중</div>
						<div class="text-black fw-bold fs-5">
							<a href="/user/mypage/order/list?user_id=${param.user_id}">${deliveryCount}</a>
						</div>
					</div>
					<div class="mypage_orderstate_item border-end border-secondary d-flex justify-content-center align-items-center flex-column">
						<div class="fs-6">배송완료</div>
						<div class="text-black fw-bold fs-5">
							<a href="/user/mypage/order/list?user_id=${param.user_id}">${deliveryComCount}</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="mypage_main d-flex justify-content-between mt-5">
				<div class="mypage_main_item ps-1 pe-1 mypageUserInfo">
					<div class="pt-1 pb-1 text-center item_caption">내정보</div>
					<div class="fs-6 text-gray text-center item_content">
						<i class="fa-solid fa-lock fa-3x"></i>
						<div class="mt-3">
							고객님의 회원정보를<br>관리하실 수 있습니다.
						</div>
					</div>
				</div>
				
				<div class="mypage_main_item ps-1 pe-1 mypageOrder">
					<div class="pt-1 pb-1 text-center item_caption">주문</div>
					<div class="fs-6 text-gray text-center item_content">
						<i class="fa-solid fa-file-lines fa-3x"></i>
						<div class="mt-3">
							고객님의 주문내역을<br>확인하실 수 있습니다.
						</div>
					</div>
				</div>
				
				<div class="mypage_main_item ps-1 pe-1 mypageActivity">
					<div class="pt-1 pb-1 text-center item_caption">나의활동</div>
					<div class="fs-6 text-gray text-center item_content">
						<i class="fa-solid fa-clipboard-list fa-3x"></i>
						<div class="mt-3">
							고객님께서 쓰신 리뷰와<br>문의사항을 확인하실 수 있습니다.
						</div>
					</div>
				</div>
				
				<div class="mypage_main_item ps-1 pe-1 mypageAddress">
					<div class="pt-1 pb-1 text-center item_caption">배송지</div>
					<div class="fs-6 text-gray text-center item_content">
						<i class="fa-solid fa-map-location-dot fa-3x"></i>
						<div class="mt-3">
							자주 사용하는 배송지를<br/>등록하고 관리할 수 있습니다.
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>