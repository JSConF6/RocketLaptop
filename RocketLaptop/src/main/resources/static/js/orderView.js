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
						Swal.fire({
							icon: "success",
							title: "상품 주문",
							text: res.data,
							allowOutsideClick: false,
						}).then(() => {
							location.replace("/user/mypage/order/list?user_id=" + data.user_id);
						})
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