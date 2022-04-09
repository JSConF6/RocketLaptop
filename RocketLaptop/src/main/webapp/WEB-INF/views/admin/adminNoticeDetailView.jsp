<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RocketLaptop - 관리자페이지</title>
		
		<!-- 제이쿼리 -->
		<script src="../js/jquery-3.6.0.min.js"></script>
		
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

		<!-- JS -->
		<script type="text/javascript" src="../js/admin/adminNoticeDetailView.js"></script>
	
	</head>
	<body>
		<%@ include file="./adminSidebar.jsp"%>
		
		<main class="mt-5 vw-50">
			<div class="container-fluid">
				<div class="d-flex align-items-center">
					<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">공지사항 - 상세정보</span>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered">
						<tr>
							<th class="text-center">글번호</th>
							<td><span id="notice_num">${noticeDto.notice_num}</span></td>
						</tr>
						<tr>
							<th class="text-center">제목</th>
							<td><span id="notice_title">${noticeDto.notice_title}</span></td>
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
							<td><textarea class="form-control" id="notice_content" rows="10" disabled style="resize: none"><c:out value="${noticeDto.notice_content}" /></textarea></td>
						</tr>
					</table>
				</div>
				<div class="d-flex justify-content-end mb-3 mt-3">
					<a class="btn btn-secondary me-3" href="/admin/noticeModifyView?num=${noticeDto.notice_num}">수정</a>
					<button class="btn btn-danger me-3 noticeDetailDeleteBtn">삭제</button>
					<button class="btn btn-primary noticeListBtn">목록</button>
				</div>
			</div>
		</main>
		
		<%@ include file="./adminFooter.jsp"%>
	</body>
</html>