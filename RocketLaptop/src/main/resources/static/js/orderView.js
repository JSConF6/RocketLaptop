$(function(){
	$("#postBtn").on("click", function(){
		Postcode();
	});
	
	function Postcode(){
		new daum.Postcode({
			oncomplete: function(data) {
				
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수
				
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				
				if(fullRoadAddr !== ''){
					fullRoadAddr += extraRoadAddr;
				}
				
				
				$('#user_address1').val(data.zonecode);
				$('#user_address2').val(fullRoadAddr);
				
			}
		}).open();
	}
	
	$(".orderAddBtn").on("click", function(e){
		e.preventDefault();
		
		let dataList = $("input[name='data']");
		let productCode = "";
		let cartNumList = new Array();
		
		Array.from(dataList).forEach(data => {
			productCode = $(data).attr("data-productCode");
			
			if($("input[name='data']").attr("data-cartNum") !== '0'){
				cartNumList.push($(data).attr("data-cartNum"));
			}
		})
		
		if($.trim($("#order_name").val()) === ""){
			Swal.fire({
				icon: "warning",
				title: "상품주문",
				text: "받는 사람 이름을 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		if($.trim($("#order_phone").val()) === ""){
			Swal.fire({
				icon: "warning",
				title: "상품주문",
				text: "연락처를 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		const phoneReg = /^\d{3}\d{3,4}\d{4}$/;
		if(!phoneReg.test($.trim($("#order_phone").val()))){
			Swal.fire({
				icon: "warning",
				title: "상품주문",
				text: "연락처를 형식에 맞게 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		if($.trim($("#user_address1").val()) === ""){
			Swal.fire({
				icon: "warning",
				title: "상품주문",
				text: "주소 검색을 해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		console.log($("#orderCount").val());
		console.log(cartNumList)
		
		const data = {
			order_id : createOrderNum(),
			user_id : $("#user_id").val(),
			order_name : $.trim($("#order_name").val()),
			order_phone : $.trim($("#order_phone").val()),
			user_address1 : $.trim($("#user_address1").val()),
			user_address2 : $.trim($("#user_address2").val()),
			user_address3 : $.trim($("#user_address3").val()),
			order_totalprice : $("#orderTotalPrice").val(),
			order_de_amount : $("#orderCount").val(),
			productCode : productCode,
			cartNumList : cartNumList,
		}
		
		iamport(data);
		
	});
	
	function iamport(data){
		//가맹점 식별코드
		IMP.init('imp63560217');
		IMP.request_pay({ // param
          	pg : 'html5_inicis', // 이니시스 웹표준 결제창
		    pay_method : 'card', // 결제방법
		    merchant_uid : data.order_id, // 주문번호
		    name :  data.productCode, // 상품명
		    amount : Number(data.order_totalprice), //실제 결제되는 가격
		    buyer_email : '', // 이메일
		    buyer_name : data.order_name, // 이름
		    buyer_tel : data.order_phone, // 연락처
		    buyer_addr : data.order_address2 + " " + data.order_address3, // 주소
		    buyer_postcode : data.order_address1, // 우편번호
      	}, function(rsp) {
			console.log(rsp);
			if(rsp.success){
				data.impUid = rsp.imp_uid
				$.ajax({
					url: "/user/order/payment/complete",
					type: "POST",
					traditional : true,
					data: data
				}).done(function(res) {
					console.log(res);
					if(res.status === 200){
						location.replace("/user/order/complete?user_id=" + data.user_id + "&order_id=" + res.data);
					}else{
						Swal.fire({
							icon: "warning",
							title: "상품 주문",
							text: res.data,
							allowOutsideClick: false,
						}).then(() => {
							location.replace("/");
						})
					}
				}).fail(function(err) {
					console.log(err)
					Swal.fire({
						icon: "error",
						title: "상품 주문",
						text: "결제 오류 결제가 취소됩니다.",
						allowOutsideClick: false,
					}).then(() => {
						location.replace("/");
					})
				})
			}
		});
	}
	
	$(".addressListBtn").on("click", function(){
		let user_id = $("#user_id").val();
		
		$.ajax({
			url: "/user/address/list",
			type: "GET",
			data: {"user_id": user_id}
		}).done(function(res) {
			console.log(res);
			$(".address-list").remove();
			
			if(res.data.listCount > 0){
				let output = "<ul class='address-list'>";
				
				$(res.data.addressList).each(function(index, item){
					let phone = item.address_phone;
					let order_phone = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7, 11)
					
					output += "<li class='address-form p-3 mb-2'><strong>" + item.address_recipient + "</strong>&nbsp;";
					output += "<span>(" + item.address_name + ")</span>";
					output += "<div class='form-check p-0'><span class='choice fs-2'><input class='form-check-input' type='radio' name='address' value='" + item.address_num + "'/>";
					output += "</span><p class='mt-3'>[<span>" + item.address_zipcode + "</span>] " + "<span>" + item.address_city + "</span>";
					output += "<br><span>" + item.address_street + "</span></p>";
					output += "<p class='mb-0'><span>" + order_phone + "</span></p></div></li>";
				});
				$(".address-body").append(output);
			}else if(res.data.listCount === 0){
				$(".addressChoiceBtn").css("display", "none");
				output = "<div class='fs-3 text-center empty_address'><span>등록된 배송지가 없습니다.</span></div>";
				$(".address-footer .orderAddressCancelBtn").before("<button class='btn btn-primary orderAddressAddModalBtn'>배송지등록</button>")
				$(".address-body").append(output);
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
	
	$(".OrderAddressPostBtn").on("click", function(){
		Postcode();
	});
	
	function Postcode(){
		new daum.Postcode({
			oncomplete: function(data) {
				
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수
				
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				
				if(fullRoadAddr !== ''){
					fullRoadAddr += extraRoadAddr;
				}
				
				
				$("#order_address_zipcode").val(data.zonecode);
				$("#order_address_city").val(fullRoadAddr);
				
			}
		}).open();
	}
	
	$(document).on("click", ".orderAddressAddModalBtn", function(e){
		e.preventDefault();
		
		$("#addressListModal").modal("hide");
		$("#orderAddressAddModal").modal("show");
	});
	
	$(".orderAddressAddBtn").on("click", function(e){
		e.preventDefault();
		
		let user_id = $("#user_id").val();
		
		let address_name = $.trim($("#order_address_name").val());
		if(address_name === ""){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "배송지명을 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let address_recipient = $.trim($("#order_address_recipient").val());
		if(address_recipient === ""){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "받는사람을 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let address_phone = $.trim($("#order_address_phone").val());
		if(address_phone === ""){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "전화번호를 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		const phoneReg = /^\d{3}\d{3,4}\d{4}$/;
		if(!phoneReg.test(address_phone)){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "전화번호를 형식에 맞게 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let address_zipcode = $.trim($("#order_address_zipcode").val());
		if(address_zipcode === ""){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "주소 검색을 해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let address_city = $.trim($("#order_address_city").val());
		let address_street = $.trim($("#order_address_street").val());
		
		let data = {
			"address_name" : address_name,
			"user_id" : user_id,
			"address_recipient" : address_recipient,
			"address_phone" : address_phone,
			"address_zipcode" : address_zipcode,
			"address_city" : address_city,
			"address_street" : address_street,
		}
		
		$.ajax({
			url: "/user/mypage/address/add",
			type: "POST",
			data: data
		}).done(function(res) {
			console.log(res);
			if(res.status === 200){
				$(".addressChoiceBtn").css("display", "block");
				$(".orderAddressAddModalBtn").remove();
				$(".empty_address").remove();
				$("#orderAddressAddModal").modal("hide");
				$(".addressListBtn").click();
			}else{
				Swal.fire({
					icon: "success",
					title: "배송지 등록",
					text: "배송지 등록 실패",
					allowOutsideClick: false,
				}).then(() => {
					$("#orderAddressAddModal").modal("hide");
				});
			}
		}).fail(function(err) {
			console.log(err)
		})
	})
	
	$(".addressChoiceBtn").on("click", function(){
		let address_num = $("input[name='address']:checked").val();
		let user_id = $("#user_id").val();
		
		$.ajax({
			url: "/user/address/choice",
			type: "GET",
			data: {"address_num": address_num, "user_id" : user_id}
		}).done(function(res) {
			console.log(res);
			$("#order_name").val(res.data.address_recipient);
			$("#order_phone").val(res.data.address_phone);
			$("#user_address1").val(res.data.address_zipcode);
			$("#user_address2").val(res.data.address_city);
			$("#user_address3").val(res.data.address_street);
			
			$("#addressListModal").modal('hide');
		}).fail(function(err) {
			console.log(err)
		})
	});
	
	function createOrderNum(){
		const date = new Date();
		const year = date.getFullYear();
		const month = ("0" + (date.getMonth() + 1)).slice(-2);
		const day = ("0" + (date.getDate())).slice(-2);
		
		let orderNum = year + month + day;
		for(let i = 0; i < 10; i++){
			orderNum += Math.floor(Math.random() * 8);
		}
		return orderNum;
	}
});