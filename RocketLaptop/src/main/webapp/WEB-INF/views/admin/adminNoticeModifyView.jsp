<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container-fluid">
		<form>
			<div class="d-flex align-items-center">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">공지사항 - 상세정보</span>
			</div>
			<div class="table-responsive">
				<table class="table table-bordered">
					<tr>
						<th class="text-center">글번호</th>
						<td><span id="notice_num">${noticeDto.notice_num}</span></td>
					</tr>
					<tr class="align-middle">
						<th class="text-center">제목</th>
						<td><input type="text" id="notice_title" class="form-control w-100" value="${noticeDto.notice_title}"></td>
					</tr>
					<tr>
						<th class="text-center">작성일</th>
						<fmt:formatDate var="noticeDate" value="${noticeDto.notice_reg_date}" pattern="yyyy-MM-dd" />
						<td><span id="notice_reg_date">${noticeDate}</span></td>
					</tr>
					<tr>
						<th class="text-center">작성자</th>
						<td><span>관리자</span></td>
					</tr>
					<tr>
						<th class="text-center">내용</th>
						<td><textarea class="form-control" id="notice_content" rows="10" style="resize: none"><c:out value="${noticeDto.notice_content}" /></textarea></td>
					</tr>
				</table>
			</div>
			<div class="d-flex justify-content-end mb-3 mt-3">
				<button class="btn btn-primary me-3 noticeModifyBtn">수정</button>
				<button class="btn btn-secondary noticeModifyCancelBtn">취소</button>
			</div>
		</form>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>