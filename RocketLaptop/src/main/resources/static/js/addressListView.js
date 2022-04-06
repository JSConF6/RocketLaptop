$(function(){
	$(".addressPostBtn").on("click", function(){
		let state = $(this).attr("data-state");
		
		let zipcode = "";
		let city = "";
		
		if(state === 'add'){
			zipcode = "#address_zipcode";
			city = "#address_city";
		}else if(state === 'modify'){
			zipcode = "#address_modify_zipcode";
			city = "#address_modify_city";
		}
		
		Postcode(zipcode, city);
	});
	
	function Postcode(zipcode, city){
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
				
				
				$(zipcode).val(data.zonecode);
				$(city).val(fullRoadAddr);
				
			}
		}).open();
	}
	
	$(".addressAddBtn").on("click", function(e){
		e.preventDefault();
		
		let user_id = $("#user_id").val();
		
		let address_name = $.trim($("#address_name").val());
		if(address_name === ""){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "배송지명을 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let address_recipient = $.trim($("#address_recipient").val());
		if(address_recipient === ""){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "받는사람을 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let address_phone = $.trim($("#address_phone").val());
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
		
		let address_zipcode = $.trim($("#address_zipcode").val());
		if(address_zipcode === ""){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "주소 검색을 해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let address_city = $.trim($("#address_city").val());
		let address_street = $.trim($("#address_street").val());
		
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
				Swal.fire({
					icon: "success",
					title: "배송지 등록",
					text: "배송지가 등록되었습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/address/list?user_id=" + user_id);
				});
			}else{
				Swal.fire({
					icon: "success",
					title: "배송지 등록",
					text: "배송지 등록 실패",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/address/list?user_id=" + user_id);
				});
			}
		}).fail(function(err) {
			console.log(err)
		})
	})
	
	$(".addressModifyModalBtn").on("click", function(e){
		e.preventDefault();
		
		let user_id = $("#user_id").val();
		let address_num = $(this).attr("data-num");
		
		let data = {
			"user_id" : user_id,
			"address_num" : address_num,
		}
		
		$.ajax({
			url: "/user/mypage/address/detail",
			type: "GET",
			data: data
		}).done(function(res) {
			console.log(res)
			$("#address_modify_name").val(res.data.address_name);
			$("#address_modify_recipient").val(res.data.address_recipient);
			$("#address_modify_phone").val(res.data.address_phone);
			$("#address_modify_zipcode").val(res.data.address_zipcode);
			$("#address_modify_city").val(res.data.address_city);
			$("#address_modify_street").val(res.data.address_street);
			$("#address_num").val(res.data.address_num);
		}).fail(function(err) {
			console.log(err)
		})
	});
	
	$(".addressDelBtn").on("click", function(e){
		e.preventDefault();
		
		let address_num = $("#address_num").val();
		let user_id = $("#user_id").val();
		
		let data = {
			"user_id" : user_id,
			"address_num" : address_num,
		}
		
		$.ajax({
			url: "/user/mypage/address/delete",
			type: "POST",
			data: data
		}).done(function(res) {
			console.log(res);
			if(res.status === 200){
				Swal.fire({
					icon: "success",
					title: "배송지 삭제",
					text: "배송지가 삭제되었습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/address/list?user_id=" + user_id);
				});
			}else{
				Swal.fire({
					icon: "success",
					title: "배송지 삭제",
					text: "배송지 삭제 실패",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/address/list?user_id=" + user_id);
				});
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
	
	$(".addressModifyBtn").on("click", function(e){
		e.preventDefault();
		
		let user_id = $("#user_id").val();
		
		let address_name = $.trim($("#address_modify_name").val());
		if(address_name === ""){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "배송지명을 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let address_recipient = $.trim($("#address_modify_recipient").val());
		if(address_recipient === ""){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "받는사람을 입력해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let address_phone = $.trim($("#address_modify_phone").val());
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
		
		let address_zipcode = $.trim($("#address_modify_zipcode").val());
		if(address_zipcode === ""){
			Swal.fire({
				icon: "warning",
				title: "배송지 등록",
				text: "주소 검색을 해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		let address_city = $.trim($("#address_modify_city").val());
		let address_street = $.trim($("#address_modify_street").val());
		let address_num = $("#address_num").val();
		
		let data = {
			"address_num" : address_num,
			"address_name" : address_name,
			"user_id" : user_id,
			"address_recipient" : address_recipient,
			"address_phone" : address_phone,
			"address_zipcode" : address_zipcode,
			"address_city" : address_city,
			"address_street" : address_street,
		}
		
		$.ajax({
			url: "/user/mypage/address/modify",
			type: "POST",
			data: data
		}).done(function(res) {
			console.log(res);
			if(res.status === 200){
				Swal.fire({
					icon: "success",
					title: "배송지 수정",
					text: "배송지가 수정되었습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/address/list?user_id=" + user_id);
				});
			}else{
				Swal.fire({
					icon: "success",
					title: "배송지 수정",
					text: "배송지 수정 실패",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/user/mypage/address/list?user_id=" + user_id);
				});
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
});