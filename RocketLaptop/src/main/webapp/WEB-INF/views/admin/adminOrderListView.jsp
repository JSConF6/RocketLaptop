<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<div class="d-flex align-items-center">
			<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">주문목록</span>
		</div>
		<p class="mt-3">
			<span class="fs-5">주문 갯수 : ${pageHandler.listCount}개</span>
		</p>
		<c:if test="${pageHandler.listCount > 0}">
			<div class="table-responsive">
				<table class="table table-striped table-hover text-center">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>수령인</th>
							<th>주소</th>
							<th>결제일</th>
							<th>배송상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="order" items="${orderList}">
							<tr>
								<td>
									<a href="/admin/orderDetail?order_id=${order.order_id}"><c:out value="${order.order_id}" /></a>
								</td>
								<td>${order.order_name}</td>
								<c:set var="address" value="(${order.user_address1}) ${order.user_address2} ${order.user_address3}" />
								<td><c:out value="${address}" /></td>
								<td><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd"/></td>
								<td>${order.order_state}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<nav class="d-flex justify-content-center">
				<ul class="pagination">
					<c:if test="${pageHandler.page <= 1}">
						<li class="page-item"><a class="page-link gray" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:if test="${pageHandler.page > 1}">
						<li class="page-item"><a class="page-link" href="/admin/orderList?page=${pageHandler.page-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
						<c:if test="${a == pageHandler.page}">
							<li class="page-item active"><a class="page-link gray">${a}</a></li>
						</c:if>
						<c:if test="${a != pageHandler.page}">
							<li class="page-item"><a class="page-link" href="/admin/orderList?page=${a}">${a}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageHandler.page >= pageHandler.maxPage}">
						<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					<c:if test="${pageHandler.page < pageHandler.maxPage}">
						<li class="page-item"><a class="page-link" href="/admin/orderList?page=${pageHandler.page+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
				</ul>
			</nav>
		</c:if>
		<c:if test="${pageHandler.listCount == 0 || empty pageHandler.listCount}">
			<div class="text-center mt-5 mb-5">
				<h1>주문건수가 없습니다.</h1>
			</div>
		</c:if>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>