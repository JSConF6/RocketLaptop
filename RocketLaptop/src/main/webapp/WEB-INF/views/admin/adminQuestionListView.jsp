<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<div class="d-flex align-items-center">
			<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">문의사항</span>
		</div>
		<p class="mt-3">
			<span class="fs-5">문의사항 갯수 : ${pageHandler.listCount}개</span>
		</p>
		<c:if test="${pageHandler.listCount > 0}">
			<table class="table table-striped table-hover text-center">
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
					<c:forEach var="question" items="${questionList}">
						<tr>
							<td><c:out value="${num}" /> <c:set var="num" value="${num - 1}" /></td>
							<td>
								<a href="/admin/questionDetail?num=${question.qna_num}">
									<c:out value="${question.qna_title}" escapeXml="true" />&nbsp;&nbsp;&nbsp;
								</a>
								<c:if test="${!empty question.comment_content}">
									<span class="text-secondary">[답변완료]</span>
								</c:if>
								<c:if test="${empty question.comment_content}">
									<span class="text-secondary">[답변대기]</span>
								</c:if>
							</td>
							<td>${question.user_id}</td>
							<td>${question.qna_reg_date}</td>
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
						<li class="page-item"><a class="page-link" href="/admin/questionList?page=${pageHandler.page-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
						<c:if test="${a == pageHandler.page}">
							<li class="page-item active"><a class="page-link gray">${a}</a></li>
						</c:if>
						<c:if test="${a != pageHandler.page}">
							<li class="page-item"><a class="page-link" href="/admin/questionList?page=${a}">${a}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageHandler.page >= pageHandler.maxPage}">
						<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					<c:if test="${pageHandler.page < pageHandler.maxPage}">
						<li class="page-item"><a class="page-link" href="/admin/questionList?page=${pageHandler.page+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
				</ul>
			</nav>
		</c:if>
		<c:if test="${pageHandler.listCount == 0 || empty pageHandler.listCount}">
			<div class="text-center mt-5 mb-5">
				<h1>문의사항이 없습니다.</h1>
			</div>
		</c:if>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>