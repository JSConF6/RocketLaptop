<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<div class="d-flex align-items-center">
			<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">유저 - 상세정보</span>
		</div>
		<div class="mb-3">
			<label for="user_name" class="form-label">이름</label> <input type="text" class="form-control" id="user_name" disabled value="${userDto.user_name}">
		</div>
		<div class="mb-3">
			<label for="user_id" class="form-label">아이디</label> <input type="text" class="form-control" id="user_id" disabled value="${userDto.user_id}">
		</div>
		<div class="mb-3">
			<label for="user_email" class="form-label">이메일</label> <input type="text" class="form-control" id="user_email" disabled value="${userDto.user_email}">
		</div>
		<div class="mb-3">
			<label for="user_birth" class="form-label">생년월일</label> <input type="text" class="form-control" id="user_birth" disabled value="${userDto.user_birth}">
		</div>
		<div class="mb-3">
			<label for="user_phone" class="form-label">핸드폰번호</label> <input type="text" class="form-control" id="user_phone" disabled value="${userDto.user_phone}">
		</div>
		<div class="mb-3">
			<label for="user_gender" class="form-label">성별</label> <input type="text" class="form-control" id="user_gender" disabled value="${userDto.user_gender}">
		</div>
		<div class="mb-3">
			<label for="user_role" class="form-label">권한</label> <c:if test="${user.user_role == ROLE_USER}"> <input type="text" class="form-control" id="user_role" disabled value="유저"></c:if>
		</div>
		<div class="mb-3">
			<fmt:formatDate var="userDate" value="${userDto.user_reg_date}" pattern="yyyy-MM-dd"/>
			<label for="user_reg_date" class="form-label">가입날짜</label> <input type="text" class="form-control" id="user_reg_date" disabled value='${userDate}'>
		</div>
		<div class="d-flex justify-content-end mb-3 mt-3">
			<button class="btn btn-primary userListBtn">목록</button>
		</div>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>