$(function(){
	function cartTotalPrice(){
		let sum = 0;
		let rowCheckList = $("input[name='RowCheck']");
		Array.from(rowCheckList).forEach((rowCheck) => {
			if(rowCheck.checked){
				sum += sum += parseInt($(rowCheck).val());
			}
		})
		$(".cartProductTotalPrice").text(Number(sum).toLocaleString("en") + "원");
	}
	
	$("input[name='RowCheck']").on("click", function(){
		cartTotalPrice();
	});
	
	$('input[name="allCheck"]').on('click', function(){
		let checkList = $('input[name="RowCheck"]');
		Array.from(checkList).forEach(check => {
			check.checked = this.checked;
			cartTotalPrice();
		})
	});
	
	let rowCnt = $("input[name='RowCheck']").length;
	
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
		let rowCheckList = $("input[name='RowCheck']");
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
});