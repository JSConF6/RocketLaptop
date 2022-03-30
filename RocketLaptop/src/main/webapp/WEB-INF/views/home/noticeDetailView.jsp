<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<div class="d-flex align-items-center mt-3 mb-3">
		<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">공지사항 - 상세정보</span>
	</div>
	<div class="table-responsive">
		<table class="table table-bordered">
			<tr>
				<th class="text-center">글번호</th>
				<td><span>${noticeDto.notice_num}</span></td>
			</tr>
			<tr>
				<th class="text-center">제목</th>
				<td><span>${noticeDto.notice_title}</span></td>
			</tr>
			<tr>
				<th class="text-center">작성일</th>
				<fmt:formatDate var="noticeDate" value="${noticeDto.notice_reg_date}" pattern="yyyy-MM-dd" />
				<td><span>${noticeDate}</span></td>
			</tr>
			<tr>
				<th class="text-center">작성자</th>
				<td><span>관리자</span></td>
			</tr>
			<tr>
				<th class="text-center">내용</th>
				<td><textarea class="form-control" id="notice_content" rows="10" disabled style="resize: none"><c:out value="${noticeDto.notice_content}" /></textarea></td>
			</tr>
		</table>
	</div>
	<div class="d-flex justify-content-end mb-3 mt-3">
		<button class="btn btn-primary noticeListBtn">목록</button>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>