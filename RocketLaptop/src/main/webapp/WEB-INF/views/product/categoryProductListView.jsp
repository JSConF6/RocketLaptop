<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../layout/header.jsp"%>

<div class="container-fluid mb-5">
	<div class="row">
		<div class="col-10 mx-auto">
			<div class="d-flex align-items-center mt-4 mb-4">
				<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="200px" height="20%"> <span class="fs-1">카테고리 : ${categoryName}</span>
			</div>
			<c:if test="${pageHandler.listCount > 0}">
				<div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
					<c:forEach var="categoryProduct" items="${categoryProductList}">
						<div class="col">
							<div class="card w-100">
								<a href="/product/detail?product_code=${categoryProduct.product_code}"> <img src="/upload${categoryProduct.product_img_name}" class="card-img-top" alt="..." />
								</a>
								<div class="card-body text-center">
									<p class="card-text">
										<span class="badge bg-dark">노트북</span>&nbsp; <span class="badge bg-dark">${categoryProduct.category_name}</span>
									</p>
									<a href="/product/detail?product_code=${categoryProduct.product_code}" class="product-list-title">
										<h4 class="card-title mb-3">${categoryProduct.product_name}</h4>
									</a>
									<p class="card-text fs-4">
										<fmt:formatNumber var="categoryProductPrice" value="${categoryProduct.product_price}" pattern="###,###,###" />
										<span>가격 : ${categoryProductPrice}원</span>
									</p>
									<a href="/product/detail?product_code=${categoryProduct.product_code}" class="btn btn-primary w-100">상세보기</a>
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
							<li class="page-item"><a class="page-link" href="/product/category/list?page=${pageHandler.page-1}&category_code=${param.category_code}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
							<c:if test="${a == pageHandler.page}">
								<li class="page-item active"><a class="page-link gray">${a}</a></li>
							</c:if>
							<c:if test="${a != pageHandler.page}">
								<li class="page-item"><a class="page-link" href="/product/category/list?page=${a}&category_code=${param.category_code}">${a}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageHandler.page >= pageHandler.maxPage}">
							<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
						<c:if test="${pageHandler.page < pageHandler.maxPage}">
							<li class="page-item"><a class="page-link" href="/product/category/list?page=${pageHandler.page+1}&category_code=${param.category_code}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
					</ul>
				</nav>
			</c:if>
			<c:if test="${pageHandler.listCount == 0 || empty pageHandler.listCount}">
				<div class="text-center mt-5 mb-5">
					<h1>상품이 없습니다.</h1>
				</div>
			</c:if>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>