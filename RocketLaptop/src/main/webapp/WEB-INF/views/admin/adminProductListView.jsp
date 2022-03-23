<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
					<div class="col-6">
						<div class="card mb-3">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="../upload${product.product_img_name}" class="img-fluid rounded-start w-100 h-100">
								</div>
								<div class="col-md-8">
									<div class="card-body w-100 h-100 d-flex flex-column justify-content-center">
										<h3 class="card-title mt-3 mb-3">
											<a href="/admin/productDetail?product_code=${product.product_code}"><c:out value="${product.product_name}" /></a>
										</h3>
										<p class="card-text">
											카테고리 : <span class="badge bg-dark">노트북</span>&nbsp; <span class="badge bg-dark"> <c:out value="${product.category_name}" />
											</span>
										</p>
										<fmt:formatNumber var="product_price" value="${product.product_price}" pattern="###,###,###" />
										<p class="card-text">
											상품가격 :
											<c:out value="${product_price}" />
											원
										</p>
										<p class="card-text">
											상품 등록일 :
											<c:out value="${product.product_reg_date}" />
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
							<li class="page-item"><a class="page-link gray">${a}</a></li>
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