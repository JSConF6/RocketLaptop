<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<div class="d-flex align-items-center">
			<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">유저목록</span>
		</div>
		<p class="mt-3">
			<span class="fs-5">유저수 : ${pageHandler.listCount}명</span>
		</p>
		<c:if test="${pageHandler.listCount > 0}">
			<div class="table-responsive">
				<table class="table table-striped table-hover text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>아이디</th>
							<th>이메일</th>
							<th>권한</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${userList}">
							<tr>
								<td>${user.user_name}</td>
								<td>
									<a href="/admin/userDetail?user_id=${user.user_id}"><c:out value="${user.user_id}" /></a>
								</td>
								<td>${user.user_email}</td>
								<c:if test="${user.user_role == 'ROLE_USER'}">
									<td>유저</td>
								</c:if>
								<td><fmt:formatDate value="${user.user_reg_date}" pattern="yyyy-MM-dd"/></td>
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
						<li class="page-item"><a class="page-link" href="/admin/userList?page=${pageHandler.page-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
						<c:if test="${a == pageHandler.page}">
							<li class="page-item active"><a class="page-link gray">${a}</a></li>
						</c:if>
						<c:if test="${a != pageHandler.page}">
							<li class="page-item"><a class="page-link" href="/admin/userList?page=${a}">${a}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageHandler.page >= pageHandler.maxPage}">
						<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					<c:if test="${pageHandler.page < pageHandler.maxPage}">
						<li class="page-item"><a class="page-link" href="/admin/userList?page=${pageHandler.page+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
				</ul>
			</nav>
		</c:if>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>