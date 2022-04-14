<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RocketLaptop - 관리자페이지</title>
		
		<!-- 제이쿼리 -->
		<script src="../js/jquery-3.6.0.min.js"></script>
		
		<!-- 구글 폰트 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
		
		<!-- 부트스트랩 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<!-- Font Awesome -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
	
	</head>
	<body>
		<%@ include file="./adminSidebar.jsp"%>
		
		<main class="mt-5 vw-50">
			<div class="container-fluid">
				<div class="d-flex align-items-center">
					<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">상품목록</span>
				</div>
				<p class="mt-3 d-flex justify-content-between align-items-center">
					<span class="fs-5">상품 갯수 : ${pageHandler.listCount}개</span> <a class="btn btn-primary" href="/admin/productAddView">상품등록</a>
				</p>
				<c:if test="${pageHandler.listCount > 0}">
					<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 row-cols-xl-2 g-4">
						<c:forEach var="product" items="${productList}">
							<div class="col">
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col-md-5">
											<img src="../upload${product.product_img_name}" class="img-fluid rounded-start w-100 h-100">
										</div>
										<div class="col-md-7">
											<div class="card-body w-100 h-100 d-flex flex-column justify-content-center">
												<h3 class="card-title mt-3 mb-3">
													<a href="/admin/productDetail?product_code=${product.product_code}"><c:out value="${product.product_name}" /></a>
												</h3>
												<p class="card-text fs-5">
													카테고리 : <span class="badge bg-dark">노트북</span>&nbsp; <span class="badge bg-dark"> <c:out value="${product.category_name}" />
													</span>
												</p>
												<p class="card-text fs-5">
													상품가격 :
													<fmt:formatNumber value="${product.product_price}" pattern="###,###,###" />
													원
												</p>
												<c:if test="${product.product_stock == 0}">
													<p class="card-text fs-5">
														상품상태 : <span class="text-danger">품절</span>
													</p>
												</c:if>
												<c:if test="${product.product_stock != 0}">
													<p class="card-text fs-5">
														상품상태 : <span class="text-success">판매중</span>
													</p>
												</c:if>
												<p class="card-text fs-5">
													상품 등록일 :
													<fmt:formatDate value="${product.product_reg_date}" pattern="yyyy-MM-dd" />
												</p>
												<p class="card-text text-end">
													<a class="btn btn-primary" href="/admin/productDetail?&product_code=${product.product_code}">상세보기</a>
												</p>
											</div>
										</div>
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
								<li class="page-item"><a class="page-link" href="/admin/productList?page=${pageHandler.page-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
								<c:if test="${a == pageHandler.page}">
									<li class="page-item active"><a class="page-link gray">${a}</a></li>
								</c:if>
								<c:if test="${a != pageHandler.page}">
									<li class="page-item"><a class="page-link" href="/admin/productList?page=${a}">${a}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${pageHandler.page >= pageHandler.maxPage}">
								<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
							</c:if>
							<c:if test="${pageHandler.page < pageHandler.maxPage}">
								<li class="page-item"><a class="page-link" href="/admin/productList?page=${pageHandler.page+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
							</c:if>
						</ul>
					</nav>
				</c:if>
				<c:if test="${pageHandler.listCount == 0 || empty pageHandler.listCount}">
					<div class="text-center mt-5 mb-5">
						<h1>등록된 상품이 없습니다.</h1>
					</div>
				</c:if>
			</div>
		</main>
		
		<%@ include file="./adminFooter.jsp"%>
	</body>
</html>