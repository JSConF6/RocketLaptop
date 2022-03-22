<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<div class="w-75 mx-auto">
			<div class="d-flex align-items-center mb-3">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">상품등록</span>
			</div>
			<form action="/admin/productAdd" class="product_add_form" method="POST" enctype="multipart/form-data">
				<input type="hidden" class="imgType" name="imageType"/>
				<div class="mb-3">
					<label for="productCode" class="form-label">상품코드</label> <input type="text" class="form-control" id="productCode" placeholder="상품코드를 입력하세요" name="product_code">
				</div>
				<div class="mb-3">
					<label for="category" class="form-label">카테고리</label> <select class="form-select" name="category_code">
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
					<label for="formFile" class="form-label fs-4">대표 이미지</label><br/>
					<button class="btn btn-primary image_btn me-2" value="thumbnail" id="thumbnail_btn">이미지 첨부</button>
					<input class="form-control image_upload" type="file" id="thumbnail_upload" name="image_upload" accept="image/*"> <span id="thumbnail_value"></span> <img src="../images/remove.png" alt="이미지삭제" width="30px" class="thumbnail_remove image_remove">
				</div>
				<div class="mb-3 img-container">
					<label for="formFile" class="form-label fs-4">상품 이미지1</label> <br/>
					<button class="btn btn-primary image_btn me-2" value="image1" id="image1_btn">이미지 첨부</button>
					<input class="form-control image_upload" type="file" id="image1_upload" name="image_upload" accept="image/*"> <span id="image1_value"></span> <img src="../images/remove.png" alt="이미지삭제" width="30px" class="image1_remove image_remove">
				</div>
				<div class="mb-3 img-container">
					<label for="formFile" class="form-label fs-4">상품 이미지2</label> <br/>
					<button class="btn btn-primary image_btn me-2" value="image2" id="image2_btn">이미지 첨부</button>
					<input class="form-control image_upload" type="file" id="image2_upload" name="image_upload" accept="image/*"> <span id="image2_value"></span> <img src="../images/remove.png" alt="이미지삭제" width="30px" class="image2_remove image_remove">
				</div>
				<div class="mb-3 img-container">
					<label for="formFile" class="form-label fs-4">상품 이미지3</label> <br/>
					<button class="btn btn-primary image_btn me-2" value="image3" id="image3_btn">이미지 첨부</button>
					<input class="form-control image_upload" type="file" id="image3_upload" name="image_upload" accept="image/*"> <span id="image3_value"></span> <img src="../images/remove.png" alt="이미지삭제" width="30px" class="image3_remove image_remove">
				</div>
				<div class="mb-3 img-container">
					<label for="formFile" class="form-label fs-4">상세설명</label> <br/>
					<button class="btn btn-primary image_btn me-2" value="details" id="details_btn">이미지 첨부</button>
					<input class="form-control image_upload" type="file" id="details_upload" name="image_upload" accept="image/*"> <span id="details_value"></span> <img src="../images/remove.png" alt="이미지삭제" width="30px" class="details_remove image_remove">
				</div>
				<div class="d-flex justify-content-end mb-3">
					<button type="submit" class="btn btn-primary me-3">등록</button>
					<button class="btn btn-danger productAddCancelBtn">취소</button>
				</div>
			</form>
		</div>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>