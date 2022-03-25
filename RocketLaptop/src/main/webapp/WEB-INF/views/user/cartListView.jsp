<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
								<td><input type="checkbox" name="RowCheck" value="${cart.product_price * cart.order_de_amount}" data-cartNum="${cart.cart_num}" /></td>
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
					<a class="btn btn-primary" href="#">주문하기</a>
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