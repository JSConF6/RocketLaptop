<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="icon" href="/images/favicon.ico">
	
		<!-- 제이쿼리 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer" type=""></script>
		
		<!-- 구글 폰트 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
		
		<!-- 부트스트랩 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
		<!-- Font Awesome -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		
		<!-- sweetalert2 -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.5/dist/sweetalert2.min.css">
	
		<title>RocketLaptop - 문의사항 상세보기</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		
		<div class="container">
			<div class="d-flex align-items-center mt-3 mb-3">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">문의사항 - 상세정보</span>
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
				<button class="btn btn-primary questionListBtn">목록</button>
			</div>
		</div>
		
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>	