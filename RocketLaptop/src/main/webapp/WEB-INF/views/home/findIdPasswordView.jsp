<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<input type="hidden" value="findId" id="find" />
<div class="container-fluid">
	<div class="row">
		<div class="col-12 p-0 mt-5 find-container mx-auto">
			<div class="d-flex justify-content-center">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="300px" height="20%">
			</div>
			<ul class="nav nav-tabs nav-pills text-center justify-content-evenly bg-secondary align-items-center rounded-top mt-3" id="myTab" role="tablist">
			  <li class="nav-item w-25" role="presentation">
			    <a class="nav-link text-white rounded-1 active" id="find-id_tab" data-bs-toggle="tab" data-bs-target="#findId" type="button" role="tab" aria-selected="true">아이디찾기</a>
			  </li>
			  <li class="nav-item w-25" role="presentation">
			    <a class="nav-link text-white rounded-1" id="find-password_tab" data-bs-toggle="tab" data-bs-target="#findPassword" type="button" role="tab" aria-selected="false">비밀번호찾기</a>
			  </li>
			</ul>
			<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="findId" role="tabpanel">
			  	<div class="col-12 find-form mx-auto border-start border-end border-bottom border-secondary rounded-bottom p-4">
			  		<div>
						<input type="text" class="form-control border-top-0 border-start-0 border-end-0 mb-3" placeholder="이름을 입력하세요" id="find_id_user_name" />
						<input type="email" class="form-control border-top-0 border-start-0 border-end-0 mb-4" placeholder="이메일을 입력하세요" id="find_id_user_email" />
						<div class="d-flex justify-content-center mt-3">
							<button class="btn btn-dark rounded-pill fs-5 find_id_btn find_btn">아이디 찾기</button>
						</div>
					</div>
				</div>
			  </div>
			  <div class="tab-pane fade" id="findPassword" role="tabpanel">
			  	<div class="col-12 find-form mx-auto border-start border-end border-bottom border-secondary rounded-bottom p-4">
			  		<div>
						<input type="text" class="form-control border-top-0 border-start-0 border-end-0 mb-3" placeholder="아이디를 입력하세요" id="find_password_user_id" />
						<input type="text" class="form-control border-top-0 border-start-0 border-end-0 mb-3" placeholder="이름을 입력하세요" id="find_password_user_name" />
						<input type="email" class="form-control border-top-0 border-start-0 border-end-0 mb-4" placeholder="이메일을 입력하세요" id="find_password_user_email" />
						<div class="d-flex justify-content-center mt-3">
							<button class="btn btn-dark rounded-pill fs-5 find_passwrod_btn find_btn">비밀번호 찾기</button>
						</div>
					</div>
				</div>
			  </div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>