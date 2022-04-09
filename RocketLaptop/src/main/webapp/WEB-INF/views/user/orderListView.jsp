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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderListView.css" type="text/css">
		
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/js/orderListView.js" type="text/javascript"></script>
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
		
		<!-- LoadingOverlay -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-loading-overlay/2.1.7/loadingoverlay.min.js" integrity="sha512-hktawXAt9BdIaDoaO9DlLp6LYhbHMi5A36LcXQeHgVKUH6kJMOQsAtIw2kmQ9RERDpnSTlafajo6USh9JUXckw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
		<title>RocketLaptop - 주문목록</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		
		<main>
			<div class="mypage_orderlist_container">
				<div class="d-flex mt-5 align-items-center justify-content-start mb-3">
					<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="300px" height="20%">
					<h1>주문목록</h1>
				</div>
				<p class="mt-3 mb-0 d-flex justify-content-between">
					<span class="fs-5 myOrderListCount">주문건수 : ${pageHandler.listCount}개</span>
					<select id="order_state">
						<option value="0" selected>전체</option>
						<option value="1">배송준비</option>
						<option value="2">배송중</option>
						<option value="3">배송완료</option>
					</select>
				</p>
				<c:if test="${pageHandler.listCount > 0}">
					<table class="table text-center align-middle order_table">
						<thead>
							<tr>
								<th>주문일자<br>[주문번호]</th>
								<th>이미지</th>
								<th>상품정보</th>
								<th>수량</th>
								<th>상품구매금액</th>
								<th>주문처리상태</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="index" value="0" />
							<c:forEach var="orderDto" items="${orderList}" varStatus="status">
								<c:forEach var="userOrder" items="${userOrderList}">
										<c:if test="${orderDto.order_id == userOrder.order_id}">
											<tr> 
												<c:if test="${index == 0}">
													<c:set var="index" value="${index + 1}" />
													<c:forEach var="count" items="${userOrderListGroupCount}">
														<c:if test="${count.order_id == userOrder.order_id}">
															<fmt:formatDate value="${userOrder.order_date}" var="order_date" pattern="yyyy-MM-dd"/>
															<td rowspan="${count.count}">${order_date}<br>[<a href="/user/mypage/order/detail?user_id=${param.user_id}&order_id=${userOrder.order_id}">${userOrder.order_id}</a>]</td>
														</c:if>
													</c:forEach>
												</c:if>
												<c:if test="${index != 0}">
													<td style="display:none"></td>
												</c:if>
												<td><a href="/product/detail?product_code=${userOrder.product_code}"><img src="/upload${userOrder.product_img_name}" width="80px" height="80px"></a></td>
												<td><a href="/product/detail?product_code=${userOrder.product_code}">${userOrder.product_name}</a><br>[카테고리 : ${userOrder.category_name}]</td>
												<td>${userOrder.order_de_amount}</td>
												<c:set var="orderProductTotalPrice" value="${userOrder.product_price * userOrder.order_de_amount}" />
												<td>${orderProductTotalPrice}원</td>
												<td>${userOrder.order_state}</td>
											</tr>
										</c:if>
								</c:forEach>
								<c:set var="index" value="0" />
							</c:forEach>
						</tbody>
					</table>
					<nav class="d-flex justify-content-center myOrderPagination">
						<ul class="pagination">
							<c:if test="${pageHandler.page <= 1}">
								<li class="page-item"><a class="page-link gray" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:if test="${pageHandler.page > 1}">
								<li class="page-item"><a class="page-link" href="/user/mypage/order/list?page=${pageHandler.page-1}&user_id=${param.user_id}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
								<c:if test="${a == pageHandler.page}">
									<li class="page-item active"><a class="page-link gray">${a}</a></li>
								</c:if>
								<c:if test="${a != pageHandler.page}">
									<li class="page-item"><a class="page-link" href="/user/mypage/order/list?page=${a}&user_id=${param.user_id}">${a}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${pageHandler.page >= pageHandler.maxPage}">
								<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
							</c:if>
							<c:if test="${pageHandler.page < pageHandler.maxPage}">
								<li class="page-item"><a class="page-link" href="/user/mypage/order/list?page=${pageHandler.page+1}&user_id=${param.user_id}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
							</c:if>
						</ul>
					</nav>
				</c:if>
				<c:if test="${pageHandler.listCount == 0 || empty pageHandler.listCount}">
					<div class="text-center mt-5 mb-5 empty_order">
						<h1>주문건수가 없습니다.</h1>
					</div>
				</c:if>
			</div>
		</main>
		
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>