<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../layout/header.jsp"%>

<div class="container-fluid mb-5">
	<div class="row">
		<div class="col-8 mx-auto">
			<div class="d-flex align-items-center mt-5 mb-3">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="20%"> <span class="fs-1">공지사항</span>
			</div>
			<c:if test="${pageHandler.listCount > 0}">
				<table class="table text-center">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="num" value="${pageHandler.listCount-(pageHandler.page - 1) * pageHandler.limit}" />
						<c:forEach var="notice" items="${noticeList}">
							<tr>
								<td><c:out value="${num}" /> <c:set var="num" value="${num - 1}" /></td>
								<td><a href="/notice/detail?num=${notice.notice_num}"> <c:out value="${notice.notice_title}" escapeXml="true" />
								</a></td>
								<td>관리자</td>
								<td><fmt:formatDate value="${notice.notice_reg_date}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<nav class="d-flex justify-content-center">
					<ul class="pagination">
						<c:if test="${pageHandler.page <= 1}">
							<li class="page-item"><a class="page-link gray" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageHandler.page > 1}">
							<li class="page-item"><a class="page-link" href="/notice/list?page=${pageHandler.page-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
							<c:if test="${a == pageHandler.page}">
								<li class="page-item active"><a class="page-link gray">${a}</a></li>
							</c:if>
							<c:if test="${a != pageHandler.page}">
								<li class="page-item"><a class="page-link" href="/notice/list?page=${a}">${a}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageHandler.page >= pageHandler.maxPage}">
							<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
						<c:if test="${pageHandler.page < pageHandler.maxPage}">
							<li class="page-item"><a class="page-link" href="/notice/list?page=${pageHandler.page+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
					</ul>
				</nav>
			</c:if>
			<c:if test="${pageHandler.listCount == 0 || empty pageHandler.listCount}">
				<div class="text-center mt-5 mb-5">
					<h1>공지사항이 없습니다.</h1>
				</div>
			</c:if>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>