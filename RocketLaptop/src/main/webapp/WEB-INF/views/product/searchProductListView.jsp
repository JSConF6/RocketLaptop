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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/findIdPasswordView.css" type="text/css">
		
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/js/findIdPasswordView.js" type="text/javascript"></script>
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
		
		<!-- LoadingOverlay -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js" integrity="sha512-hktawXAt9BdIaDoaO9DlLp6LYhbHMi5A36LcXQeHgVKUH6kJMOQsAtIw2kmQ9RERDpnSTlafajo6USh9JUXckw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
		<title>RocketLaptop - 아이디 비밀번호 찾기</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		
		<div class="container-fluid mb-5">
			<div class="row">
				<div class="col-10 mx-auto">
					<div class="d-flex align-items-center mt-4 mb-4">
						<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="200px" height="20%"> <span class="fs-1">상품 검색 : ${search_word}</span>
					</div>
					<c:if test="${pageHandler.listCount > 0}">
						<div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
							<c:forEach var="searchProduct" items="${searchProductList}">
								<div class="col">
									<div class="card w-100">
										<a href="/product/detail?product_code=${searchProduct.product_code}"> <img src="/upload${searchProduct.product_img_name}" class="card-img-top" alt="..." />
										</a>
										<div class="card-body text-center">
											<p class="card-text">
												<span class="badge bg-dark">노트북</span>&nbsp; <span class="badge bg-dark">${searchProduct.category_name}</span>
											</p>
											<a href="/product/detail?product_code=${searchProduct.product_code}" class="product-list-title">
												<h4 class="card-title mb-3">${searchProduct.product_name}</h4>
											</a>
											<p class="card-text fs-4">
												<fmt:formatNumber var="searchProductPrice" value="${searchProduct.product_price}" pattern="###,###,###" />
												<span>가격 : ${searchProductPrice}원</span>
											</p>
											<a href="/product/detail?product_code=${searchProduct.product_code}" class="btn btn-primary w-100">상세보기</a>
										</div>
									</div>
								</div>
							</c:forEach>
		
						</div>
						<nav class="d-flex justify-content-center">
							<ul class="pagination">
								<c:if test="${pageHandler.page <= 1}">
									<li class="page-item"><a class="page-link gray" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>
								<c:if test="${pageHandler.page > 1}">
									<li class="page-item"><a class="page-link" href="/product/search/list?page=${pageHandler.page-1}&search_field=${search_field}&search_word=${search_word}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>
								<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
									<c:if test="${a == pageHandler.page}">
										<li class="page-item active"><a class="page-link gray">${a}</a></li>
									</c:if>
									<c:if test="${a != pageHandler.page}">
										<li class="page-item"><a class="page-link" href="/product/search/list?page=${a}&search_field=${search_field}&search_word=${search_word}">${a}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageHandler.page >= pageHandler.maxPage}">
									<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
								<c:if test="${pageHandler.page < pageHandler.maxPage}">
									<li class="page-item"><a class="page-link" href="/product/search/list?page=${pageHandler.page+1}&search_field=${search_field}&search_word=${search_word}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
							</ul>
						</nav>
					</c:if>
					<c:if test="${pageHandler.listCount == 0 || empty pageHandler.listCount}">
						<div class="text-center mt-5 mb-5">
							<h1>검색하신 상품이 없습니다.</h1>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>