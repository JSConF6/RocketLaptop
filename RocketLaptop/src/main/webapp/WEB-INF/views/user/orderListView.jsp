<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
							<tr>
								<c:if test="${orderDto.order_id == userOrder.order_id}"> 
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
								</c:if>
							</tr>
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