<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<div class="d-flex align-items-center">
			<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">공지사항</span>
		</div>
		<div class="mt-3 d-flex justify-content-between align-items-center mb-3">
			<span class="fs-5">공지사항 갯수 : ${pageHandler.listCount}개</span>
			<button type="button" class="btn btn-primary text-end" data-bs-toggle="modal" data-bs-target="#adminNoticeAddModal">공지사항 쓰기</button>
		</div>
		<c:if test="${pageHandler.listCount > 0}">
			<div class="table-responsive">
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
						<c:forEach var="notice" items="${noticeList}">
							<tr>
								<td><c:out value="${num}" /> <c:set var="num" value="${num - 1}" /></td>
								<td><a href="/admin/noticeDetail?num=${notice.notice_num}"> <c:out value="${notice.notice_title}" escapeXml="true" />
								</a></td>
								<td>관리자</td>
								<td><fmt:formatDate value="${notice.notice_reg_date}" pattern="yyyy-MM-dd"/></td>
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
						<li class="page-item"><a class="page-link" href="/admin/noticeList?page=${pageHandler.page-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
						<c:if test="${a == pageHandler.page}">
							<li class="page-item active"><a class="page-link gray">${a}</a></li>
						</c:if>
						<c:if test="${a != pageHandler.page}">
							<li class="page-item"><a class="page-link" href="/admin/noticeList?page=${a}">${a}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageHandler.page >= pageHandler.maxPage}">
						<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					<c:if test="${pageHandler.page < pageHandler.maxPage}">
						<li class="page-item"><a class="page-link" href="/admin/noticeList?page=${pageHandler.page+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
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

	<div class="modal fade" id="adminNoticeAddModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">공지사항 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="/admin/noticeAdd" method="POST" class="notice-form">
						<div class="mb-3">
							<label for="notice_title" class="col-form-label">공지사항 제목</label> <input type="text" class="form-control" id="notice_title" name="notice_title">
						</div>
						<div class="mb-3">
							<label for="notice_content" class="col-form-label">공지사항 내용</label>
							<textarea class="form-control" id="notice_content" rows="10" style="resize: none" name="notice_content"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary noticeAddBtn">등록</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>