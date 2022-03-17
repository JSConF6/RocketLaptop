<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="login-container mx-auto">
			<div class="mx-auto login-form">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="40%" height="20%">
				<h1 class="text-start">Login</h1>
				<form name="loginform">
					<div class="row mb-3">
						<div class="col-sm-12">
							<input type="text" class="form-control border-top-0 border-start-0 border-end-0" placeholder="ID" />
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-12">
							<input type="password" class="form-control border-top-0 border-start-0 border-end-0" placeholder="Password" />
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-12">
							<div class="d-flex justify-content-between">
								<div>
									<input class="form-check-input" type="checkbox" id="remember" />
									<label class="form-check-label" for="remember">&nbsp;아이디 저장</label>
								</div>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-center">
						<button type="submit" class="btn btn-dark rounded-pill w-75 fs-5">Login</button>
					</div>
					<div class="mt-2 d-flex justify-content-center">
						<a href="#">회원가입</a>
						&nbsp;/&nbsp;
						<a href="#">비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>