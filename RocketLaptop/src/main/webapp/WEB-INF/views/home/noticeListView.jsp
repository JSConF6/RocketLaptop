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
	
		<title>RocketLaptop - 공지사항 목록</title>
	</head>
	<body>
		<%@ include file="../layout/header.jsp"%>
		<div class="container-fluid mb-5">
			<div class="row">
				<div class="col-8 mx-auto">
					<div class="d-flex align-items-center mt-5 mb-3">
						<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="20%"> <span class="fs-1">공지사항</span>
					</div>
					<c:if test="${pageHandler.listCount > 0}">
						<table class="table text-center">
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
								<c:forEach var="notice" items="${noticeList}">
									<tr>
										<td><c:out value="${num}" /> <c:set var="num" value="${num - 1}" /></td>
										<td><a href="/notice/detail?num=${notice.notice_num}"> <c:out value="${notice.notice_title}" escapeXml="true" />
										</a></td>
										<td>관리자</td>
										<td><fmt:formatDate value="${notice.notice_reg_date}" pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<nav class="d-flex justify-content-center">
							<ul class="pagination">
								<c:if test="${pageHandler.page <= 1}">
									<li class="page-item"><a class="page-link gray" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>
								<c:if test="${pageHandler.page > 1}">
									<li class="page-item"><a class="page-link" href="/notice/list?page=${pageHandler.page-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>
								<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
									<c:if test="${a == pageHandler.page}">
										<li class="page-item active"><a class="page-link gray">${a}</a></li>
									</c:if>
									<c:if test="${a != pageHandler.page}">
										<li class="page-item"><a class="page-link" href="/notice/list?page=${a}">${a}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageHandler.page >= pageHandler.maxPage}">
									<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
								<c:if test="${pageHandler.page < pageHandler.maxPage}">
									<li class="page-item"><a class="page-link" href="/notice/list?page=${pageHandler.page+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
								</c:if>
							</ul>
						</nav>
					</c:if>
					<c:if test="${pageHandler.listCount == 0 || empty pageHandler.listCount}">
						<div class="text-center mt-5 mb-5">
							<h1>공지사항이 없습니다.</h1>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<%@ include file="../layout/footer.jsp"%>
	</body>
</html>