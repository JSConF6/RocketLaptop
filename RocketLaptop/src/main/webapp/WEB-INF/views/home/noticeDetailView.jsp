<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<div class="d-flex align-items-center mt-3 mb-3">
		<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">공지사항 - 상세정보</span>
	</div>
	<div class="mb-3">
		<label for="notice_num" class="form-label">공지사항 번호</label> <input type="text" class="form-control" disabled value="${noticeDto.notice_num}">
	</div>
	<div class="mb-3">
		<label for="notice_title" class="form-label">공지사항 제목</label> <input type="text" class="form-control" disabled value="${noticeDto.notice_title}">
	</div>
	<div class="mb-3">
		<label for="notice_title" class="form-label">작성자</label> <input type="text" class="form-control" disabled value="관리자">
	</div>
	<div class="mb-3">
		<label for="notice_content" class="form-label">공지사항 내용</label>
		<textarea class="form-control" id="notice_content" rows="10" disabled style="resize: none"><c:out value="${noticeDto.notice_content}" /></textarea>
	</div>
	<div class="mb-3">
		<fmt:formatDate value="${noticeDto.notice_reg_date}" var="noticeDate" pattern="yyyy-MM-dd" />
		<label for="notice_reg_date" class="form-label">날짜</label> <input type="text" class="form-control" disabled value="${noticeDate}">
	</div>
	<div class="d-flex justify-content-end mb-3 mt-3">
		<button class="btn btn-primary noticeListBtn">목록</button>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>