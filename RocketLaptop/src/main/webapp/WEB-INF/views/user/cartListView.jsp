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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cartView.css" type="text/css">
		
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/js/cartListView.js" type="text/javascript"></script>
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
		
		<!-- LoadingOverlay -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js" integrity="sha512-hktawXAt9BdIaDoaO9DlLp6LYhbHMi5A36LcXQeHgVKUH6kJMOQsAtIw2kmQ9RERDpnSTlafajo6USh9JUXckw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
		<title>RocketLaptop - 장바구니 목록</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		
		<div class="container-fluid">
			<div class="d-flex mt-3 align-items-center justify-content-center mb-3">
				<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="15%" height="20%">
				<h1>장바구니</h1>
			</div>
			<div class="container padding-bottom-3x mb-1">
				<c:if test="${cartListCount > 0}">
					<div class="table-responsive shopping-cart">
						<table class="table">
							<thead style="border-top: 3px solid">
								<tr>
									<th><input type="checkbox" name="allCheck" /></th>
									<th>상품명</th>
									<th class="text-center">주문갯수</th>
									<th class="text-center">배송비</th>
									<th class="text-center">총가격</th>
									<th class="text-center"><a class="btn btn-sm btn-outline-danger allDeleteBtn" href="#">전체삭제</a></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cart" items="${cartList}">
									<tr>
										<td><input type="checkbox" name="RowCheck" value="${cart.product_price * cart.order_de_amount}" data-cartNum="${cart.cart_num}" data-productCode="${cart.product_code}"/></td>
										<td>
											<div class="product-item">
												<a class="product-thumb" href="#"><img src="/upload${cart.product_img_name}" alt="Product" height="90px"></a>
												<div class="product-info">
													<h4 class="product-title">
														<a href="#">${cart.product_name}</a> <span class="fs-6 mt-2 mb-2">카테고리: ${cart.category_name}</span>
														<fmt:formatNumber var="cartPrice" value="${cart.product_price}" pattern="###,###,###" />
														<span class="fs-6">상품가격: ${cartPrice}원</span>
													</h4>
												</div>
											</div>
										</td>
										<td class="text-center">
											<div class="count-input">
												<input type="text" value="${cart.order_de_amount}" class="form-control text-center bg-white" disabled>
											</div>
										</td>
										<td class="text-center text-lg text-medium">무료배송</td>
										<fmt:formatNumber var="cartTotalPrice" value="${cart.product_price * cart.order_de_amount}" pattern="###,###,###" />
										<td class="text-center text-lg text-medium">${cartTotalPrice}원</td>
										<td class="text-center"><a class="remove-from-cart cartDeleteBtn" href="#" data-toggle="tooltip" title="" data-original-title="Remove item" data-deleteCartNum="${cart.cart_num}"> <i class="fa fa-trash"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="shopping-cart-footer">
						<div class="column"></div>
						<div class="column text-lg fs-3">
							전체가격: <span class="text-medium cartProductTotalPrice">0원</span>
						</div>
					</div>
					<div class="shopping-cart-footer">
						<div class="text-end">
							<form action="/user/order/orderView" method="POST" class="orderViewForm">
								<button class="btn btn-primary orderBtn">주문하기</button>
							</form>
						</div>
					</div>
				</c:if>
				<c:if test="${cartListCount == 0 || empty cartListCount}">
					<div class="text-center mt-5 mb-5">
						<h1>장바구니에 담긴 상품이 없습니다.</h1>
					</div>
				</c:if>
			</div>
		</div>
		
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>