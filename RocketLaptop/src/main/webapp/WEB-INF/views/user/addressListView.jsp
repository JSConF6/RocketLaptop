<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../layout/header.jsp"%>

<main class="address-container">
	<div class="d-flex align-items-center mt-2 mb-2">
		<img alt="Logo" src="/images/RocketLaptopLogo.svg" width="300px" height="10%">
		<div class="pt-5 pb-5 fw-bold fs-1">배송지목록</div>
	</div>
	<p class="fw-bold">
		<span>배송지는 최대 5개 등록 가능합니다.</span>
	</p>
	<c:if test="${listCount > 0}">
		<table class="table table-striped table-hover text-center align-middle">
			<thead>
				<tr>
					<th>배송지명</th>
					<th>받는사람</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="address" items="${addressList}">
					<tr>
						<td>${address.address_name}</td>
						<td>${address.address_recipient}</td>
						<c:set var="phone" value="${address.address_phone}"/>
						<c:set var="address_phone" value="${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, 11)}" />
						<td>${address_phone}</td>
						<c:set var="user_address" value="(${address.address_zipcode}) ${address.address_city} ${address.address_street}" />
						<td>${user_address}</td>
						<td><button class="btn btn-primary addressModifyModalBtn" data-bs-toggle="modal" data-bs-target="#addressModifyModal" data-num="${address.address_num}">수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${listCount != 5}">
			<div class="text-end">
				<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addressAddModal">배송지 등록</button>
			</div>
		</c:if>
	</c:if>
	<c:if test="${listCount == 0}">
		<div class="text-center mt-5 mb-5">
			<h1>등록된 배송지가 없습니다.</h1>
		</div>
		<c:if test="${listCount != 5}">
			<div class="text-end">
				<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addressAddModal">배송지 등록</button>
			</div>
		</c:if>
	</c:if>
</main>

<div class="modal fade" id="addressAddModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">배송지등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">배송지명:</label>
            <input type="text" class="form-control" id="address_name" />
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">받는사람:</label>
            <input type="text" class="form-control" id="address_recipient" />
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">전화번호:</label>
            <input type="text" class="form-control" id="address_phone" />
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">우편번호:</label>
            <div class="input-group">
				<input type="text" class="form-control" id="address_zipcode" disabled> 
				<input type="button" class="btn btn-secondary addressPostBtn" data-state="add" value="주소 검색">
			</div>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">주소:</label>
            <input type="text" class="form-control" id="address_city" disabled/>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">상세주소:</label>
            <input type="text" class="form-control" id="address_street" />
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary addressAddBtn">등록</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="addressModifyModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">배송지수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">배송지명:</label>
            <input type="text" class="form-control" id="address_modify_name" />
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">받는사람:</label>
            <input type="text" class="form-control" id="address_modify_recipient" />
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">전화번호:</label>
            <input type="text" class="form-control" id="address_modify_phone" />
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">우편번호:</label>
            <div class="input-group">
				<input type="text" class="form-control" id="address_modify_zipcode" disabled> 
				<input type="button" class="btn btn-secondary addressPostBtn" data-state="modify" value="주소 검색">
			</div>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">주소:</label>
            <input type="text" class="form-control" id="address_modify_city" disabled/>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">상세주소:</label>
            <input type="text" class="form-control" id="address_modify_street" />
          </div>
        </form>
      </div>
      <div class="modal-footer">
      	<input type="hidden" id="address_num"/>
        <button type="button" class="btn btn-primary addressModifyBtn">수정</button>
        <button type="button" class="btn btn-danger addressDelBtn">삭제</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="../layout/footer.jsp"%>