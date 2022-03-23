<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<form>
			<div class="d-flex align-items-center">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">공지사항 - 상세정보</span>
			</div>
			<div class="mb-3">
				<label for="notice_num" class="form-label">공지사항 번호</label> <input type="text" class="form-control" id="notice_num" disabled value="${noticeDto.notice_num}">
			</div>
			<div class="mb-3">
				<label for="notice_title" class="form-label">공지사항 제목</label> <input type="text" class="form-control" id="notice_title" value="${noticeDto.notice_title}">
			</div>
			<div class="mb-3">
				<label for="notice_content" class="form-label">공지사항 내용</label>
				<textarea class="form-control" id="notice_content" rows="10" style="resize: none"><c:out value="${noticeDto.notice_content}" /></textarea>
			</div>
			<div class="mb-3">
				<label for="notice_reg_date" class="form-label">공지사항 쓴 날짜</label> <input type="text" class="form-control" id="notice_reg_date" disabled value="${noticeDto.notice_reg_date}">
			</div>
			<div class="d-flex justify-content-end mb-3 mt-3">
				<button class="btn btn-primary me-3 noticeModifyBtn">수정</button>
				<button class="btn btn-secondary noticeModifyCancelBtn">취소</button>
			</div>
		</form>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>