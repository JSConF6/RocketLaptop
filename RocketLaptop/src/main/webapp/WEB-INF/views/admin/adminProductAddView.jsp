<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		
		<!-- Style -->
		<link rel="stylesheet" href="../css/admin/adminProductAddView.css">
		
		<!-- JS -->
		<script type="text/javascript" src="../js/admin/adminProductAddView.js"></script>
	
	</head>
	<body>
		<%@ include file="./adminSidebar.jsp"%>
		
		<main class="mt-5 vw-50">
			<div class="container-fluid">
				<div class="w-75 mx-auto">
					<div class="d-flex align-items-center mb-3">
						<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">상품등록</span>
					</div>
					<form class="product_add_form">
						<input type="hidden" class="imgType" name="imageType"/>
						<div class="mb-3">
							<label for="productCode" class="form-label">상품코드</label> <input type="text" class="form-control" id="productCode" placeholder="상품코드를 입력하세요" name="product_code">
						</div>
						<div class="mb-3">
							<label for="category" class="form-label">카테고리</label> <select class="form-select" id="category_code" name="category_code">
								<c:forEach var="category" items="${categoryList}" varStatus="status">
									<option value="${category.category_code}"><c:out value="${category.category_name}"/> </option>
								</c:forEach>
							</select>
						</div>
						<div class="mb-3">
							<label for="productName" class="form-label">상품이름</label> <input type="text" class="form-control" id="productName" placeholder="상품이름을 입력하세요" name="product_name">
						</div>
						<div class="mb-3">
							<label for="productPrice" class="form-label">상품가격</label> <input type=text class="form-control" id="productPrice" pattern="[0-9]+" placeholder="상품가격을 숫자로 입력하세요" name="product_price">
						</div>
						<div class="mb-3 img-container">
							<label for="thumbnail_upload" class="form-label fs-4">대표 이미지<br/>
								<span class="btn btn-primary me-2">이미지 첨부</span>
								<input class="form-control image_upload" type="file" id="thumbnail_upload" name="image_upload" accept="image/*"> <span id="thumbnail_value"></span> <img src="../images/remove.png" alt="이미지삭제" width="30px" class="thumbnail_remove image_remove" id="thumbnail_remove">
							</label>
						</div>
						<div class="mb-3 img-container">
							<label for="image1_upload" class="form-label fs-4">상품 이미지1<br/>
								<span class="btn btn-primary me-2">이미지 첨부</span>
								<input class="form-control image_upload" type="file" id="image1_upload" name="image_upload" accept="image/*"> <span id="image1_value"></span> <img src="../images/remove.png" alt="이미지삭제" width="30px" class="image1_remove image_remove" id="image1_remove">
							</label>
						</div>
						<div class="mb-3 img-container">
							<label for="image2_upload" class="form-label fs-4">상품 이미지2<br/>
								<span class="btn btn-primary me-2">이미지 첨부</span>
								<input class="form-control image_upload" type="file" id="image2_upload" name="image_upload" accept="image/*"> <span id="image2_value"></span> <img src="../images/remove.png" alt="이미지삭제" width="30px" class="image2_remove image_remove" id="image2_remove">
							</label>
						</div>
						<div class="mb-3 img-container">
							<label for="image3_upload" class="form-label fs-4">상품 이미지3<br/>
								<span class="btn btn-primary me-2">이미지 첨부</span>
								<input class="form-control image_upload" type="file" id="image3_upload" name="image_upload" accept="image/*"> <span id="image3_value"></span> <img src="../images/remove.png" alt="이미지삭제" width="30px" class="image3_remove image_remove" id="image3_remove">
							</label>
						</div>
						<div class="mb-3 img-container">
							<label for="detail_upload" class="form-label fs-4">상세설명<br/>
								<span class="btn btn-primary me-2">이미지 첨부</span>
								<input class="form-control image_upload" type="file" id="detail_upload" name="image_upload" accept="image/*"> <span id="detail_value"></span> <img src="../images/remove.png" alt="이미지삭제" width="30px" class="detail_remove image_remove" id="detail_remove">
							</label>
						</div>
						<div class="d-flex justify-content-end mb-3">
							<button class="btn btn-primary me-3 productAddSubmitBtn">등록</button>
							<button class="btn btn-danger productAddCancelBtn">취소</button>
						</div>
					</form>
				</div>
			</div>
		</main>
		
		<%@ include file="./adminFooter.jsp"%>
	</body>
</html>