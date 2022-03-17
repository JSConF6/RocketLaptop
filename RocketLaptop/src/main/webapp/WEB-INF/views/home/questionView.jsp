<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container-fluid mb-5">
	<div class="row">
		<div class="col-8 mx-auto">
			<div class="d-flex align-items-center mt-3 mb-3">
				<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="20%"> <span class="fs-1">문의사항</span>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>긴급 공지사항 입니다.</td>
						<td>자바</td>
						<td>2022-03-06</td>
						<td>3</td>
					</tr>
					<tr>
						<td>2</td>
						<td>긴급 공지사항 입니다.</td>
						<td>자바</td>
						<td>2022-03-06</td>
						<td>3</td>
					</tr>
					<tr>
						<td>3</td>
						<td>긴급 공지사항 입니다.</td>
						<td>자바</td>
						<td>2022-03-06</td>
						<td>3</td>
					</tr>
					<tr>
						<td>4</td>
						<td>긴급 공지사항 입니다.</td>
						<td>자바</td>
						<td>2022-03-06</td>
						<td>3</td>
					</tr>
					<tr>
						<td>5</td>
						<td>긴급 공지사항 입니다.</td>
						<td>자바</td>
						<td>2022-03-06</td>
						<td>3</td>
					</tr>
					<tr>
						<td>6</td>
						<td>긴급 공지사항 입니다.</td>
						<td>자바</td>
						<td>2022-03-06</td>
						<td>3</td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex justify-content-end">
				<button type="button" class="btn btn-dark">문의하기</button>
			</div>
			<nav aria-label="Page navigation example" class="p-0">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>