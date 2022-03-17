<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container-fluid">
	<div class="d-flex mt-3 align-items-center justify-content-center">
		<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="15%" height="20%">
		<h1>장바구니</h1>
	</div>
	<div class="row">
		<div class="col-12 product-cartlist mt-5 d-flex justify-content-center">
			<div class="col-xs-10 h-100 w-75">
				<table class="table table-striped border text-center">
					<tr>
						<th><input type="checkbox" /></th>
						<th>상품이미지</th>
						<th>상품이름</th>
						<th>상품가격</th>
						<th>주문개수</th>
						<th>배송비</th>
						<th>삭제</th>
					</tr>
					<tr class="align-middle">
						<td>
							<input type="checkbox" />
						</td>
						<td style="width: 100px">
							<img src="../images/280.jpg" width="80px" height="80px" />
						</td>
						<td>갤럭시 10+</td>
						<td>1,500,000원</td>
						<td>3개</td>
						<td>2,500원</td>
						<td>
							<button type="button" class="btn btn-danger">삭제</button>
						</td>
					</tr>
					<tr class="align-middle">
						<td>
							<input type="checkbox" />
						</td>
						<td style="width: 100px">
							<img src="../images/280.jpg" width="80px" height="80px" />
						</td>
						<td>갤럭시 10+</td>
						<td>1,500,000원</td>
						<td>3개</td>
						<td>2,500원</td>
						<td>
							<button type="button" class="btn btn-danger">삭제</button>
						</td>
					</tr>
					<tr class="align-middle">
						<td>
							<input type="checkbox" />
						</td>
						<td style="width: 100px">
							<img src="../images/280.jpg" width="80px" height="80px" />
						</td>
						<td>갤럭시 10+</td>
						<td>1,500,000원</td>
						<td>3개</td>
						<td>2,500원</td>
						<td>
							<button type="button" class="btn btn-danger">삭제</button>
						</td>
					</tr>
					<tr class="align-middle">
						<td>
							<input type="checkbox" />
						</td>
						<td style="width: 100px">
							<img src="../images/280.jpg" width="80px" height="80px" />
						</td>
						<td>갤럭시 10+</td>
						<td>1,500,000원</td>
						<td>3개</td>
						<td>2,500원</td>
						<td>
							<button type="button" class="btn btn-danger">삭제</button>
						</td>
					</tr>
				</table>
				<td>
					<div class="d-flex">
						<button type="button" class="btn btn-secondary justify-content-start">선택삭제</button>
					</div>
					<div class="d-flex justify-content-end">
						<h1>총 금액 : 1,500,000원</h1>
					</div>
				</td>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>