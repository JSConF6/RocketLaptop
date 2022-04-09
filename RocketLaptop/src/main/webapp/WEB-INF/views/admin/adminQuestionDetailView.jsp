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
		<script type="text/javascript" src="../js/admin/adminQuestionDetailView.js"></script>
	
	</head>
	<body>
		<%@ include file="./adminSidebar.jsp"%>
		
		<main class="mt-5 vw-50">
			<div class="container-fluid">
				<div class="d-flex align-items-center">
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
							<th class="text-center">문의사항 쓴 상품</th>
							<td colspan="3"><span id="question_product_code">${questionDto.product_name}</span></td>
						</tr>
						<tr>
							<th class="text-center">작성일</th>
							<fmt:formatDate var="qnaDate" value="${questionDto.qna_reg_date}" pattern="yyyy-MM-dd" />
							<td colspan="3"><span id="question_reg_date">${qnaDate}</span></td>
						</tr>
						<tr>
							<th class="text-center">작성자</th>
							<td><span id="question_user_id">${questionDto.user_id}</span></td>
						</tr>
						<tr>
							<th class="text-center">내용</th>
							<td colspan="3"><textarea class="form-control" id="question_content" rows="10" disabled style="resize: none"><c:out value="${questionDto.qna_content}" /></textarea></td>
						</tr>
					</table>
				</div>
				<c:if test="${questionDto.qna_comment_yn == 'Y'}">
					<div class="card">
						<div class="card-header">답변</div>
						<div class="card-body">
							<p class="card-text">${commentDto.comment_content}</p>
						</div>
						<fmt:formatDate var="commentDate" value="${commentDto.comment_reg_date}" pattern="yyyy-MM-dd"/>
						<div class="card-footer">답변한 날짜 ${commentDate}</div>
					</div>
				</c:if>
				<c:if test="${questionDto.qna_comment_yn == 'N'}">
					<div class="card">
						<div class="card-body text-center">
							<p class="card-text">답변대기</p>
						</div>
					</div>
				</c:if>
				<div class="d-flex justify-content-end mb-3 mt-3">
					<c:if test="${questionDto.qna_comment_yn == 'N'}">
						<button type="button" class="btn btn-primary me-3" data-bs-toggle="modal" data-bs-target="#commentAddModal">답변달기</button>
					</c:if>
					<button class="btn btn-danger me-3 questionDetailDeleteBtn">삭제</button>
					<button class="btn btn-secondary questionListBtn">목록</button>
				</div>
			</div>
			
			<div class="modal fade" id="commentAddModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">답변 등록</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="comment-form">
								<div class="mb-3">
									<label for="comment_content" class="col-form-label">답변 내용</label>
									<textarea class="form-control" id="comment_content" rows="10" style="resize: none"></textarea>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary CommentAddBtn">등록</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</main>
		
		<%@ include file="./adminFooter.jsp"%>
	</body>
</html>