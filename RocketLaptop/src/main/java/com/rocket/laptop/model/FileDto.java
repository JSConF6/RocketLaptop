package com.rocket.laptop.model;

import lombok.Data;

@Data
public class FileDto {
	// 파일 번호
	private int product_img_num;
	
	// 상품 코드
	private String product_code;
	
	// 서버에 저장될 변경된 파일 이름
	private String product_img_name;
	
	// 서버에 저장될 오리지널 파일이름
	private String product_img_original_name;
	
	// 파일 타입
	private int product_img_type;
}
