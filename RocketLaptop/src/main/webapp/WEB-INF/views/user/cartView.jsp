<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container-fluid">
	<div class="d-flex mt-3 align-items-center justify-content-center mb-3">
		<img alt="Logo" src="../images/RocketLaptopLogo.svg" width="15%" height="20%">
		<h1>장바구니</h1>
	</div>
	<div class="container padding-bottom-3x mb-1">
		<div class="table-responsive shopping-cart">
			<table class="table">
				<thead style="border-top: 3px solid">
					<tr>
						<th>상품명</th>
						<th class="text-center">주문갯수</th>
						<th class="text-center">배송비</th>
						<th class="text-center">총가격</th>
						<th class="text-center"><a class="btn btn-sm btn-outline-danger" href="#">전체삭제</a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="product-item">
								<a class="product-thumb" href="#"><img src="../images/280.jpg" alt="Product" height="90px"></a>
								<div class="product-info">
									<h4 class="product-title">
										<a href="#">갤럭시 10+</a><span class="fs-6 mt-2 mb-2">카테고리: 삼성</span> <span class="fs-6">상품가격: 219,000원</span>
								</div>
							</div>
						</td>
						<td class="text-center">
							<div class="count-input">
								<input type="text" value="1" class="form-control text-center bg-white" disabled>
							</div>
						</td>
						<td class="text-center text-lg text-medium">2,500원</td>
						<td class="text-center text-lg text-medium">221,500원</td>
						<td class="text-center"><a class="remove-from-cart" href="#" data-toggle="tooltip" title="" data-original-title="Remove item"><i class="fa fa-trash"></i></a></td>
					</tr>
					<tr>
						<td>
							<div class="product-item">
								<a class="product-thumb" href="#"><img src="https://via.placeholder.com/220x180/5F9EA0/000000" alt="Product"></a>
								<div class="product-info">
									<h4 class="product-title">
										<a href="#">Daily Fabric Cap</a>
									</h4>
									<span><em>Size:</em> XL</span><span><em>Color:</em> Black</span>
								</div>
							</div>
						</td>
						<td class="text-center">
							<div class="count-input">
								<select class="form-control">
									<option>1</option>
									<option selected="">2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>
							</div>
						</td>
						<td class="text-center text-lg text-medium">$24.89</td>
						<td class="text-center">—</td>
						<td class="text-center"><a class="remove-from-cart" href="#" data-toggle="tooltip" title="" data-original-title="Remove item"><i class="fa fa-trash"></i></a></td>
					</tr>
					<tr>
						<td>
							<div class="product-item">
								<a class="product-thumb" href="#"><img src="https://via.placeholder.com/220x180/9932CC/000000" alt="Product"></a>
								<div class="product-info">
									<h4 class="product-title">
										<a href="#">Cole Haan Crossbody</a>
									</h4>
									<span><em>Size:</em> -</span><span><em>Color:</em> Turquoise</span>
								</div>
							</div>
						</td>
						<td class="text-center">
							<div class="count-input">
								<select class="form-control">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>
							</div>
						</td>
						<td class="text-center text-lg text-medium">$200.00</td>
						<td class="text-center">—</td>
						<td class="text-center"><a class="remove-from-cart" href="#" data-toggle="tooltip" title="" data-original-title="Remove item"><i class="fa fa-trash"></i></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="shopping-cart-footer">
			<div class="column"></div>
			<div class="column text-lg fs-3">
				전체가격: <span class="text-medium">221,500원</span>
			</div>
		</div>
		<div class="shopping-cart-footer">
			<div class="text-end">
				<a class="btn btn-primary" href="#">주문하기</a>
			</div>
		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>