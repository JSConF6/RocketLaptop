package com.rocket.laptop.model;

import lombok.Data;

@Data
public class OrderDetailDto {
	private String product_code;
	private int category_code;
	private String category_name;
	private String product_name;
	private int product_price;
	private int order_de_amount;
	private String product_img_name;
	private String product_img_original_name;
}
