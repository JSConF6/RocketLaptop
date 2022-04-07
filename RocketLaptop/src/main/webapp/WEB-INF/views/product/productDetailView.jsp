<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../layout/header.jsp"%>

<div class="container-fluid mt-5 mb-5">
	<div class="row">
		<div class="col-md-5">
			<div id="carouselExampleDark" class="carousel carousel-dark slide mx-auto w-75" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<img src="/upload${fileList[1].product_img_name}" class="d-block w-100" alt="..." />
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="/upload${fileList[2].product_img_name}" class="d-block w-100" alt="..." />
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
					<div class="carousel-item">
						<img src="/upload${fileList[3].product_img_name}" class="d-block w-100" alt="..." />
						<div class="carousel-caption d-none d-md-block"></div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div class="col-md-7">
			<div class="card shadow-sm h-100">
				<div class="card-body mt-5 mb-5">
					<input type="hidden" value="${productDetail.product_price}" id="price" />
					<input type="hidden" value="${productDetail.product_code}" id="product_code" />
					<h5 class="card-title fs-3 text-start">${productDetail.product_name}</h5>
					<fmt:formatNumber var="productDetailPrice" value="${productDetail.product_price}" pattern="###,###,###" />
					<h5 class="card-title pt-3 border-top fs-3 text-start productDetailPrice">${productDetailPrice}원</h5>
					<p class="card-text pt-3 border-top text-start">
						<span class="badge bg-dark me-1 fs-3">노트북</span><span class="badge bg-dark me-1 fs-3">${productDetail.category_name}</span>
					</p>
					<p class="card-text pb-3 fs-3 text-start border-top pt-3 mb-0">무료배송</p>
					<p class="card-text pb-3 fs-3 text-start border-top pt-3 mb-0">5일 이내 출고 (주말, 공휴일 제외)</p>
					<div class="card-text border-top pt-3 pb-3">
						<div class="row align-items-center">
							<div class="col-auto">
								<label class="col-form-label fs-3">구매수량</label>
							</div>
							<div class="col-auto">
								<div class="input-group">
									<span class="input-group-text minus" style="cursor: pointer">-</span>
									<input type="text" class="form-control bg-white text-center productCount" style="width: 45px" disabled value="1"/>
									<span class="input-group-text plus" style="cursor: pointer">+</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row pt-3 pb-3 border-top">
						<p class="d-flex justify-content-between fs-3">
							총 상품 금액<span class="productTotalPrice">${productDetailPrice}원</span>
						</p>
					</div>
					<div class="d-flex justify-content-between align-items-center">
						<div class="col-6 d-grid p-1">
							<button type="button" class="btn btn-lg btn-dark btn-outline-secondary text-white cartBtn">장바구니 담기</button>
						</div>
						<div class="col-6 d-grid p-1">
							<form action="/user/order/orderView" method="POST" id="productDetailOrderAdd"></form>
							<button type="button" class="btn btn-lg btn-primary text-white productDetailOrderBtn">주문하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12 p-0 mt-5 productDetailsNav">
			<ul class="nav nav-tabs nav-pills text-center justify-content-evenly bg-secondary align-items-center" id="myTab" role="tablist">
			  <li class="nav-item w-25" role="presentation">
			    <a class="nav-link text-white rounded-1" id="details_tab" data-bs-toggle="tab" data-bs-target="#productDetails" type="button" role="tab" aria-selected="true">상세설명</a>
			  </li>
			  <li class="nav-item w-25" role="presentation">
			    <a class="nav-link text-white rounded-1" id="review_tab" data-bs-toggle="tab" data-bs-target="#productReview" type="button" role="tab" aria-selected="false">상품리뷰 <span class="fs-6 reviewListCount">${reviewListCount}</span></a>
			  </li>
			  <li class="nav-item w-25" role="presentation">
			    <a class="nav-link text-white rounded-1" id="qna_tab" data-bs-toggle="tab" data-bs-target="#productQnA" type="button" role="tab" aria-selected="false">상품문의 <span class="fs-6 qnaListCount">${questionListCount}</span></a>
			  </li>
			</ul>
			<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="productDetails" role="tabpanel">
			  	<div class="col-12 d-flex justify-content-center">
					<img class="img-fluid" src="/upload${fileList[4].product_img_name}" />
				</div>
			  </div>
			  <div class="tab-pane fade" id="productReview" role="tabpanel">
			  	<div class="col-12 d-flex justify-content-center">
			  		<div class="product-review mt-5">
			  			<h1>상품리뷰</h1>
						<table class="table review-table border-top border-bottom mt-3">
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
			  </div>
			  <div class="tab-pane fade" id="productQnA" role="tabpanel">
			  	<div class="col-12 d-flex justify-content-center">
			  		<div class="product-qna mt-5">
			  			<h1>상품문의</h1>
						<table class="table qna-table mt-3">
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
								<tr class="answerBox">
									<td colspan="5">
										<div class="question">question</div>
										<div class="answer">answer</div>
										<div class="regInfo">
											<span>답변</span>
											<span>등록일 : 2022-03-03</span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<c:if test="${!empty user_id}">
							<div class="mt-3 text-end qnaAddBox">
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#qna_box">문의사항 쓰기</button>
							</div>
						</c:if>
						<nav class="d-flex justify-content-center qnaPagination"></nav>
					</div>
			  	</div>
			  </div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="qna_box" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">상품문의</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<form>
          <div class="mb-3">
            <label for="qnaProductName" class="col-form-label">상품명</label>
            <input type="text" class="form-control" id="qnaProductName" value="${productDetail.product_name}" disabled>
          </div>
          <div class="mb-3">
            <label for="qnaUserName" class="col-form-label">이름</label>
            <input type="text" class="form-control" id="qnaUserName" value="${user_id}" disabled>
          </div>
          <div class="mb-3">
            <label for="qnaTitle" class="col-form-label">제목</label>
            <input type="text" class="form-control" id="qnaTitle">
          </div>
          <div class="mb-3">
            <label for="qnaContent" class="col-form-label">내용</label>
            <textarea class="form-control" id="qnaContent"></textarea>
          </div>
          <div class="form-check">
			  <input class="form-check-input" type="checkbox" id="qnaSecretCheckBox">
			  <label class="form-check-label" for="secretCheckBox">
			    비밀글
			  </label>
		  </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary productQnaAddBtn">확인</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="../layout/footer.jsp"%>