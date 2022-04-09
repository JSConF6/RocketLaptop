<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RocketLaptop - 관리자페이지(유저 상세정보)</title>
		
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
		
		<!-- JS -->
		<script type="text/javascript" src="../js/admin/adminUserDetailView.js"></script>
	
	</head>
	<body>
		<%@ include file="./adminSidebar.jsp"%>
		
		<main class="mt-5 vw-50">
			<div class="container-fluid">
				<div class="d-flex align-items-center mb-3">
					<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">유저 - 상세정보</span>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered">
						<tr>
							<th class="text-center">이름</th>
							<td colspan="3"><span id="user_name">${userDto.user_name}</span></td>
						</tr>
						<tr>
							<th class="text-center">아이디</th>
							<td colspan="3"><span id="user_id">${userDto.user_id}</span></td>
						</tr>
						<tr>
							<th class="text-center">이메일</th>
							<td colspan="3"><span id="user_email">${userDto.user_email}</span></td>
						</tr>
						<tr>
							<th class="text-center">생년월일</th>
							<c:set var="birth" value="${userDto.user_birth}"/>
							<c:set var="user_birth" value="${fn:substring(birth, 0, 4)}-${fn:substring(birth, 4, 6)}-${fn:substring(birth, 6, 8)}" />
							<td><span id="user_birth">${user_birth}</span></td>
						</tr>
						<tr>
							<th class="text-center">전화번호</th>
							<c:set var="phone" value="${userDto.user_phone}"/>
							<c:set var="user_phone" value="${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, 11)}" />
							<td><span id="user_phone">${user_phone}</span></td>
						</tr>
						<tr>
							<th class="text-center">성별</th>
							<td colspan="3"><span id="user_gender">${userDto.user_gender}</span></td>
						</tr>
						<tr>
							<th class="text-center">권한</th>
							<td colspan="3"><c:if test="${user.user_role == ROLE_USER}"><span id="user_role">유저</span></c:if></td>
						</tr>
						<tr>
							<th class="text-center">가입날짜</th>
							<fmt:formatDate var="userDate" value="${userDto.user_reg_date}" pattern="yyyy-MM-dd"/>
							<td colspan="3"><span id="user_reg_date">${userDate}</span></td>
						</tr>
					</table>
				</div>
				<div class="d-flex justify-content-end mb-3 mt-3">
					<button class="btn btn-primary userListBtn">목록</button>
				</div>
			</div>
		</main>
		
		<%@ include file="./adminFooter.jsp"%>
	</body>
</html>