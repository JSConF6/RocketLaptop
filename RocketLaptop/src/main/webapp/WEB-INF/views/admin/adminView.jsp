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
		
		<!-- Style -->
		<link rel="stylesheet" href="../css/admin/adminView.css">
		
		<!-- JS -->
		<script type="text/javascript" src="../js/admin/adminView.js"></script>
	
	</head>
	<body>
		<%@ include file="./adminSidebar.jsp"%>
		
		<main class="mt-5 vw-50">
			<section>
				<div class="container-fluid">
					<div class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
						<div class="col">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<i class="fas fa-shopping-cart fa-3x text-warning"></i>
										<div class="text-end text-secondary orderListCount">
											<h5>주문갯수</h5>
											<h3>${orderListCount}개</h3>
										</div>
									</div>
								</div>
								<div class="card-footer text-secondary">
									<i class="fas fa-sync me-1 update_icon" id="order"></i> <span>Updated Now</span>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<i class="fa-solid fa-boxes-stacked fa-3x text-success"></i>
										<div class="text-end text-secondary productListCount">
											<h5>상품갯수</h5>
											<h3>${productListCount}개</h3>
										</div>
									</div>
								</div>
								<div class="card-footer text-secondary">
									<i class="fas fa-sync me-1 update_icon" id="product"></i> <span>Updated Now</span>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<i class="fa-solid fa-clipboard fa-3x text-secondary"></i>
										<div class="text-end text-secondary noticeListCount">
											<h5>공지사항갯수</h5>
											<h3>${noticeListCount}개</h3>
										</div>
									</div>
								</div>
								<div class="card-footer text-secondary">
									<i class="fas fa-sync me-1 update_icon" id="notice"></i> <span>Updated Now</span>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<i class="fas fa-users fa-3x text-info"></i>
										<div class="text-end text-secondary userListCount">
											<h5>유저수</h5>
											<h3>${userListCount}명</h3>
										</div>
									</div>
								</div>
								<div class="card-footer text-secondary">
									<i class="fas fa-sync me-1 update_icon" id="user"></i> <span>Updated Now</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section>
				<div class="container-fluid">
					<div class="row">
						<div class="col">
							<div class="row">
								<div class="col-12">
									<div class="d-flex justify-content-between align-items-center">
										<h3 class="text-muted mb-3 mt-3">공지사항</h3>
										<a href="/admin/noticeList" class="text-secondary"><i class="fa-solid fa-angle-right fa-2x"></i> </a>
									</div>
									<c:if test="${noticePageHandler.listCount > 0}">
										<div class="table-responsive">
											<table class="table bg-light text-center">
												<thead>
													<tr class="text-muted">
														<th>번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>날짜</th>
													</tr>
												</thead>
												<tbody>
													<c:set var="num" value="${noticePageHandler.listCount-(noticePageHandler.page - 1) * noticePageHandler.limit}" />
													<c:forEach var="notice" items="${noticeList}">
														<tr>
															<td><c:out value="${num}" /> <c:set var="num" value="${num - 1}" /></td>
															<td><a href="/admin/noticeDetail?num=${notice.notice_num}"> <c:out value="${notice.notice_title}" escapeXml="true" />
															</a></td>
															<td>관리자</td>
															<td><fmt:formatDate value="${notice.notice_reg_date}" pattern="yyyy-MM-dd" /></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</c:if>
									<c:if test="${noticePageHandler.listCount == 0 || empty noticePageHandler.listCount}">
										<div class="text-center mt-5 mb-5">
											<h1>공지사항이 없습니다.</h1>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section>
				<div class="container-fluid">
					<div class="row mb-5">
						<div class="col">
							<div class="row">
								<div class="col-12">
									<div class="d-flex justify-content-between align-items-center">
										<h3 class="text-muted mb-3 mt-3">문의사항</h3>
										<a href="/admin/questionList" class="text-secondary"><i class="fa-solid fa-angle-right fa-2x"></i> </a>
									</div>
									<c:if test="${questionPageHandler.listCount > 0}">
										<div class="table-responsive">
											<table class="table bg-light text-center">
												<thead class="text-muted">
													<tr>
														<th>번호</th>
														<th>답변상태</th>
														<th>제목</th>
														<th>작성자</th>
														<th>날짜</th>
													</tr>
												</thead>
												<tbody>
													<c:set var="num" value="${questionPageHandler.listCount-(questionPageHandler.page - 1) * questionPageHandler.limit}" />
													<c:forEach var="question" items="${questionList}">
														<tr>
															<td><c:out value="${num}" /> <c:set var="num" value="${num - 1}" /></td>
															<td>
																<c:if test="${question.qna_comment_yn == 'N'}">
																	<span>답변대기</span>
																</c:if>
																<c:if test="${question.qna_comment_yn == 'Y'}">
																	<span class="text-primary">답변완료</span>
																</c:if>
															</td>
															<td>
																<a href="/admin/questionDetail?num=${question.qna_num}"> 
																	<c:out value="${question.qna_title}" escapeXml="true" />&nbsp;&nbsp;&nbsp;
																</a>
															</td>
															<td>${question.user_id}</td>
															<td><fmt:formatDate value="${question.qna_reg_date}" pattern="yyyy-MM-dd" /></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</c:if>
									<c:if test="${questionPageHandler.listCount == 0 || empty questionPageHandler.listCount}">
										<div class="text-center mt-5 mb-5">
											<h1>문의사항이 없습니다.</h1>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
		
		<%@ include file="./adminFooter.jsp"%>
	</body>
</html>