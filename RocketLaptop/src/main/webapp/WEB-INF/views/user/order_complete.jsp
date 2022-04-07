<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../layout/header.jsp"%>

<main>
	<div class="order-complete-container">
		<div class="d-flex mt-5 align-items-center justify-content-center mb-5">
			<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="200px" height="20%">
			<h1>주문완료</h1>
		</div>
		<div class="d-flex justify-content-center align-items-center fs-2">
			<div class="text-success">
				<i class="fa-solid fa-circle-check fa-5x"></i>
			</div>
			<div class="ms-4">
				<b>고객님의 주문이 완료되었습니다.</b>
			</div>
		</div>
		<div class="mt-5">
			<table class="table border-top text-center">
				<tr>
					<th class="p-4 fs-5">총 주문금액</th>
					<th class="p-4 fs-5">결제금액</th>
				</tr>
				<tr>
					<fmt:formatNumber var="totalPrice" value="${orderDto.order_totalprice}" pattern="###,###,###" />
					<td class="p-4 fs-4 fw-bold">${totalPrice}원</td>
					<td class="p-4 fs-4 fw-bold">${totalPrice}원</td>
				</tr>
			</table>
		</div>
		<div class="mt-5 delivery_info">
			<div class="mb-2">배송정보</div>
			<table class="table border-top">
				<tr>
					<th class="p-2 border-end">받으시는분</th>
					<td class="p-2">${orderDto.order_name}</td>
				</tr>
				<tr>
					<th class="p-2 border-end">우편번호</th>
					<td class="p-2">${orderDto.user_address1}</td>
				</tr>
				<tr>
					<th class="p-2 border-end">주소</th>
					<td class="p-2">${orderDto.user_address2} ${orderDto.user_address3}</td>
				</tr>
				<tr>
					<th class="p-2 border-end">전화번호</th>
					<c:set var="phone" value="${orderDto.order_phone}"/>
					<c:set var="orderPhone" value="${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, 11)}" />
					<td class="p-2">${orderPhone}</td>
				</tr>
			</table>
		</div>
		<div class="text-end mt-4">
			<button class="bottomBtn bg-black text-white border me-4 leftBtn">쇼핑 계속하기</button>
			<button class="bottomBtn bg-white border rightBtn">주문 확인하기</button>
		</div>
	</div>
</main>

<%@ include file="../layout/footer.jsp"%>