<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../layout/header.jsp"%>

<main class="my-activity-container">
	<div class="d-flex align-items-center mt-2 mb-2">
		<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="300px" height="10%"> 
		<div class="pt-5 pb-5 fw-bold fs-1">나의활동</div>
	</div>
	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
	  <li class="nav-item" role="presentation">
	    <button class="nav-link active" id="my-question-tab" data-bs-toggle="pill" data-bs-target="#myQuestion" type="button" role="tab" aria-selected="true">나의문의사항</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="my-review-tab" data-bs-toggle="pill" data-bs-target="#myReview" type="button" role="tab" aria-selected="false">나의리뷰</button>
	  </li>
	</ul>
	<div class="tab-content" id="pills-tabContent">
	  <div class="tab-pane fade show active" id="myQuestion" role="tabpanel">
	  	<div class="my-question">
		  	<div class="myQuestionListCount"></div>
		  	<table class="table my-question-table mt-3">
				<thead>
					<tr>
						<th>번호</th>
						<th>답변상태</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>답변대기</td>
						<td><span class="">제목&nbsp;&nbsp;&nbsp;<span class="text-secondary">[답변완료]</span></span></td>
						<td>작성자</td>
						<td>2022-02-02</td>
					</tr>
				</tbody>
			</table>
			<nav class="d-flex justify-content-center myQuestionPagination"></nav>
		</div>
	  </div>
	  <div class="tab-pane fade" id="myReview" role="tabpanel">
	  	<table class="table border-top border-bottom mt-3">
			<tbody>
				<tr>
					<td>
						<div class="d-flex justify-content-between">
							<div class="d-flex">
								<div>
									<span class="star1-view" data-val=1><i class="fa-solid fa-star"></i></span>
							  		<span class="star2-view" data-val=2><i class="fa-solid fa-star"></i></span>
							  		<span class="star3-view" data-val=3><i class="fa-solid fa-star"></i></span>
							  		<span class="star4-view" data-val=4><i class="fa-solid fa-star"></i></span>
							  		<span class="star5-view" data-val=5><i class="fa-solid fa-star"></i></span>
						  		</div>
						  		<div class="d-flex flex-column ms-5">
									<div><span class="text-muted">15;(1종)오드데일리점퍼 카키88(2900원)[1개]</span></div>
									<div>추천 합니다. 배송이 빠릅니다.</div>
								</div>
						  	</div>
							<div class="d-flex flex-column">
								<div><span class="text-muted">작성자 : jsconf</span></div>
								<div><span class="text-muted">등록일 : 2022-03-03</span></div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<nav class="d-flex justify-content-center reviewPagination"></nav>
	  </div>
	</div>
</main>

<%@ include file="../layout/footer.jsp"%>