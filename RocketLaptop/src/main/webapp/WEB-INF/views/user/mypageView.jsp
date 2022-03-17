<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-12 h-100 mt-4 mb-5">
			<div class="d-flex align-items-center">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="20%"> <span class="fs-1">마이페이지</span>
			</div>
			<div class="col-12 d-flex mt-5">
				<div class="row row-cols-1 row-cols-lg-2 g-4 w-100 mx-auto">
					<div class="col">
						<div class="card">
							<div class="card-header fs-3">내정보</div>
							<div class="card-body">
								<p class="card-text d-flex justify-content-between fs-4 border-bottom">
									이름 <span>정진섭</span>
								</p>
								<p class="card-text d-flex justify-content-between fs-4 border-bottom">
									이메일 <span>aaa@naver.com</span>
								</p>
								<p class="card-text d-flex justify-content-between fs-4 border-bottom">
									생년월일 <span>1999-12-06</span>
								</p>
								<p class="card-text d-flex justify-content-between fs-4 border-bottom">
									전화번호 <span>010-1111-1111</span>
								</p>
								<p class="card-text d-flex justify-content-between fs-4 border-bottom">
									성별 <span>남성</span>
								</p>
								<div class="d-flex justify-content-between">
									<a href="#" class="btn btn-primary fs-5">비밀번호 변경</a>
									<a href="#" class="btn btn-secondary fs-5">회원정보 수정</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card">
							<div class="card-header fs-3">배송지 정보</div>
							<div class="card-body">
								<p class="card-text d-flex justify-content-between fs-4 border-bottom">
									이름 <span>정진섭</span>
								</p>
								<p class="card-text d-flex justify-content-between fs-4 border-bottom">
									우편번호 <span>31111</span>
								</p>
								<p class="card-text d-flex justify-content-between fs-4 border-bottom">
									주소 <span>충남 아산시 송악면 송악로 805-5</span>
								</p>
								<p class="card-text d-flex justify-content-between fs-4 border-bottom">
									전화번호 <span>010-1111-1111</span>
								</p>
								<p class="card-text d-flex justify-content-between fs-4 border-bottom">
									배송 요청사항 <span>문앞</span>
								</p>
								<div class="d-flex justify-content-center">
									<a href="#" class="btn btn-primary fs-5">배송지 수정</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col w-100">
						<div class="card text-center">
							<div class="card-header d-flex justify-content-center">
								<ul class="nav nav-pills card-header-pills">
									<li class="nav-item">
										<h2>주문목록</h2>
									</li>
								</ul>
							</div>
							<div class="card-body">
								<p class="card-text">
								<table class="table">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>수령인</th>
											<th>배송상태</th>
											<th>결제일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>210824_804412</td>
											<td>정진섭</td>
											<td>배송준비</td>
											<td>22-03-07</td>
										</tr>
									</tbody>
								</table>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>