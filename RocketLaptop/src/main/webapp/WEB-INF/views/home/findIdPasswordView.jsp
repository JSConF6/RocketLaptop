<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<input type="hidden" value="findId" id="find" />
<div class="container-fluid">
	<div class="row">
		<div class="find-container mx-auto">
			<div class="mx-auto find-form">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="40%" height="20%">
				<ul class="nav nav-pills d-flex justify-content-evenly mt-3 mb-3">
					<li class="nav-item">
						<a href="#" class="nav-link fs-5 find_id border border-secondary rounded-pill p-3">아이디 찾기</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link fs-5 find_password border border-secondary rounded-pill p-3">비밀번호 찾기</a>
					</li>
				</ul>
				<div class="row mb-3 find_id_input">
					<div class="col-sm-12">
						<input type="text" class="form-control border-top-0 border-start-0 border-end-0" placeholder="아이디를 입력하세요" id="find_user_id" />
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-12">
						<input type="text" class="form-control border-top-0 border-start-0 border-end-0" placeholder="이름을 입력하세요" id="find_user_name" />
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-12">
						<input type="email" class="form-control border-top-0 border-start-0 border-end-0" placeholder="이메일을 입력하세요" id="find_user_email" />
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<button class="btn btn-dark rounded-pill w-75 fs-5 find_btn">아이디 찾기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>