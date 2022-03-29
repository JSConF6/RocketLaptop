<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../layout/header.jsp"%>

<div class="container-fluid mt-5 mb-5">
	<div class="row">
		<div class="col-md-5">
			<div id="carouselExampleDark" class="carousel carousel-dark slide mx-auto w-75" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<img src="/upload${fileList[1].product_img_name}" class="d-block w-100" alt="..." />
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="/upload${fileList[2].product_img_name}" class="d-block w-100" alt="..." />
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<div class="carousel-item">
						<img src="/upload${fileList[3].product_img_name}" class="d-block w-100" alt="..." />
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="col-md-7">
			<div class="card shadow-sm h-100">
				<div class="card-body mt-5 mb-5">
					<input type="hidden" value="${productDetail.product_price}" id="price" />
					<input type="hidden" value="${productDetail.product_code}" id="product_code" />
					<h5 class="card-title fs-3 text-start">${productDetail.product_name}</h5>
					<fmt:formatNumber var="productDetailPrice" value="${productDetail.product_price}" pattern="###,###,###" />
					<h5 class="card-title pt-3 border-top fs-3 text-start productDetailPrice">${productDetailPrice}원</h5>
					<p class="card-text pt-3 border-top text-start">
						<span class="badge bg-dark me-1 fs-3">노트북</span><span class="badge bg-dark me-1 fs-3">${productDetail.category_name}</span>
					</p>
					<p class="card-text pb-3 fs-3 text-start border-top pt-3 mb-0">무료배송</p>
					<p class="card-text pb-3 fs-3 text-start border-top pt-3 mb-0">5일 이내 출고 (주말, 공휴일 제외)</p>
					<div class="card-text border-top pt-3 pb-3">
						<div class="row align-items-center">
							<div class="col-auto">
								<label class="col-form-label fs-3">구매수량</label>
							</div>
							<div class="col-auto">
								<div class="input-group">
									<span class="input-group-text minus" style="cursor: pointer">-</span>
									<input type="text" class="form-control bg-white text-center productCount" style="width: 45px" disabled value="1"/>
									<span class="input-group-text plus" style="cursor: pointer">+</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row pt-3 pb-3 border-top">
						<p class="d-flex justify-content-between fs-3">
							총 상품 금액<span class="productTotalPrice">${productDetailPrice}원</span>
						</p>
					</div>
					<div class="d-flex justify-content-between align-items-center">
						<div class="col-6 d-grid p-1">
							<button type="button" class="btn btn-lg btn-dark btn-outline-secondary text-white cartBtn">장바구니 담기</button>
						</div>
						<div class="col-6 d-grid p-1">
							<form action="/user/order/mainOrderView" method="POST" id="productDetailOrderAdd"></form>
							<button type="button" class="btn btn-lg btn-primary text-white productDetailOrderBtn">주문하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12 bg-secondary mt-5 mb-5">
			<h2 class="text-white pt-3 pb-3 mb-0 text-center">상세설명</h2>
		</div>
		<div class="col-12 d-flex justify-content-center">
			<img class="img-fluid" src="/upload${fileList[4].product_img_name}" />
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>