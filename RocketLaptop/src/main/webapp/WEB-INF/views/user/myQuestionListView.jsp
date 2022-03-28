<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../layout/header.jsp"%>

<div class="container-fluid mb-5">
	<div class="row">
		<div class="col-8 mx-auto myQna-col">
			<div class="d-flex align-items-center mt-5 mb-3">
				<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="20%" height="20%"> <span class="fs-1">내가 작성한 문의사항</span>
			</div>
			<div class="d-flex justify-content-between">
				<span class="fs-5 myQuestionListCount">문의사항 갯수 : ${pageHandler.listCount}개</span>
				<select id="myComment_state">
					<option value="0" selected>전체</option>
					<option value="1">답변대기</option>
					<option value="2">답변완료</option>
				</select>
			</div>
			<c:if test="${pageHandler.listCount > 0}">
				<table class="table table-striped table-hover text-center myQnaTable">
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
								<td><a href="/user/mypage/question/detail?user_id=${param.user_id}&num=${question.qna_num}"> <c:out value="${question.qna_title}" escapeXml="true" />&nbsp;&nbsp;&nbsp;
								</a> <c:if test="${!empty question.comment_content}">
										<span class="text-secondary">[답변완료]</span>
									</c:if> <c:if test="${empty question.comment_content}">
										<span class="text-secondary">[답변대기]</span>
									</c:if></td>
								<td>${question.user_id}</td>
								<td><fmt:formatDate value="${question.qna_reg_date}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="text-end myQuestionAddBtnDiv">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myQuestionAddModal">문의사항 쓰기</button>
				</div>
				<nav class="d-flex justify-content-center myPagination-nav">
					<ul class="pagination">
						<c:if test="${pageHandler.page <= 1}">
							<li class="page-item"><a class="page-link gray" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${pageHandler.page > 1}">
							<li class="page-item"><a class="page-link" href="/user/mypage/question/list?user_id=${param.user_id}&page=${pageHandler.page-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
							<c:if test="${a == pageHandler.page}">
								<li class="page-item active"><a class="page-link gray">${a}</a></li>
							</c:if>
							<c:if test="${a != pageHandler.page}">
								<li class="page-item"><a class="page-link" href="/user/mypage/question/list?user_id=${param.user_id}&page=${a}">${a}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageHandler.page >= pageHandler.maxPage}">
							<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
						<c:if test="${pageHandler.page < pageHandler.maxPage}">
							<li class="page-item"><a class="page-link" href="/user/mypage/question/list?user_id=${param.user_id}&page=${pageHandler.page+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</c:if>
					</ul>
				</nav>
			</c:if>
			<c:if test="${pageHandler.listCount == 0 || empty pageHandler.listCount}">
				<div class="text-center mt-5 mb-5 myQnaNo">
					<h1>문의사항이 없습니다.</h1>
				</div>
			</c:if>
		</div>
	</div>
</div>

<div class="modal fade" id="myQuestionAddModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">문의사항 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mb-3">
					<label for="question_title" class="col-form-label">문의사항 제목</label> <input type="text" class="form-control" id="question_title" name="question_title">
				</div>
				<div class="mb-3">
					<label for="question_content" class="col-form-label">문의사항 내용</label>
					<textarea class="form-control" id="question_content" rows="10" style="resize: none" name="question_content"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary myQuestionAddBtn">등록</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>