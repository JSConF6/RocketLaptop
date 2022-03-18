<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./adminSidebar.jsp"%>

<main class="mt-5 vw-50">
	<div class="container">
		<div class="d-flex align-items-center">
			<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="20%" height="30%"> <span class="fs-1">공지사항</span>
		</div>
		<p class="mt-3">
			<span class="fs-5">공지사항 갯수 : 10개</span>
		</p>
		<table class="table table-striped table-hover text-center">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>공지사항</td>
					<td>관리자</td>
					<td>2022-01-01</td>
					<td><button type="button" class="btn btn-danger">삭제</button></td>
				</tr>
				<tr>
					<td>2</td>
					<td>공지사항</td>
					<td>관리자</td>
					<td>2022-01-01</td>
					<td><button type="button" class="btn btn-danger">삭제</button></td>
				</tr>
				<tr>
					<td>3</td>
					<td>공지사항</td>
					<td>관리자</td>
					<td>2022-01-01</td>
					<td><button type="button" class="btn btn-danger">삭제</button></td>
				</tr>
				<tr>
					<td>4</td>
					<td>공지사항</td>
					<td>관리자</td>
					<td>2022-01-01</td>
					<td><button type="button" class="btn btn-danger">삭제</button></td>
				</tr>
				<tr>
					<td>5</td>
					<td>공지사항</td>
					<td>관리자</td>
					<td>2022-01-01</td>
					<td><button type="button" class="btn btn-danger">삭제</button></td>
				</tr>
				<tr>
					<td>6</td>
					<td>공지사항</td>
					<td>관리자</td>
					<td>2022-01-01</td>
					<td><button type="button" class="btn btn-danger">삭제</button></td>
				</tr>
				<tr>
					<td>7</td>
					<td>공지사항</td>
					<td>관리자</td>
					<td>2022-01-01</td>
					<td><button type="button" class="btn btn-danger">삭제</button></td>
				</tr>
				<tr>
					<td>8</td>
					<td>공지사항</td>
					<td>관리자</td>
					<td>2022-01-01</td>
					<td><button type="button" class="btn btn-danger">삭제</button></td>
				</tr>
				<tr>
					<td>9</td>
					<td>공지사항</td>
					<td>관리자</td>
					<td>2022-01-01</td>
					<td><button type="button" class="btn btn-danger">삭제</button></td>
				</tr>
				<tr>
					<td>10</td>
					<td>공지사항</td>
					<td>관리자</td>
					<td>2022-01-01</td>
					<td><button type="button" class="btn btn-danger">삭제</button></td>
				</tr>
			</tbody>
		</table>
		<div class="d-flex justify-content-end">
			<button type="button" class="btn btn-primary">공지사항 쓰기</button>
		</div>
		<nav class="d-flex justify-content-center">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</main>

<%@ include file="./adminFooter.jsp"%>