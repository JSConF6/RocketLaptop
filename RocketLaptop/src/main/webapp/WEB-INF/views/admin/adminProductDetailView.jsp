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
		
		<!-- CSS -->
		<link rel="stylesheet" href="../css/admin/adminProductAddView.css">
		
		<!-- JS -->
		<script type="text/javascript" src="../js/admin/adminProductDetailView.js"></script>
	
	</head>
	<body>
		<%@ include file="./adminSidebar.jsp"%>
		
		<main class="mt-5 vw-50">
			<div class="container-fluid">
				<div class="w-75 mx-auto">
					<div class="d-flex align-items-center mb-3">
						<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"><span class="fs-1">상품 상세정보</span>
					</div>
					<form>
						<div class="mb-3">
							<label for="productCode" class="form-label">상품코드</label> <input type="text" class="form-control" id="productCode" value="${productDetail.product_code}" disabled />
						</div>
						<div class="mb-3">
							<label for="category" class="form-label">카테고리</label> <select class="form-select" disabled value="${productDetail.category_code}">
								<option value="${productDetail.category_code}"><c:out value="${productDetail.category_name}" />
								</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="productName" class="form-label">상품이름</label> <input type="text" class="form-control" id="productName" value="${productDetail.product_name}" disabled />
						</div>
						<div class="mb-3">
							<label for="productStock" class="form-label">상품수량</label> <input type="text" class="form-control" id="productStock" value="${productDetail.product_stock}개" disabled />
						</div>
						<div class="mb-3">
							<fmt:formatNumber var="product_price" value="${productDetail.product_price}" pattern="###,###"></fmt:formatNumber>
							<label for="productPrice" class="form-label">상품가격</label> <input type="text" class="form-control" id="productPrice" value="${product_price}원" disabled />
						</div>
						<div class="mb-3">
							<fmt:formatDate var="productDate" value="${productDetail.product_reg_date}" pattern="yyyy-MM-dd"/>
							<label for="productDate" class="form-label">상품등록일</label> <input type="text" class="form-control" id="productDate" value='${productDate}' disabled />
						</div>
						<c:set var="product_detail" />
						<div class="row row-cols-1 row-cols-md-2 g-4">
							<c:forEach var="file" items="${fileList}" varStatus="status">
								<div class="col">
									<c:if test="${file.product_img_type == 1 || file.product_img_type == 2}">
										<div class="card">
											<c:if test="${file.product_img_type == 1}">
												<div class="card-body">
													<h5 class="card-title text-center">대표이미지</h5>
													<img class="card-img-top" src="../upload${file.product_img_name}" />
												</div>
											</c:if>
											<c:if test="${file.product_img_type == 2}">
												<div class="card-body">
													<h5 class="card-title text-center">
														상품이미지
														<c:out value="${status.index}" />
													</h5>
													<img class="card-img-top" src="../upload${file.product_img_name}" />
												</div>
											</c:if>
										</div>
									</c:if>
								</div>
								<c:if test="${file.product_img_type == 3}">
									<c:set var="product_detail" value="${file.product_img_original_name}" />
								</c:if>
							</c:forEach>
						</div>
						<div class="mb-3">
							<div class="mb-3 img-container d-flex align-items-center">
								<span class="fs-4">상세설명</span>&nbsp;&nbsp;<span id="details_value"><c:out value="${product_detail}" /></span>
							</div>
						</div>
						<div class="d-flex justify-content-end mb-3 mt-3">
							<a class="btn btn-secondary me-3" href="/admin/productModifyView?product_code=${productDetail.product_code}">수정</a>
							<button class="btn btn-danger me-3 productDeleteBtn">삭제</button>
							<button class="btn btn-primary productListBtn">목록</button>
						</div>
					</form>
				</div>
			</div>
		</main>
		
		<%@ include file="./adminFooter.jsp"%>
	</body>
</html>