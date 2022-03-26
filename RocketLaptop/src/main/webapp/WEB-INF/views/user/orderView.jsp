<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../layout/header.jsp"%>

<main>
	<div class="container">
		<div class="d-flex mt-5 align-items-center justify-content-start mb-5">
			<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="15%" height="20%">
			<h1>상품주문</h1>
		</div>

		<c:set var="orderTotalPrice" value="0" />
		<div class="row g-5">
			<div class="col-md-7 col-lg-8">
				<h2 class="mb-3">구매자정보</h2>
				<div class="row g-3">
					<!-- 구매자 -->
					<div class="col-12">
						<label for="user_name" class="form-label">구매자</label> <input type="text" class="form-control" value="${userDto.user_name}" readonly="readonly">
					</div>

					<!-- 이메일 -->
					<div class="col-12">
						<label for="user_email" class="form-label">이메일</label> <input type="text" class="form-control" value="${userDto.user_email}" readonly="readonly">
					</div>

					<!-- 연락처 -->
					<div class="col-12">
						<label for="user_phone" class="form-label">연락처</label> <input type="text" class="form-control" value="${userDto.user_phone}" readonly="readonly">
					</div>
				</div>

				<hr class="my-4">

				<h2 class="mb-3">받는사람정보</h2>
				<div class="row g-3">
					<!-- 주문자 -->
					<div class="col-12">
						<label for="order_name" class="form-label">받는사람</label> <input type="text" class="form-control" id="order_name" name="order_name" placeholder="이름을 입력해 주세요." required="required">
					</div>

					<!-- 연락처 -->
					<div class="col-12">
						<label for="order_phone" class="form-label">연락처</label> <input type="text" class="form-control" id="order_phone" name="order_phone" placeholder="'-'포함해서 입력해 주세요" required="required">
					</div>

					<!-- 우편번호 -->
					<div class="col-12">
						<label for="user_address1">우편번호</label>
						<div class="input-group">
							<input type="text" class="form-control" id="user_address1" name="user_address1" readOnly> <input type="button" class="btn btn-secondary" id="postBtn" value="주소 검색">
						</div>
					</div>

					<!-- 주소 -->
					<div class="col-12">
						<label for="user_address2">주소</label> <input type="text" class="form-control" id="user_address2" name="user_address2" readOnly>
					</div>

					<!-- 상세 주소 -->
					<div class="col-12">
						<label for="user_address3">상세 주소</label> <input type="text" class="form-control" id="user_address3" name="user_address3" placeholder="상세주소 입력">
					</div>
				</div>
			</div>
			<div class="col-md-5 col-lg-4 order-md-last border border-2 rounded border-secondary h-100">
				<div class="col">
					<div class="fs-3 border-bottom border-secondary border-2 mb-3 mt-3 pb-1">
						<input type="hidden" id="orderCount" value="${orderViewListCount}" />
						<h3>주문 상품 ${orderViewListCount}개</h3>
					</div>
					<div>
						<ul class="list-group mb-1">
							<c:forEach var="order" items="${orderViewList}">
								<li class="list-group-item border border-secondary border-2 rounded mb-3">
									<div class="d-flex align-items-center mb-2">
										<div class="me-3">
											<img alt="" src="/upload${order.product_img_name}" width="100px" height="100px">
										</div>
										<div>
											<input type="hidden" name="data" data-cartNum="${order.cart_num}" data-productCode="${order.product_code}" /> <span class="text-muted">${order.product_name}</span><br /> <span class="text-muted">카테고리 : ${order.category_name}</span><br />
											<c:set var="orderTotalPrice" value="${orderTotalPrice + order.product_price * order.order_de_amount}" />
											<fmt:formatNumber var="productTotalPrice" value="${order.product_price * order.order_de_amount}" pattern="###,###,###" />
											<span class="text-muted">상품가격 : ${productTotalPrice}원 / ${order.order_de_amount}개</span>
										</div>
									</div>
									<div class="border border-2 border-secondary p-2 rounded mb-2">
										<div class="d-flex justify-content-between text-muted">
											배송비 <span>무료배송</span>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="border-top border-2 border-secondary p-2 border-bottom mb-3">
						<p class="d-flex justify-content-between text-muted fs-4">
							<fmt:formatNumber var="totalPrice" value="${orderTotalPrice}" pattern="###,###,###" />
							<input type="hidden" id="orderTotalPrice" value="${orderTotalPrice}" /> 상품금액 <span>${totalPrice}원</span>
						</p>
						<p class="d-flex justify-content-between text-muted fs-4 mb-0">
							배송비 <span>0원</span>
						</p>
					</div>
				</div>
				<div class="mb-4">
					<button class="w-100 btn btn-primary fs-4 orderAddBtn">결제하기</button>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../layout/footer.jsp"%>