<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderComplete.css" type="text/css">
		
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/js/orderComplete.js" type="text/javascript"></script>
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
		
		<!-- LoadingOverlay -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js" integrity="sha512-hktawXAt9BdIaDoaO9DlLp6LYhbHMi5A36LcXQeHgVKUH6kJMOQsAtIw2kmQ9RERDpnSTlafajo6USh9JUXckw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
		<title>RocketLaptop - 주문완료</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		
		<main>
			<div class="order-complete-container">
				<div class="d-flex mt-5 align-items-center justify-content-center mb-5">
					<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="200px" height="20%">
					<h1>주문완료</h1>
				</div>
				<div class="d-flex justify-content-center align-items-center fs-2">
					<div class="text-success">
						<i class="fa-solid fa-circle-check fa-5x"></i>
					</div>
					<div class="ms-4">
						<b>고객님의 주문이 완료되었습니다.</b>
					</div>
				</div>
				<div class="mt-5">
					<table class="table border-top text-center">
						<tr>
							<th class="p-4 fs-5">총 주문금액</th>
							<th class="p-4 fs-5">결제금액</th>
						</tr>
						<tr>
							<fmt:formatNumber var="totalPrice" value="${orderDto.order_totalprice}" pattern="###,###,###" />
							<td class="p-4 fs-4 fw-bold">${totalPrice}원</td>
							<td class="p-4 fs-4 fw-bold">${totalPrice}원</td>
						</tr>
					</table>
				</div>
				<div class="mt-5 delivery_info">
					<div class="mb-2">배송정보</div>
					<table class="table border-top">
						<tr>
							<th class="p-2 border-end">받으시는분</th>
							<td class="p-2">${orderDto.order_name}</td>
						</tr>
						<tr>
							<th class="p-2 border-end">우편번호</th>
							<td class="p-2">${orderDto.user_address1}</td>
						</tr>
						<tr>
							<th class="p-2 border-end">주소</th>
							<td class="p-2">${orderDto.user_address2} ${orderDto.user_address3}</td>
						</tr>
						<tr>
							<th class="p-2 border-end">전화번호</th>
							<c:set var="phone" value="${orderDto.order_phone}"/>
							<c:set var="orderPhone" value="${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, 11)}" />
							<td class="p-2">${orderPhone}</td>
						</tr>
					</table>
				</div>
				<div class="text-end mt-4">
					<button class="bottomBtn bg-black text-white border me-4 leftBtn">쇼핑 계속하기</button>
					<button class="bottomBtn bg-white border rightBtn">주문 확인하기</button>
				</div>
			</div>
		</main>
		
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>