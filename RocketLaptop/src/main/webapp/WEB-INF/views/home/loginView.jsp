<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<input type="hidden" value="${result}" id="result"/>
<div class="container-fluid">
	<div class="row">
		<div class="login-container mx-auto">
			<div class="mx-auto login-form">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="40%" height="20%">
				<h1 class="text-start">Login</h1>
				<form name="loginform" action="/login" method="POST">
					<div class="row mb-3">
						<div class="col-sm-12">
							<input type="text" class="form-control border-top-0 border-start-0 border-end-0" placeholder="ID" id="login_id" name="user_id"
								<c:if test="${!empty saveId}">
									value="${saveId}"
								</c:if>/>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-12">
							<input type="password" class="form-control border-top-0 border-start-0 border-end-0" placeholder="Password" id="login_password" name="user_password"/>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-12">
							<label>
								<input type="checkbox" name="remember" 
									<c:if test="${!empty saveId}">
										checked
									</c:if>/>
								&nbsp;아이디 기억
							</label>
						</div>
					</div>
					<div class="d-flex justify-content-center">
						<button type="submit" class="btn btn-dark rounded-pill w-75 fs-5">Login</button>
					</div>
					<div class="mt-2 d-flex justify-content-center">
						<a href="/register">회원가입</a>
						&nbsp;/&nbsp;
						<a href="#">비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>