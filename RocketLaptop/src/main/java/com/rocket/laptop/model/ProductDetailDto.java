package com.rocket.laptop.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductDetailDto {
	private String product_code;
	private String category_code;
	private String category_name;
	private String product_name;
	private int product_price;
	private int product_sales;
	private Timestamp product_reg_date;
}
