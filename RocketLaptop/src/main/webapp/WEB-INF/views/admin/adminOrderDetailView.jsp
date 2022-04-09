<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

		<!-- JS -->
		<script type="text/javascript" src="../js/admin/adminOrderDetailView.js"></script>
	
	</head>
	<body>
		<%@ include file="./adminSidebar.jsp"%>
		
		<main class="mt-5 vw-50">
			<div class="container-fluid">
				<div class="w-75 mx-auto">
					<div class="d-flex align-items-center mb-3">
						<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"><span class="fs-1">주문 상세정보</span>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered">
							<tr>
								<th class="text-center">주문번호</th>
								<td colspan="3"><span id="orderId">${orderDto.order_id}</span></td>
							</tr>
							<tr>
								<th class="text-center">받는사람</th>
								<td colspan="3"><span id="orderName">${orderDto.order_name}</span></td>
							</tr>
							<tr>
								<th class="text-center">받는사람 주소지</th>
								<c:set var="address" value="(${orderDto.user_address1}) ${orderDto.user_address2} ${orderDto.user_address3}" />
								<td colspan="3"><span id="address">${address}</span></td>
							</tr>
							<tr>
								<th class="text-center">받는사람 전화번호</th>
								<c:set var="phone" value="${orderDto.order_phone}"/>
								<c:set var="order_phone" value="${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, 11)}" />
								<td><span id="orderPhone">${order_phone}</span></td>
							</tr>
							<tr>
								<th class="text-center">배송상태</th>
								<td colspan="3"><span id="orderState">${orderDto.order_state}</span></td>
							</tr>
							<tr>
								<th class="text-center">총 가격</th>
								<fmt:formatNumber var="totalPrice" value="${orderDto.order_totalprice}" pattern="###,###,###" />
								<td colspan="3"><span id="orderTotalPrice">${totalPrice}원</span></td>
							</tr>
							<tr>
								<th class="text-center">결제일</th>
								<fmt:formatDate var="orderDate" value="${orderDto.order_date}" pattern="yyyy-MM-dd" />
								<td colspan="3"><span id="orderDate">${orderDate}</span></td>
							</tr>
						</table>
					</div>
					<div class="mb-3 d-flex align-items-center justify-content-end">
						<c:if test="${orderDto.order_state == '배송준비'}">
							<span class="fs-4">배송상태 변경 : &nbsp;</span>
							<button class="btn btn-secondary delivery_state_update_btn">배송 중</button>
						</c:if>
						<c:if test="${orderDto.order_state == '배송 중'}">
							<span class="fs-4">배송상태 변경 : &nbsp;</span>
							<button class="btn btn-secondary delivery_state_update_btn">배송 완료</button>
						</c:if>
						<c:if test="${orderDto.order_state == '배송완료'}">
							<button class="btn btn-secondary delivery_state_update_btn" disabled>배송 완료</button>
						</c:if>
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
				</div>
			</div>
		</main>
		
		<%@ include file="./adminFooter.jsp"%>
	</body>
</html>