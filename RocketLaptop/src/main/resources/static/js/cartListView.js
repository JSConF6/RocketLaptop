$(function(){
	let rowCnt = $("input[name='RowCheck']").length;
	let rowCheckList = $("input[name='RowCheck']");
	
	function cartTotalPrice(){
		let sum = 0;
		Array.from(rowCheckList).forEach((rowCheck) => {
			if(rowCheck.checked){
				sum += parseInt($(rowCheck).val());
			}
		})
		$(".cartProductTotalPrice").text(Number(sum).toLocaleString("en") + "원");
	}
	
	$("input[name='RowCheck']").on("click", function(){
		cartTotalPrice();
	});
	
	$('input[name="allCheck"]').on('click', function(){
		Array.from(rowCheckList).forEach(check => {
			check.checked = this.checked;
			cartTotalPrice();
		})
	});
	
	$("input[name='RowCheck']").on("click", function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$('input[name="allCheck"]')[0].checked = true;
		}else{
			$('input[name="allCheck"]')[0].checked = false;
		}
	}) 
	
	$(".cartDeleteBtn").on("click", function(e){
		e.preventDefault();
		
		let user_id = $("#user_id").val();
		let cart_num = $(this).attr("data-deleteCartNum");
		
		Swal.fire({
			title: '장바구니 삭제',
			text: "상품을 삭제 하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: 'red',
			cancelButtonColor: 'gray',
			cancelButtonText: '취소',
			confirmButtonText: '삭제',
			allowOutsideClick: false,
		}).then((result) => {
			if (result.isConfirmed) {
				$.ajax({
					url: "/user/cart/delete",
					type: "POST",
					data: {"user_id": user_id, "cart_num": cart_num }
				}).done(function(res) {
					console.log(res);
					if(res.status === 200){
						location.replace("/user/cart/list?user_id=" + user_id);
					}else{
						Swal.fire({
							icon: "warning",
							title: "장바구니 삭제",
							text: "상품 삭제 실패했습니다.",
							allowOutsideClick: false,
						}).then(() => {
							location.replace("/user/cart/list?user_id=" + user_id);
						})
					}
				}).fail(function(err) {
					console.log(err)
				})
			}
		})
	})
	
	$(".allDeleteBtn").on("click", function(e){
		e.preventDefault();
		let user_id = $("#user_id").val();
		let cartNumList = new Array();
		
		Swal.fire({
			title: '장바구니 삭제',
			text: "장바구니 상품 전체 삭제 하시겠습니까?",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: 'red',
			cancelButtonColor: 'gray',
			cancelButtonText: '취소',
			confirmButtonText: '삭제',
			allowOutsideClick: false,
		}).then((result) => {
			if (result.isConfirmed) {
				Array.from(rowCheckList).forEach(rowCheck => {
					cartNumList.push($(rowCheck).attr("data-cartNum"));
				});
				
				$.ajax({
					url: "/user/cart/allDelete",
					type: "POST",
					traditional : true,
					data: {"user_id": user_id, "cartNumList": cartNumList }
				}).done(function(res) {
					console.log(res);
					if(res.status === 200){
						location.replace("/user/cart/list?user_id=" + user_id);
					}else{
						Swal.fire({
							icon: "warning",
							title: "장바구니 삭제",
							text: res.data,
							allowOutsideClick: false,
						}).then(() => {
							location.replace("/user/cart/list?user_id=" + user_id);
						})
					}
				}).fail(function(err) {
					console.log(err)
				})
			}
		})
	});
	
	$(".orderBtn").on("click", function(e){
		e.preventDefault();
		
		let user_id = $("#user_id").val();
		let cartNumList = new Array();
		
		Array.from(rowCheckList).forEach((rowCheck) => {
			if(rowCheck.checked){
				cartNumList.push($(rowCheck).attr("data-cartNum"));
			}
		})
		
		if(cartNumList.length === 0){
			Swal.fire({
				icon: "warning",
				title: "상품주문",
				text: "주문 하실 상품을 선택해주세요.",
				allowOutsideClick: false,
			});
			return false;
		}
		
		$(".orderViewForm").append(inputAdd("cartNumList", cartNumList));
		$(".orderViewForm").append(inputAdd("user_id", user_id));
		
		$(".orderViewForm").submit();
	});
});

function inputAdd(name, data){
	let output = "<input type='hidden' value=" + data + " name=" + name + " />";
	return output;
}