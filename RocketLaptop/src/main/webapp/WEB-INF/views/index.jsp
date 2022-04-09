<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="icon" href="/images/favicon.ico">

	<!-- 제이쿼리 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer" type=""></script>
	
	<!-- 구글 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
	
	<!-- 부트스트랩 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper.css" type="text/css">
	
	<!-- Swiper -->
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

	<title>RocketLaptop</title>
</head>

<body>
	<%@ include file="./layout/header.jsp"%>
	
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/images/banner.png" class="d-block w-100" width="200" height="500" />
			</div>
			<div class="carousel-item">
				<img src="/images/banner.png" class="d-block w-100" width="200" height="500" />
			</div>
			<div class="carousel-item">
				<img src="/images/banner.png" class="d-block w-100" width="200" height="500" />
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col col-10">
				<div class="d-flex justify-content-between mt-4 align-items-center">
					<h1>새로운 상품</h1>
					<a href="/product/newProductList" class="text-secondary"> <i class="fa-solid fa-angle-right fa-2x"></i>
					</a>
				</div>
			</div>
			<c:if test="${!empty newProductList}">
				<div class="swiper mySwiper col-10">
					<div class="swiper-pagination"></div>
					<div class="swiper-wrapper">
						<c:forEach var="newProduct" items="${newProductList}">
							<div class="swiper-slide">
								<div class="card" style="width: 18rem">
									<div class="text-end pt-2 pe-2">
										<span class="badge bg-primary fs-6">New</span>
									</div>
									<a href="/product/detail?product_code=${newProduct.product_code}"> <img src="/upload${newProduct.product_img_name}" class="card-img-top" alt="..." />
									</a>
									<div class="card-body">
										<h6 class="card-title">
											<span class="badge bg-dark">노트북</span>&nbsp; <span class="badge bg-dark">${newProduct.category_name}</span>
										</h6>
										<p class="card-text fs-5 mt-3">${newProduct.product_name}</p>
										<fmt:formatNumber var="newProductPrice" value="${newProduct.product_price}" pattern="###,###,###" />
										<a href="/product/detail?product_code=${newProduct.product_code}" class="btn btn-primary">상세보기</a> &nbsp; <span class="card-text">${newProductPrice}원</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<c:if test="${empty newProductList}">
				<div class="text-center mt-5 mb-5">
					<h1>새로운 상품이 없습니다.</h1>
				</div>
			</c:if>
		</div>
		<div class="row justify-content-center mb-5">
			<div class="col col-10">
				<div class="d-flex justify-content-between mt-4 align-items-center">
					<h1>베스트 상품</h1>
					<a href="/product/bestProductList" class="text-secondary"> <i class="fa-solid fa-angle-right fa-2x"></i>
					</a>
				</div>
			</div>
			<c:if test="${!empty bestProductList}">
				<div class="swiper mySwiper col-10">
					<div class="swiper-pagination"></div>
					<div class="swiper-wrapper">
						<c:forEach var="bestProduct" items="${bestProductList}">
							<div class="swiper-slide">
								<div class="card" style="width: 18rem">
									<div class="text-end pt-2 pe-2">
										<span class="badge bg-danger fs-6">Best</span>
									</div>
									<a href="/product/detail?product_code=${bestProduct.product_code}"> <img src="/upload${bestProduct.product_img_name}" class="card-img-top" alt="..." />
									</a>
									<div class="card-body">
										<h6 class="card-title">
											<span class="badge bg-dark">노트북</span>&nbsp; <span class="badge bg-dark">${bestProduct.category_name}</span>
										</h6>
										<p class="card-text fs-5 mt-3">${bestProduct.product_name}</p>
										<fmt:formatNumber var="bestProductPrice" value="${bestProduct.product_price}" pattern="###,###,###" />
										<a href="/product/detail?product_code=${bestProduct.product_code}" class="btn btn-primary">상세보기</a> &nbsp; <span class="card-text">${bestProductPrice}원</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<c:if test="${empty newProductList}">
				<div class="text-center mt-5 mb-5">
					<h1>베스트 상품이 없습니다.</h1>
				</div>
			</c:if>
		</div>
	</div>
	<script>
		var swiper = new Swiper(".mySwiper", {
			slidesPerView : 1,
			spaceBetween : 10,
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			breakpoints : {
				800 : {
					slidesPerView : 2,
					spaceBetween : 20,
				},
				1250 : {
					slidesPerView : 3,
					spaceBetween : 40,
				},
				1600 : {
					slidesPerView : 4,
					spaceBetween : 50,
				},
				2000 : {
					slidesPerView : 5,
					spaceBetween : 50,
				},
			},
		});
	</script>
	
	<%@ include file="./layout/footer.jsp"%>
	
	</body>
</html>