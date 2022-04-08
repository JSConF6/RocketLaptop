$(function(){
	$("#order_state").on("change", function(){
		orderGo(1);
	});
});

function orderGo(page){
	let order_state = $('#order_state').val();
	let user_id = $("#user_id").val();
	let data = "order_state=" + order_state + "&page=" + page + "&user_id=" + user_id;
	orderAjax(data);
}

function orderSetPaging(href, digit, pageItem){
	let output = pageItem;
	gray = "";
	if(href == ""){
		gray = " gray";
	}
	anchor = "<a class='page-link" + gray + "'" + href + "><span>" + digit + "</span></a></li>";
	output += anchor;
	return output;
}

function orderAjax(data){
	console.log(data);
	let output = "";
	let user_id = $("#user_id").val();
	
	$.ajax({
		url : "/user/mypage/order/list/ajax",
		type: "GET",
		data : data,
	}).done(function(res){
		console.log(res);
		$('#order_state').val(res.data.order_state);
		$(".myOrderListCount").text("주문건수 : " + res.data.pageHandler.listCount + "개");
		if(res.data.pageHandler.listCount > 0){
			$(".empty_order").remove();
			$(".order_table").remove();
			
			let output = "<table class='table text-center align-middle order_table'>";
				output += "<thead><tr><th>주문일자<br>[주문번호]</th><th>이미지</th><th>상품정보</th><th>수량</th><th>상품구매금액</th><th>주문처리상태</th></tr></thead><tbody>";
				
			let num = 0;
			$(res.data.orderList).each(function(orderIndex, orderDto){
				$(res.data.userOrderList).each(function(userOrderIndex, userOrder){
					let date  = userOrder.order_date.substring(0, 10);
					
					if(orderDto.order_id === userOrder.order_id){
						output += "<tr>";
						if(num == 0){
							num = num + 1;
							$(res.data.userOrderListGroupCount).each(function(groupCountIndex, groupCount){
								if(groupCount.order_id === userOrder.order_id){
									output += "<td rowspan='" + groupCount.count + "'>" + date;
									output += "<br>[<a href='/user/mypage/order/detail?user_id=" + user_id;
									output += "&order_id=" + userOrder.order_id + "'>" + userOrder.order_id + "</a>]</td>"; 
								}
							});
						}else if(num !== 0){
							output += "<td style='display : none'></td>";
						}
						
						output += "<td><a href='/product/detail?product_code=" + userOrder.product_code + "'>";
						output += "<img src='/upload" + userOrder.product_img_name + "' width='80px' height='80px'></a></td>";
						output += "<td><a href='/product/detail?product_code=" + userOrder.product_code + "'>" + userOrder.product_name + "</a><br>";
						output += "[카테고리 : " + userOrder.category_name + "]</td>";
						output += "<td>" + userOrder.order_de_amount + "</td>";
						let price = userOrder.product_price * userOrder.order_de_amount;
						output += "<td>" + price + "원</td>";
						output += "<td>" + userOrder.order_state + "</td>";
						output += "</tr>";
					}
				});
				num = 0;
			});
			output += "</tbody></table>";
			$(".mypage_orderlist_container").append(output);
			
			$(".myOrderPagination").remove();
			output = '<nav class="d-flex justify-content-center myOrderPagination"><ul class="pagination">';
			
			digit = '&laquo;';
			href = "";
			pageItem = "";
			if(res.data.pageHandler.page > 1){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:orderGo(" + (res.data.pageHandler.page - 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += orderSetPaging(href, digit, pageItem);
			
			for(let i = res.data.pageHandler.startPage; i <= res.data.pageHandler.endPage; i++){
				digit = i;
				href = "";
				pageItem = "";
				if(i !== res.data.pageHandler.page){
					href = "href=javascript:orderGo(" + i + ")";
					pageItem = "<li class='page-item'>";
				}
				
				if(i === res.data.pageHandler.page){					
					pageItem = "<li class='page-item active'>";
				}
				output += orderSetPaging(href, digit, pageItem);
			}
			
			digit = "&raquo;";
			href = "";
			if(res.data.pageHandler.page < res.data.pageHandler.maxPage){
				pageItem = "<li class='page-item'>";
				href = "href=javascript:orderGo(" + (res.data.pageHandler.page + 1) + ")";
			}
			pageItem = "<li class='page-item'>";
			output += orderSetPaging(href, digit, pageItem);
			output += '</ul></nav>';
			
			$(".mypage_orderlist_container").append(output);
		}else if(res.data.pageHandler.listCount === 0){
			output = '';
			$(".order_table").remove();
			$(".myOrderPagination").remove();
			$(".empty_order").remove();
			let order_state = $('#order_state').val();
			var message = ['주문건수가 없습니다.', '배송 준비 중인 상품이 없습니다.', '배송 중인 상품이 없습니다.', "배송 완료된 상품이 없습니다."];
			output += '<div class="text-center mt-5 mb-5 empty_order"><h1>' + message[order_state] + '</h1></div>';
			$('.mypage_orderlist_container').append(output);
		}
	}).fail(function(err){
		console.log(err);
	});
}