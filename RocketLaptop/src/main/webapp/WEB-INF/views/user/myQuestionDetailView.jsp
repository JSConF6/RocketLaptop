<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<div class="d-flex align-items-center mt-3 mb-3">
		<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">내가 작성한 문의사항 - 상세정보</span>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered">
			<tr>
				<th class="text-center">글번호</th>
				<td colspan="3"><span id="question_num">${questionDto.qna_num}</span></td>
			</tr>
			<tr>
				<th class="text-center">제목</th>
				<td colspan="3"><span id="question_title">${questionDto.qna_title}</span></td>
			</tr>
			<tr>
				<th class="text-center">작성일</th>
				<fmt:formatDate var="qnaDate" value="${questionDto.qna_reg_date}" pattern="yyyy-MM-dd" />
				<td colspan="3"><span id="question_reg_date">${qnaDate}</span></td>
			</tr>
			<tr>
				<th class="text-center">작성자</th>
				<td><span id="question_user_id">${questionDto.user_id}</span></td>
				<th class="text-center">조회수</th>
				<td><span id="question_readcount">${questionDto.qna_readcount}</span></td>
			</tr>
			<tr>
				<th class="text-center">내용</th>
				<td colspan="3"><textarea class="form-control" id="question_content" rows="10" disabled style="resize: none"><c:out value="${questionDto.qna_content}" /></textarea></td>
			</tr>
		</table>
	</div>
	<c:if test="${!empty commentDto}">
		<div class="card">
			<div class="card-header">답변</div>
			<div class="card-body">
				<p class="card-text">${commentDto.comment_content}</p>
			</div>
			<fmt:formatDate var="commentDate" value="${commentDto.comment_reg_date}" pattern="yyyy-MM-dd" />
			<div class="card-footer">답변한 날짜 ${commentDate}</div>
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
		<button class="btn btn-danger me-3 myQuestionDetailDeleteBtn">삭제</button>
		<button class="btn btn-primary myQuestionListBtn">목록</button>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>