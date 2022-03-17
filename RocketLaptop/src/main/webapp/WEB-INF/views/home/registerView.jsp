<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<input type="hidden" value="${result}" id="result" />
<div class="container-fluid">
	<div class="row">
		<div class="register-container mx-auto">
			<div class="register-form mx-auto">
				<div class="d-flex justify-content-center align-items-center mb-5">
					<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="10%"> <span class="fs-1">회원가입</span>
				</div>
				<form class="w-50 mx-auto" name="joinForm" id="joinForm" action="/registerProcess" method="POST">
					<div class="row mb-3">
						<label for="register_id" class="text-start ps-0">아이디</label>
						<input type="text" class="form-control" placeholder="영문자 숫자 _로 5~12자 입력하세요." required maxlength="12" name="id" id="register-id"/>
						<span class="id_message"></span>
					</div>
					<div class="row mb-3">
						<label for="register-username" class="text-start ps-0">이름</label>
						<input type="text" class="form-control" placeholder="한글 공백없이 입력해주세요." required maxlength="15" name="username" id="register-username"/>
					</div>
					<div class="row mb-3">
						<label for="register-email" class="text-start ps-0">이메일</label>
						<input type="email" class="form-control" placeholder="이메일 주소를 입력해주세요. ex) rocket@naver.com" required name="email" id="register-email"/>
						<span class="email_message"></span>
					</div>
					<div class="row mb-3">
						<label for="register-birth" class="text-start ps-0">생년월일</label>
						<input type="text" class="form-control" placeholder="-포함해서 입력해주세요. ex) 2022-01-01" required name="birth" id="register-birth"/>
						<span class="birth_message"></span>
					</div>
					<div class="row mb-3">
						<label for="register-phone" class="text-start ps-0">휴대전화</label>
						<input type="text" class="form-control" placeholder="-포함해서 입력해주세요. ex) 010-1111-2222" required name="phone" id="register-phone"/>
						<span class="phone_message"></span>
					</div>
					<div class="row mb-3">
						<label for="register-password" class="text-start ps-0">비밀번호</label>
						<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." required name="password" id="register-password"/>
					</div>
					<div class="row mb-3">
						<label for="register-repassword" class="text-start ps-0">비밀번호 확인</label>
						<input type="password" class="form-control" placeholder="비밀번호를 다시 입력해주세요." required id="register-repassword"/>
					</div>
					<div class="row mb-3">
						<div class="text-start ps-0">
							<label>성별&nbsp;&nbsp;</label>
							<input class="form-check-input" type="radio" value="남성" checked name="gender"/>
							남성 &nbsp;
							<input class="form-check-input" type="radio" value="여성" name="gender"/>
							여성
						</div>
					</div>
					<div class="row mb-3">
						<button type="submit" class="btn btn-secondary fs-4">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>