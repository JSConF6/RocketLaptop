<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	
	</head>
	<body>
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
	</body>
</html>