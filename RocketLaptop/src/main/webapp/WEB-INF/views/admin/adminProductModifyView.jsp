<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<div class="w-75 mx-auto">
			<div class="d-flex align-items-center mb-3">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">상품수정</span>
			</div>
			<form class="product_add_form">
				<input type="hidden" class="imgType" name="imageType"/>
				<div class="mb-3">
					<label for="productCode" class="form-label">상품코드</label> 
					<input type="text" class="form-control" id="productCode" value="${productDetail.product_code}" disabled>
				</div>
				<div class="mb-3">
					<label for="category" class="form-label">카테고리</label> 
					<select class="form-select" id="category_code" disabled>
						<option value="${productDetail.category_code}"><c:out value="${productDetail.category_name}"/> </option>
					</select>
				</div>
				<div class="mb-3">
					<label for="productName" class="form-label">상품이름</label> 
					<input type="text" class="form-control" id="productName" placeholder="상품이름을 입력하세요" value="${productDetail.product_name}">
				</div>
				<div class="mb-3">
					<label for="productPrice" class="form-label">상품가격</label> 
					<input type=text class="form-control" id="productPrice" pattern="[0-9]+" placeholder="상품가격을 숫자로 입력하세요" value="${productDetail.product_price}">
				</div>
				<c:forEach var="file" items="${fileList}" varStatus="status">
					<div class="mb-3 img-container">
					<c:if test="${file.product_img_type == 1}">
						<label for="thumbnail_upload" class="form-label fs-4">대표 이미지<br/>
							<span class="btn btn-primary me-2">이미지 첨부</span>
							<input class="form-control image_modify_upload" type="file" id="thumbnail_upload" accept="image/*"> 
							<span id="thumbnail_value" class="image_value"> <c:out value="${file.product_img_original_name}" /> </span> 
							<img src="../images/remove.png" alt="이미지삭제" width="30px" class="thumbnail_remove image_modify_remove" id="thumbnail_remove">
						</label>
					</c:if>
					<c:if test="${file.product_img_type == 2}">
						<label for="image${status.index}_upload" class="form-label fs-4">상품 이미지${status.index}<br/>
							<span class="btn btn-primary me-2">이미지 첨부</span>
							<input class="form-control image_modify_upload" type="file" id="image${status.index}_upload" accept="image/*"> 
							<span id="image${status.index}_value" class="image_value"> <c:out value="${file.product_img_original_name}" /> </span> 
							<img src="../images/remove.png" alt="이미지삭제" width="30px" class="image${status.index}_remove image_modify_remove" id="image${status.index}_remove">
						</label>
					</c:if>
					<c:if test="${file.product_img_type == 3}">
						<label for="detail_upload" class="form-label fs-4">상세설명<br/>
							<span class="btn btn-primary me-2">이미지 첨부</span>
							<input class="form-control image_modify_upload" type="file" id="detail_upload" accept="image/*"> 
							<span id="detail_value" class="image_value"> <c:out value="${file.product_img_original_name}" /> </span> 
							<img src="../images/remove.png" alt="이미지삭제" width="30px" class="detail_remove image_modify_remove" id="detail_remove">
						</label>
					</c:if>
				</div>
				</c:forEach>
				<div class="d-flex justify-content-end mb-3">
					<button class="btn btn-primary me-3 productModdifySubmitBtn">수정</button>
					<button class="btn btn-danger productModifyCancelBtn">취소</button>
				</div>
			</form>
		</div>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>