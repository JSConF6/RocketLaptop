$(function(){
	let price = $("#price").val();
	let totalPrice = price;
	
	$(".productTotalPrice").text(Number(price).toLocaleString("en") + "원");
	
	$(".plus").on("click", function(){
		let num = $(".productCount").val();
		let plusNum = Number(num) + 1;
		
		if(plusNum >= 1000){
			$(".productCount").val(num);
		}else{
			totalPrice = price * plusNum;
			$(".productTotalPrice").text(Number(totalPrice).toLocaleString("en") + "원");
			$(".productCount").val(plusNum);
		}
	});
	
	$(".minus").click(function(){
		var num = $(".productCount").val();
		var minusNum = Number(num) - 1;
		   
		if(minusNum <= 0) {
			$(".productCount").val(num);
		} else {
			totalPrice = totalPrice - price;
			$(".productTotalPrice").text(Number(totalPrice).toLocaleString("en") + "원");
			$(".productCount").val(minusNum);          
		}
	});
	
	$(".cartBtn").on("click", function(e){
		e.preventDefault();
		let product_code = $("#product_code").val();
		let order_de_amount = $(".productCount").val();
		let user_id = $("#user_id").val();
		
		if(user_id === undefined){
			Swal.fire({
				icon: "warning",
				title: "장바구니 담기",
				text: "로그인 후 담을 수 있습니다.",
				allowOutsideClick: false,
			}).then(() => {
				location.href = "/login";
			})
			return false;
		}
		
		$.ajax({
				url: "/user/cart/add",
				type: "POST",
				data: {"product_code": product_code, "order_de_amount" : order_de_amount, "user_id": user_id},
		}).done(function(res) {
			console.log(res)
			if(res.status === 200){
				CartListCount();
				Swal.fire({
				  title: '장바구니 담기',
				  text: res.data,
				  icon: 'success',
				  showCancelButton: true,
				  confirmButtonColor: '#0d6efd',
				  cancelButtonColor: 'gray',
				  cancelButtonText: '계속 쇼핑',
				  confirmButtonText: '장바구니로',
				  allowOutsideClick: false,
				}).then((result) => {
				  if (result.isConfirmed) {
				    location.href = "/user/cart/list?user_id=" + user_id
				  }
				})
			}else{
				Swal.fire({
					icon: "warning",
					title: "장바구니 담기",
					text: res.data,
					allowOutsideClick: false,
				})
			}
		}).fail(function(err) {
			console.log(err)
		})
		
	});
	
	function CartListCount(){
		let user_id = $("#user_id").val();
		
		$.ajax({
			url: "/user/cartListCount",
			type: "GET",
			data: {"user_id": user_id}
		}).done(function(res) {
			$("#cart-badge").text(res);
		}).fail(function(err) {
			console.log(err)
		})
	}
	
	$(".productDetailOrderBtn").on("click", function(e){
		e.preventDefault();
		
		let product_code = $("#product_code").val();
		let user_id = $("#user_id").val();
		let order_de_amount = $(".productCount").val();
		
		if(user_id === undefined){
			Swal.fire({
				icon: "warning",
				title: "상품 주문",
				text: "로그인 후 상품을 주문 하실 수 있습니다.",
				allowOutsideClick: false,
			}).then(() => {
				location.href = "/login";
			})
			return false;
		}
		
		$("#productDetailOrderAdd").append(orderAddFromInputAdd("order_de_amount", order_de_amount));
		$("#productDetailOrderAdd").append(orderAddFromInputAdd("user_id", user_id));
		$("#productDetailOrderAdd").append(orderAddFromInputAdd("product_code", product_code));
		
		$("#productDetailOrderAdd").submit();
	})
	
	function orderAddFromInputAdd(name, data){
		let output = "<input type='hidden' value=" + data + " name=" + name + " />";
		return output;
	}
});