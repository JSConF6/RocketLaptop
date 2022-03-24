<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<div class="d-flex align-items-center">
			<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">문의사항 - 상세정보</span>
		</div>
		<div class="mb-3">
			<label for="question_num" class="form-label">문의사항 번호</label> <input type="text" class="form-control" id="question_num" disabled value="${questionDto.qna_num}">
		</div>
		<div class="mb-3">
			<label for="question_title" class="form-label">문의사항 제목</label> <input type="text" class="form-control" id="question_title" disabled value="${questionDto.qna_title}">
		</div>
		<div class="mb-3">
			<label for="question_content" class="form-label">문의사항 내용</label>
			<textarea class="form-control" id="question_content" rows="10" disabled style="resize: none"><c:out value="${questionDto.qna_content}" /></textarea>
		</div>
		<div class="mb-3">
			<fmt:formatDate var="qnaDate" value="${questionDto.qna_reg_date}" pattern="yyyy-MM-dd"/>
			<label for="question_reg_date" class="form-label">날짜</label> <input type="text" class="form-control" id="question_reg_date" disabled value="${qnaDate}" />
		</div>
		<c:if test="${!empty commentDto}">
			<div class="card">
				<div class="card-header">답변</div>
				<div class="card-body">
					<p class="card-text">${commentDto.comment_content}</p>
				</div>
				<fmt:formatDate var="commentDate" value="${commentDto.comment_reg_date}" pattern="yyyy-MM-dd"/>
				<div class="card-footer">날짜 ${commentDate}</div>
			</div>
		</c:if>
		<c:if test="${empty commentDto}">
			<div class="card">
				<div class="card-body text-center">
					<p class="card-text">답변대기</p>
				</div>
			</div>
		</c:if>
		<div class="d-flex justify-content-end mb-3 mt-3">
			<c:if test="${empty commentDto}">
				<button type="button" class="btn btn-primary me-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">답변달기</button>
			</c:if>
			<button class="btn btn-danger me-3 questionDetailDeleteBtn">삭제</button>
			<button class="btn btn-secondary questionListBtn">목록</button>
		</div>
	</div>
	
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">답변 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="comment-form">
						<div class="mb-3">
							<label for="comment_content" class="col-form-label">답변 내용</label>
							<textarea class="form-control" id="comment_content" rows="10" style="resize: none"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary CommentAddBtn">등록</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>