package com.rocket.laptop.model;

import lombok.Data;

@Data
public class FileDto {
	// 파일 번호
	private int num;
	
	// 상품 코드
	private String product_code;
	
	// 서버에 저장될 변경된 파일 이름
	private String filename;
	
	// 서버에 저장될 오리지널 파일이름
	private String original_filename;
	
	// 파일 타입
	private int type;
}
