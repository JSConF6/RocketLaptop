<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../layout/header.jsp"%>

<main>
	<div class="container">
		<div class="d-flex mt-5 align-items-center justify-content-start mb-3">
			<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="15%" height="20%">
			<h1>주문상세</h1>
		</div>
		<p class="mt-3">
			<fmt:formatDate value="${orderDto.order_date}" var="orderDate" pattern="yy-MM-dd" />
			<span class="fs-5 text-muted">${orderDate} 주문</span>&nbsp;<span class="text-muted fs-5">(${orderDto.order_state})</span>
			<div>
				<span class="text-muted fs-5">주문번호 ${orderDto.order_id}</span>
			</div>
		</p>
		<div>
			<div class="row row-cols-1 row-cols-md-2 g-4">
				<c:forEach var="orderDetail" items="${orderDetailList}">
					<div class="col">
						<div class="card mb-3">
							<div class="row g-0 d-flex align-items-center">
								<div class="col-md-4">
									<a href="/product/detail?product_code=${orderDetail.product_code}"> <img src="/upload${orderDetail.product_img_name}" class="img-fluid rounded-start"></a>
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h4 class="card-title mb-3">
											<a href="/product/detail?product_code=${orderDetail.product_code}"> ${orderDetail.product_name} </a>
										</h4>
										<p class="card-text d-flex align-items-center fs-5 text-muted">
											카테고리 :&nbsp;&nbsp; <span class="badge bg-dark me-1">노트북</span> <span class="badge bg-dark me-1">${orderDetail.category_name}</span>
										</p>
										<p class="card-text fs-5">
											<fmt:formatNumber var="productTotalPrice" value="${orderDetail.product_price * orderDetail.order_de_amount}" pattern="###,###,###" />
											<span class="text-muted">상품가격 : ${productTotalPrice}원 / ${orderDetail.order_de_amount}개</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row row-cols-1 row-cols-md-2 g-4">
					<div class="col">
					<h4 class="mb-3">받는사람 정보</h4>
						<div class="card mb-3">
							<div class="row g-0 d-flex align-items-center">
								<div class="col">
									<div class="card-body">
										<p class="card-text fs-6 text-muted">
											<span>받는사람</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span>${orderDto.order_name}</span>
										</p>
										<p class="card-text fs-6 text-muted">
											<span>연락처</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span>${orderDto.order_phone}</span>
										</p>
										<p class="card-text fs-6 text-muted">
											<span>받는주소</span>&nbsp;&nbsp;&nbsp;&nbsp;
											<span>(${orderDto.user_address1}) ${orderDto.user_address2} ${orderDto.user_address3}</span> 
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<h4 class="mb-3">결제정보</h4>
						<div class="card mb-3">
							<div class="row g-0 d-flex align-items-center">
								<div class="col">
									<div class="card-body">
										<p class="card-text fs-6 text-muted">
											<span>총 상품가격</span>&nbsp;&nbsp;
											<fmt:formatNumber var="orderTotalPrice" value="${orderDto.order_totalprice}" pattern="###,###,###" />
											<span>${orderTotalPrice}원</span>
										</p>
										<p class="card-text fs-6 text-muted">
											<span>배송비</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span>0원</span>
										</p>
										<p class="card-text fs-6 text-muted">
											<span>총 결제금액</span>&nbsp;&nbsp;
											<fmt:formatNumber var="totalPrice" value="${orderDto.order_totalprice + 0}" pattern="###,###,###" />
											<span>${totalPrice}원</span> 
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../layout/footer.jsp"%>