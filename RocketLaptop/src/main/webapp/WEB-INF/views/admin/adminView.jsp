<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="./adminSidebar.jsp"%>

<input type="hidden" value="${result}" class="result"/>
<main class="mt-5 vw-50">
	<section>
		<div class="container-fluid">
			<div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
				<div class="col">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<i class="fas fa-shopping-cart fa-3x text-warning"></i>
								<div class="text-end text-secondary">
									<h5>주문갯수</h5>
									<h3>10개</h3>
								</div>
							</div>
						</div>
						<div class="card-footer text-secondary">
							<i class="fas fa-sync me-3"></i> <span>Updated Now</span>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<i class="fa-solid fa-boxes-stacked fa-3x text-success"></i>
								<div class="text-end text-secondary">
									<h5>상품갯수</h5>
									<h3>10개</h3>
								</div>
							</div>
						</div>
						<div class="card-footer text-secondary">
							<i class="fas fa-sync me-3"></i> <span>Updated Now</span>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<i class="fa-solid fa-clipboard fa-3x text-secondary"></i>
								<div class="text-end text-secondary">
									<h5>공지사항갯수</h5>
									<h3>10명</h3>
								</div>
							</div>
						</div>
						<div class="card-footer text-secondary">
							<i class="fas fa-sync me-3"></i> <span>Updated Now</span>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<i class="fas fa-users fa-3x text-info"></i>
								<div class="text-end text-secondary">
									<h5>유저수</h5>
									<h3>10명</h3>
								</div>
							</div>
						</div>
						<div class="card-footer text-secondary">
							<i class="fas fa-sync me-3"></i> <span>Updated Now</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col-12">
							<div class="d-flex justify-content-between align-items-center">
								<h3 class="text-muted mb-3 mt-3">문의목록</h3>
								<a href="#" class="text-secondary"><i class="fa-solid fa-angle-right fa-2x"></i> </a>
							</div>
							<table class="table bg-light text-center">
								<thead>
									<tr class="text-muted">
										<th>#</th>
										<th>아이디</th>
										<th>이름</th>
										<th>생년월일</th>
										<th>핸드폰번호</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<th>jsconf</th>
										<th>철수</th>
										<th>2022-01-01</th>
										<th>010-1111-2222</th>
									</tr>
									<tr>
										<th>1</th>
										<th>jsconf</th>
										<th>철수</th>
										<th>2022-01-01</th>
										<th>010-1111-2222</th>
									</tr>
									<tr>
										<th>1</th>
										<th>jsconf</th>
										<th>철수</th>
										<th>2022-01-01</th>
										<th>010-1111-2222</th>
									</tr>
									<tr>
										<th>1</th>
										<th>jsconf</th>
										<th>철수</th>
										<th>2022-01-01</th>
										<th>010-1111-2222</th>
									</tr>
									<tr>
										<th>1</th>
										<th>jsconf</th>
										<th>철수</th>
										<th>2022-01-01</th>
										<th>010-1111-2222</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="container-fluid">
			<div class="row mb-5">
				<div class="col">
					<div class="row">
						<div class="col-12">
							<div class="d-flex justify-content-between align-items-center">
								<h3 class="text-muted mb-3 mt-3">주문목록</h3>
								<a href="#" class="text-secondary"><i class="fa-solid fa-angle-right fa-2x"></i> </a>
							</div>
							<table class="table bg-light text-center">
								<thead>
									<tr class="text-muted">
										<th>#</th>
										<th>아이디</th>
										<th>이름</th>
										<th>생년월일</th>
										<th>핸드폰번호</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<th>jsconf</th>
										<th>철수</th>
										<th>2022-01-01</th>
										<th>010-1111-2222</th>
									</tr>
									<tr>
										<th>1</th>
										<th>jsconf</th>
										<th>철수</th>
										<th>2022-01-01</th>
										<th>010-1111-2222</th>
									</tr>
									<tr>
										<th>1</th>
										<th>jsconf</th>
										<th>철수</th>
										<th>2022-01-01</th>
										<th>010-1111-2222</th>
									</tr>
									<tr>
										<th>1</th>
										<th>jsconf</th>
										<th>철수</th>
										<th>2022-01-01</th>
										<th>010-1111-2222</th>
									</tr>
									<tr>
										<th>1</th>
										<th>jsconf</th>
										<th>철수</th>
										<th>2022-01-01</th>
										<th>010-1111-2222</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>

<%@ include file="./adminFooter.jsp" %>