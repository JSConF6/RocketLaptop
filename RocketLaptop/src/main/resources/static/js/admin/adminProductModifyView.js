$(function(){
	let imageType = new Array();
	let image_upload = new Array();
	
	$(".productModdifySubmitBtn").on("click", function(e){
		e.preventDefault();
		productModify();
	});
	
	function productModify(){
		let product_code = $.trim($("#productCode").val());
		
		let product_name = $.trim($("#productName").val());
		if(product_name == ""){
			Swal.fire({
				icon: "error",
				title: "상품수정",
				text: "상품이름을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let product_price = $.trim($("#productPrice").val());
		if(product_price == ""){
			Swal.fire({
				icon: "error",
				title: "상품수정",
				text: "상품가격을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		if($.trim($("#thumbnail_upload").val()) == ""){
			Swal.fire({
				icon: "error",
				title: "상품수정",
				text: "썸네일 이미지를 첨부해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		if($.trim($("#image1_upload").val()) === "" && $.trim($("#image2_upload").val()) === "" && $.trim($("#image3_upload").val()) === ""){
			Swal.fire({
				icon: "error",
				title: "상품수정",
				text: "상품 이미지 하나 이상 첨부해주세요",
				allowOutsideClick: false,
			})
			return false;
		}
		
		if($.trim($("#detail_upload").val()) == ""){
			Swal.fire({
				icon: "error",
				title: "상품수정",
				text: "상세설명 이미지를 첨부해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		let category_code = $("#category_code").val();
		
		let frm = new FormData;
		
		for(let i = 0; i < image_upload.length; i++){
			frm.append("image_upload", image_upload[i]);
		}
		
		frm.append("product_code", product_code);
		frm.append("category_code", category_code);
		frm.append("product_name", product_name);
		frm.append("product_price", product_price);
		
		frm.append("imageType", imageType);
		
		$.ajax({
				url: "/admin/productModify",
				enctype : "multipart/form-data",
				processData: false,
    			contentType: false,
				type: "POST",
				data: frm,
		}).done(function(res) {
			console.log(res)
			if(res.status === 200){
				Swal.fire({
					icon: "success",
					title: "상품수정",
					text: "상품이 수정되었습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/admin/productDetail?product_code=" + product_code);
				})
			}else{
				Swal.fire({
					icon: "error",
					title: "상품수정",
					text: "상품 수정 실패했습니다.",
					allowOutsideClick: false,
				}).then(() => {
					location.replace("/admin/productList");
				})
			}
		}).fail(function(err) {
			consle.log(err)
		})
	}
	
	function removeShow(){
		$(".image_modify_remove").css('display', 'inline-block');
	}
	
	removeShow();
	
	//이미지 첨부 부분
	function show(value, remove){
		if($(value).text() === ''){
			$(remove).css('display', 'none');
		} else {
			$(remove).css('display', 'inline-block');
		}	
	}
	
	$(".image_modify_upload").on("change", function(){
		let file = $(this)[0].files[0];
		let id = $(this)[0].id;
		
		let value = "#" + id.split("_")[0] + "_value";
		let remove = "." + id.split("_")[0] + "_remove";
		let inputImg = $(this).val().split("\\");
		let filename = inputImg[inputImg.length - 1];
		let imgSize = file.size;
		let maxSize = 10 * 1024 * 1024;
		let pattern = /(gif|jpg|jpeg|png)$/i;
		
		if(imgSize > maxSize){
			Swal.fire({
				icon: "warning",
				title: "파일등록",
				text: "이미지 용량은 10MB 이내로 첨부 하실 수 있습니다.",
				allowOutsideClick: false,
			})
			$(this).val('');
			return false;
		}
		
		if(pattern.test(filename)){
			if(value.includes("thumbnail")){
				image_upload[0] = file;
				imageType.push(filename + "/" + 1);
			}else if(value.includes("image1")){
				image_upload[1] = file;
				imageType.push(filename + "/" + 2);
			}else if(value.includes("image2")){
				image_upload[2] = file;
				imageType.push(filename + "/" + 2);
			}else if(value.includes("image3")){
				image_upload[3] = file;
				imageType.push(filename + "/" + 2);
			}else if(value.includes("detail")){
				image_upload[4] = file;
				imageType.push(filename + "/" + 3);
			}
			console.log(imageType);
			
			$(value).text(filename);
			show(value, remove);
		}
	})
	
	$(".image_modify_remove").on("click", function(e){
		e.preventDefault();
		let id = $(this)[0].id;
		let image_value = "#" + id.split("_")[0] + "_value";
		let image_upload = "#" + id.split("_")[0] + "_upload";
		let image_remove = "." + id.split("_")[0] + "_remove";
		
		let num = 0;
		if(id.split("_")[0] === "thumbnail"){
			num = 0;
		}else if(id.split("_")[0] === "image1"){
			num = 1;
		}else if(id.split("_")[0] === "image2"){
			num = 2;
		}else if(id.split("_")[0] === "image3"){
			num = 3;
		}else if(id.split("_")[0] === "detail"){
			num = 4;
		}
		
		remove(image_value, image_upload, image_remove, num)
	})
	
	function remove(value, upload, remove, num){
		let imageName = $(value).text();
		
		let filtered = imageType.filter((element) => !element.includes(imageName));
		console.log(filtered)
		imageType = filtered;
		
		delete image_upload[num];
		console.log(image_upload)
		
		$(value).text('');
		$(upload).val('');
		show(value, remove);
	};
	
	$(".productModifyCancelBtn").on("click", function(e){
		e.preventDefault();
		history.back();
	}); // productAddCancelBtn end
});