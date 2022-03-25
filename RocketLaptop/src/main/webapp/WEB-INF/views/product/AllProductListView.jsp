<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container-fluid mb-5">
	<div class="row">
		<div class="col-10 mx-auto">
			<div class="d-flex align-items-center mt-3 mb-3">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="10%" height="20%"> <span class="fs-1">전체상품</span>
			</div>
			<div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 row-cols-xxl-5 g-4">
				<div class="col">
					<div class="card w-100">
						<a href="#">
							<img src="../images/280.jpg" class="card-img-top" alt="..." />
						</a>
						<div class="card-body text-center">
							<p class="card-text">
								<span class="badge bg-dark">스마트폰</span>&nbsp; <span class="badge bg-dark">삼성</span>
							</p>
							<a href="#" class="product-list-title">
								<h4 class="card-title mb-3">삼성 갤럭시 10+</h4>
							</a>
							<p class="card-text fs-4">
								<span>가격 : 219,000원</span>
							</p>
							<a href="#" class="btn btn-primary w-100">상세보기</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 w-100">
						<a href="#">
							<img src="../images/280.jpg" class="card-img-top" alt="..." />
						</a>
						<div class="card-body">
							<p class="card-text">
								<span class="badge bg-dark">스마트폰</span>&nbsp; <span class="badge bg-dark">삼성</span>
							</p>
							<a href="#">
								<h4 class="card-title mb-3">삼성 갤럭시 10+</h4>
							</a>
							<p class="card-text fs-4">
								<span>219,000원</span>
							</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 w-100">
						<img src="../images/281.jpg" class="card-img-top" alt="..." />
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a short card.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 w-100">
						<img src="../images/280.jpg" class="card-img-top" alt="..." />
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 w-100">
						<img src="../images/281.jpg" class="card-img-top" alt="..." />
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100 w-100">
						<img src="../images/281.jpg" class="card-img-top" alt="..." />
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
						</div>
					</div>
				</div>
			</div>
			<nav aria-label="Page navigation example" class="p-0">
				<ul class="pagination justify-content-center mt-3">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>