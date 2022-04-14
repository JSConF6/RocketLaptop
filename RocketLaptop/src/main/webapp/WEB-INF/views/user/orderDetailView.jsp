<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myOrderDetailView.css" type="text/css">
	
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/js/myOrderDetailView.js" type="text/javascript"></script>
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
		
		<!-- LoadingOverlay -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js" integrity="sha512-hktawXAt9BdIaDoaO9DlLp6LYhbHMi5A36LcXQeHgVKUH6kJMOQsAtIw2kmQ9RERDpnSTlafajo6USh9JUXckw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
		<title>RocketLaptop - 주문 상세정보</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		
		<main>
			<div class="container">
				<div class="d-flex mt-5 align-items-center justify-content-start mb-3">
					<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="15%" height="20%">
					<h1>주문상세</h1>
				</div>
				<p class="mt-3">
					<div class="d-flex align-items-center mb-3">
						<fmt:formatDate value="${orderDto.order_date}" var="orderDate" pattern="yy-MM-dd" />
						<span class="fs-5 text-muted">${orderDate} 주문</span>&nbsp;<span class="text-muted fs-5">(${orderDto.order_state})</span>
					</div>
					<div class="d-flex justify-content-between align-items-center">
						<input type="hidden" value="${orderDto.order_id}" id="myOrder_id" />
						<span class="text-muted fs-5">주문번호 ${orderDto.order_id}</span>
						<c:if test="${orderDto.order_state == '배송 완료'}">
							<c:if test="${reviewBtn == true}">
								<button type="button" class="btn btn-primary reviewBoxBtn" data-bs-toggle="modal" data-bs-target="#review_box">리뷰쓰기</button>
							</c:if>
						</c:if>
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
												<c:set var="phone" value="${orderDto.order_phone}"/>
												<c:set var="order_phone" value="${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, 11)}" />
												<span>${order_phone}</span>
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
					<div class="text-center">
						<span class="text-muted fs-3">주문취소는 배송준비중 일때만 가능합니다.</span>
					</div>
					<div class="text-end">
						<c:if test="${orderDto.order_state == '배송준비'}">
							&nbsp;&nbsp;&nbsp;<button class="btn btn-danger orderCancelBtn" data-orderId="${orderDto.order_id}">주문취소</button>
						</c:if>
						<a class="btn btn-primary" href="/user/mypage/order/list?user_id=${param.user_id}">주문목록보기</a>
					</div>
				</div>
			</div>
		</main>
		
		<div class="modal fade" id="review_box" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">리뷰등록</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<select class="form-select mb-2 productReview">
		      		<c:forEach var="orderDetail" items="${orderDetailList}">
		      			<c:if test="${orderDetail.review_yn == 'N'}">
		      				<option value="${orderDetail.product_code}">${orderDetail.product_name}</option>
		      			</c:if>	
		      		</c:forEach>
				</select>
				 <div class="mb-3 star-rating">
				  	<span class="star star1" data-val=1><i class="fa-solid fa-star"></i></span>
				  	<span class="star star2" data-val=2><i class="fa-solid fa-star"></i></span>
				  	<span class="star star3" data-val=3><i class="fa-solid fa-star"></i></span>
				  	<span class="star star4" data-val=4><i class="fa-solid fa-star"></i></span>
				  	<span class="star star5" data-val=5><i class="fa-solid fa-star"></i></span>
				 </div>
				 <textarea class="w-100 review-content" rows="3"></textarea>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary reviewAddBtn">리뷰등록</button>
		        <button type="button" class="btn btn-danger reviewCancelBtn" data-bs-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>