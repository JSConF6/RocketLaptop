$(function() {
	
	$(".delivery_state_update_btn").on("click", function(e){
		e.preventDefault();
		
		let delivery_text = $(this).text();
		let order_id = $("#orderId").val();
		
		$.ajax({
				url: "/admin/orderDeliveryUpdate",
				type: "POST",
				data: {"delivery_text": delivery_text, "order_id": order_id},
		}).done(function(res) {
			console.log(res)
			if(res === 1){
				location.replace("/admin/orderDetail?order_id=" + order_id);
			}
		}).fail(function(err) {
			console.log(err)
		})
	});
	
	$(".orderListBtn").on("click", function(e) {
		e.preventDefault();
		location.href = "/admin/orderList";
	});
});