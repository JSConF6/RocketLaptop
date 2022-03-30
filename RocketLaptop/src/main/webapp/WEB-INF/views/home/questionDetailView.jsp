<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<div class="d-flex align-items-center mt-3 mb-3">
		<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">문의사항 - 상세정보</span>
	</div>
	<div class="mb-3">
		<label for="question_num" class="form-label">문의사항 번호</label> <input type="text" class="form-control" id="question_num" disabled value="${questionDto.qna_num}">
	</div>
	<div class="mb-3">
		<label for="question_title" class="form-label">문의사항 제목</label> <input type="text" class="form-control" id="question_title" disabled value="${questionDto.qna_title}">
	</div>
	<div class="mb-3">
		<label for="question_title" class="form-label">작성자</label> <input type="text" class="form-control" id="question_user_id" disabled value="${questionDto.user_id}">
	</div>
	<div class="mb-3">
		<label for="question_content" class="form-label">문의사항 내용</label>
		<textarea class="form-control" id="question_content" rows="10" disabled style="resize: none"><c:out value="${questionDto.qna_content}" /></textarea>
	</div>
	<div class="mb-3">
		<fmt:formatDate var="qnaDate" value="${questionDto.qna_reg_date}" pattern="yyyy-MM-dd" />
		<label for="question_reg_date" class="form-label">날짜</label> <input type="text" class="form-control" id="question_reg_date" disabled value="${qnaDate}" />
	</div>
	<div class="mb-3">
		<label for="question_readcount" class="form-label">조회수</label> <input type="text" class="form-control" id="question_readcount" disabled value="${questionDto.qna_readcount}" />
	</div>
	<c:if test="${!empty commentDto}">
		<div class="card">
			<div class="card-header">답변</div>
			<div class="card-body">
				<p class="card-text">${commentDto.comment_content}</p>
			</div>
			<fmt:formatDate var="commentDate" value="${commentDto.comment_reg_date}" pattern="yyyy-MM-dd" />
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
		<button class="btn btn-primary questionListBtn">목록</button>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>