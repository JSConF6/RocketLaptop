$(function(){
	let image_value = "";
	let image_upload = "";
	let image_remove = "";
	let imageType = new Array();
	
	$(".product_add_form").on('submit', function(e){
		e.preventDefault();
		
		if($.trim($("#productCode").val()) == ""){
			Swal.fire({
				icon: "error",
				title: "상품등록",
				text: "상품코드를 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		if($.trim($("#productName").val()) == ""){
			Swal.fire({
				icon: "error",
				title: "상품등록",
				text: "상품이름을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		if($.trim($("#productPrice").val()) == ""){
			Swal.fire({
				icon: "error",
				title: "상품등록",
				text: "상품가격을 입력해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		if($.trim($("#thumbnail_upload").val()) == ""){
			Swal.fire({
				icon: "error",
				title: "상품등록",
				text: "썸네일 이미지를 첨부해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		if($.trim($("#image1_upload").val()) === "" && $.trim($("#image2_upload").val()) === "" && $.trim($("#image3_upload").val()) === ""){
			Swal.fire({
				icon: "error",
				title: "상품등록",
				text: "상품 이미지 하나 이상 첨부해주세요",
				allowOutsideClick: false,
			})
			return false;
		}
		
		if($.trim($("#details_upload").val()) == ""){
			Swal.fire({
				icon: "error",
				title: "상품등록",
				text: "상세설명 이미지를 첨부해주세요.",
				allowOutsideClick: false,
			})
			return false;
		}
		
		$(".imgType").val(imageType);
		this.submit();
	}); // submit end
	
	//이미지 첨부 부분
	function show(){
		if(image_value === ''){
			$(".thumbnail_remove").css('display', 'none');
			$(".image1_remove").css('display', 'none');
			$(".image2_remove").css('display', 'none');
			$(".image3_remove").css('display', 'none');
			$(".details_remove").css('display', 'none');
		}else {
			if($(image_value).text() === ''){
				$(image_remove).css('display', 'none');
			} else {
				$(image_remove).css('display', 'inline-block');
			}	
		}
	}
	
	show();
	
	function imageBtnClick(upload){
		$(upload).click();
	}
	
	$(".image_upload").on("change", image_upload, function(){
		console.log(image_upload)
		let inputimg = $(this).val().split("\\");
		let filename = inputimg[inputimg.length - 1];
		let imgSize = $(this)[0].files[0].size;
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
			console.log(filename)
			if(image_value.includes("thumbnail")){
				imageType.push(filename + "/" + 1);
			}else if(image_value.includes("image1")){
				imageType.push(filename + "/" + 2);
			}else if(image_value.includes("image2")){
				imageType.push(filename + "/" + 2);
			}else if(image_value.includes("image3")){
				imageType.push(filename + "/" + 2);
			}else if(image_value.includes("details")){
				imageType.push(filename + "/" + 3);
			}
			console.log(imageType);
			
			$(image_value).text(filename);
			show();
		}else{
			Swal.fire({
				icon: "warning",
				title: "파일등록",
				text: "확장자는 gif, jpg, jpeg, png가 가능합니다.",
				allowOutsideClick: false,
			})
			$(this).val('');
			return false;
		}
	});
	
	$(".image_remove").on("click", function(e){
		e.preventDefault();
		if($(this)[0].classList[0] === "thumbnail_remove"){
			changeId("#thumbnail_value", "#thumbnail_upload", ".thumbnail_remove");
			remove();
		}else if($(this)[0].classList[0] === "image1_remove"){
			changeId("#image1_value", "#image1_upload", ".image1_remove");
			remove();
		}else if($(this)[0].classList[0] === "image2_remove"){
			changeId("#image2_value", "#image2_upload", ".image2_remove");
			remove();
		}else if($(this)[0].classList[0] === "image3_remove"){
			changeId("#image3_value", "#image3_upload", ".image3_remove");
			remove();
		}else if($(this)[0].classList[0] === "details_remove"){	
			changeId("#details_value", "#details_upload", ".details_remove");
			remove();
		}
	})
	
	function remove(){
		let imageName = $(image_value).text();
		
		let filtered = imageType.filter((element) => !element.includes(imageName));
		console.log(filtered)
		imageType = filtered;
		
		$(image_value).text('');
		$(image_upload).val('');
		show();
	};
	
	$(".image_btn").on("click", function(e){
		e.preventDefault();
		
		if(this.value === "thumbnail"){
			changeId("#thumbnail_value", "#thumbnail_upload", ".thumbnail_remove");
			imageBtnClick(image_upload);
		}else if(this.value === "image1"){
			changeId("#image1_value", "#image1_upload", ".image1_remove");
			imageBtnClick(image_upload);
		}else if(this.value === "image2"){
			changeId("#image2_value", "#image2_upload", ".image2_remove");
			imageBtnClick(image_upload);
		}else if(this.value === "image3"){
			changeId("#image3_value", "#image3_upload", ".image3_remove");
			imageBtnClick(image_upload);
		}else if(this.value === "details"){
			changeId("#details_value", "#details_upload", ".details_remove");
			imageBtnClick(image_upload);
		}
	});
	
	function changeId(value, upload, remove){
		image_value = value;
		image_upload = upload;
		image_remove = remove;
	}
	
	$(".productAddCancelBtn").on("click", function(e){
		e.preventDefault();
		history.back();
	}); // productAddCancelBtn end
});