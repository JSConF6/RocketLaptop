<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
															<span>답변완료</span>
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