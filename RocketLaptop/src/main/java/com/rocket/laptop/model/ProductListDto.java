package com.rocket.laptop.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductListDto {
	private String product_code;
	private String category_name;
	private String product_name;
	private int product_price;
	private String filename;
	private String original_filename;
	private Timestamp product_reg_date;
}
