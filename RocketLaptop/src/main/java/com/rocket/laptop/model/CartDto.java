package com.rocket.laptop.model;

import lombok.Data;

@Data
public class CartDto {
	private int cart_num;
	private String product_code;
	private String user_id;
	private int order_de_amount;
	private String category_name;
	private String product_name;
	private String product_price;
	private String product_img_name;
}
