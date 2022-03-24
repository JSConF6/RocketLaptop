<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<div class="w-75 mx-auto">
			<div class="d-flex align-items-center mb-3">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"><span class="fs-1">주문 상세정보</span>
			</div>
			<form>
				<div class="mb-3">
					<label for="orderId" class="form-label">주문번호</label> <input type="text" class="form-control" id="orderId" value="${orderDto.order_id}" disabled />
				</div>
				<div class="mb-3">
					<label for="orderName" class="form-label">수령인</label> <input type="text" class="form-control" id="orderName" value="${orderDto.order_name}" disabled />
				</div>
				<div class="mb-3">
					<c:set var="address" value="(${orderDto.user_address1}) ${orderDto.user_address2} ${orderDto.user_address3}" />
					<label for="address" class="form-label">수령인 주소지</label> <input type="text" class="form-control" id="address" value="${address}" disabled />
				</div>
				<div class="mb-3">
					<label for="orderPhone" class="form-label">수령인 전화번호</label> <input type="text" class="form-control" id="orderPhone" value="${orderDto.order_phone}" disabled />
				</div>
				<div class="mb-3">
					<label for="orderState" class="form-label">배송상태</label>
					<div class="input-group">
						<input type="text" class="form-control" id="orderState" value="${orderDto.order_state}" disabled />
						<c:if test="${orderDto.order_state == '배송준비'}">
							<button class="btn btn-secondary delivery_state_update_btn">배송 중</button>
						</c:if>
						<c:if test="${orderDto.order_state == '배송 중'}">
							<button class="btn btn-secondary delivery_state_update_btn">배송 완료</button>
						</c:if>
						<c:if test="${orderDto.order_state == '배송완료'}">
							<button class="btn btn-secondary delivery_state_update_btn" disabled>배송 완료</button>
						</c:if>
					</div>
				</div>
				<div class="mb-3">
					<fmt:formatNumber var="totalPrice" value="${orderDto.order_totalprice}" pattern="###,###,###" />
					<label for="orderTotalPrice" class="form-label">주문 총 가격</label> <input type="text" class="form-control" id="orderTotalPrice" value="${totalPrice}원" disabled />
				</div>
				<div class="mb-3">
					<fmt:formatDate var="orderDate" value="${orderDto.order_date}" pattern="yyyy-MM-dd" />
					<label for="orderDate" class="form-label">결제일</label> <input type="text" class="form-control" id="orderDate" value='${orderDate}' disabled />
				</div>
				<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 row-cols-xl-2 g-4">
					<c:forEach var="orderDetail" items="${orderDetailList}">
						<div class="col">
							<div class="card mb-3">
								<div class="row g-0">
									<div class="col-md-4">
										<img src="../upload${orderDetail.product_img_name}" class="img-fluid rounded-start w-100 h-100">
									</div>
									<div class="col-md-8">
										<div class="card-body w-100 h-100 d-flex flex-column justify-content-center">
											<h5 class="card-title mb-3">
												<c:out value="${orderDetail.product_name}" />
											</h5>
											<p class="card-text">
												카테고리 : <span class="badge bg-dark">노트북</span>&nbsp; <span class="badge bg-dark"> <c:out value="${orderDetail.category_name}" />
												</span>
											</p>
											<p class="card-text">
												상품가격 :
												<fmt:formatNumber value="${orderDetail.product_price}" pattern="###,###,###" />
												원
											</p>
											<p class="card-text">
												주문 수량 : <span>${orderDetail.order_de_amount}개</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="d-flex justify-content-end mb-3 mt-3">
					<button class="btn btn-primary orderListBtn">목록</button>
				</div>
			</form>
		</div>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>