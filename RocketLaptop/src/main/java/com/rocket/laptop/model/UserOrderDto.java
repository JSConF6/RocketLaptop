package com.rocket.laptop.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserOrderDto {
	private String order_id;
	private int count;
	private String product_code;
	private String product_name;
	private int product_price;
	private int order_de_amount;
	private String category_name;
	private String order_state;
	private String product_img_name;
	private Timestamp order_date;
}
