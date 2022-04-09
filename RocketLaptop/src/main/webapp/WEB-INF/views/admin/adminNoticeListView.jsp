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
		<script type="text/javascript" src="../js/admin/adminNoticeListView.js"></script>
	
	</head>
	<body>
		<%@ include file="./adminSidebar.jsp"%>
		
		<main class="mt-5 vw-50">
			<div class="container-fluid">
				<div class="d-flex align-items-center">
					<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">공지사항</span>
				</div>
				<div class="mt-3 d-flex justify-content-between align-items-center mb-3">
					<span class="fs-5">공지사항 갯수 : ${pageHandler.listCount}개</span>
					<button type="button" class="btn btn-primary text-end" data-bs-toggle="modal" data-bs-target="#adminNoticeAddModal">공지사항 쓰기</button>
				</div>
				<c:if test="${pageHandler.listCount > 0}">
					<div class="table-responsive">
						<table class="table table-striped table-hover text-center">
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
										<td><a href="/admin/noticeDetail?num=${notice.notice_num}"> <c:out value="${notice.notice_title}" escapeXml="true" />
										</a></td>
										<td>관리자</td>
										<td><fmt:formatDate value="${notice.notice_reg_date}" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<nav class="d-flex justify-content-center">
						<ul class="pagination">
							<c:if test="${pageHandler.page <= 1}">
								<li class="page-item"><a class="page-link gray" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:if test="${pageHandler.page > 1}">
								<li class="page-item"><a class="page-link" href="/admin/noticeList?page=${pageHandler.page-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach var="a" begin="${pageHandler.startPage}" end="${pageHandler.endPage}">
								<c:if test="${a == pageHandler.page}">
									<li class="page-item active"><a class="page-link gray">${a}</a></li>
								</c:if>
								<c:if test="${a != pageHandler.page}">
									<li class="page-item"><a class="page-link" href="/admin/noticeList?page=${a}">${a}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${pageHandler.page >= pageHandler.maxPage}">
								<li class="page-item"><a class="page-link gray" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
							</c:if>
							<c:if test="${pageHandler.page < pageHandler.maxPage}">
								<li class="page-item"><a class="page-link" href="/admin/noticeList?page=${pageHandler.page+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
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
		
			<div class="modal fade" id="adminNoticeAddModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">공지사항 등록</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="/admin/noticeAdd" method="POST" class="notice-form">
								<div class="mb-3">
									<label for="notice_title" class="col-form-label">공지사항 제목</label> <input type="text" class="form-control" id="notice_title" name="notice_title">
								</div>
								<div class="mb-3">
									<label for="notice_content" class="col-form-label">공지사항 내용</label>
									<textarea class="form-control" id="notice_content" rows="10" style="resize: none" name="notice_content"></textarea>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary noticeAddBtn">등록</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</main>
		
		<%@ include file="./adminFooter.jsp"%>
	</body>
</html>