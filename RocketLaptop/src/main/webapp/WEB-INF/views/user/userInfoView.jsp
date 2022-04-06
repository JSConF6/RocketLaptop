<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../layout/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="mx-auto">
			<div class="mx-auto">
				<div class="justify-content-center d-flex align-items-center mt-4">
					<div class="w-75 d-flex align-items-center me-5">
						<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="300px" height="10%"> <span class="fs-1">내정보</span>
					</div>
				</div>
				<div class="w-75 mx-auto text-end">
					<div class="w-100 ms-2">
						<button type="button" class="btn btn-danger fs-6" data-bs-toggle="modal" data-bs-target="#userDeleteModal">회원탈퇴</button>
						<button type="button" class="btn btn-primary fs-6" data-bs-toggle="modal" data-bs-target="#userPasswordUpdateModal">비밀번호 변경</button>
					</div>
				</div>
				<form class="w-75 mx-auto">
					<div class="row mb-3">
						<label for="update-id" class="text-start ps-0">아이디</label> <input type="text" class="form-control" id="update-id" value="${userDto.user_id}" readonly>
					</div>
					<div class="row mb-3">
						<label for="update-username" class="text-start ps-0">이름</label> <input type="text" class="form-control" id="update-username" value="${userDto.user_name}" readonly>
					</div>
					<div class="row mb-3">
						<label for="update-email" class="text-start ps-0">이메일</label> <input type="email" class="form-control" id="update-email" value="${userDto.user_email}" />
					</div>
					<div class="row mb-3">
						<label for="update-phone" class="text-start ps-0">휴대전화</label> <input type="text" class="form-control" id="update-phone" value="${userDto.user_phone}" />
					</div>
					<div class="row mb-3">
						<label for="update-gender" class="text-start ps-0">성별</label> <input type="text" class="form-control" id="update-gender" value="${userDto.user_gender}" readonly />
					</div>
					<div class="row mb-3">
						<c:set var="birth" value="${userDto.user_birth}"/>
						<c:set var="user_birth" value="${fn:substring(birth, 0, 4)}-${fn:substring(birth, 4, 6)}-${fn:substring(birth, 6, 8)}" />
						<label for="update-birth" class="text-start ps-0">생년월일</label> <input type="text" class="form-control" id="update-birth" readonly value="${user_birth}" />
					</div>
					<div class="row mb-3">
						<button class="btn btn-secondary fs-4 userUpdateBtn">회원정보수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="userPasswordUpdateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">비밀번호 변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form>
					<div class="mb-3">
						<label for="currentPassword" class="col-form-label">현재 비밀번호</label> 
						<input type="password" class="form-control" id="currentPassword" placeholder="현재 비밀번호를 입력해주세요.">
					</div>
					<div class="mb-3">
						<label for="newPassword" class="col-form-label">새로운 비밀번호</label> 
						<input type="password" class="form-control" id="newPassword" placeholder="새로운 비밀번호를 입력해주세요.">
					</div>
					<div class="mb-3">
						<label for="reNewPassword" class="col-form-label">새로운 비밀번호 확인</label> 
						<input type="password" class="form-control" id="reNewPassword" placeholder="새로운 비밀번호를 다시 입력해주세요.">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary passwordUpdateBtn">비밀번호 변경</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="userDeleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">회원탈퇴</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form>
					<div class="mb-3">
						<label for="userDeleteCurrentPassword" class="col-form-label">현재 비밀번호</label> 
						<input type="password" class="form-control" id="userDeleteCurrentPassword" placeholder="현재 비밀번호를 입력해주세요.">
					</div>
					<div class="mb-3">
						<label for="userDeleteNewPassword" class="col-form-label">비밀번호 확인</label> 
						<input type="password" class="form-control" id="userDeleteNewPassword" placeholder="비밀번호를 다시 입력해주세요.">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary userDeleteBtn">회원탈퇴</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>