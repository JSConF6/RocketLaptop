package com.rocket.laptop.model;

import java.sql.Time;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewDto {
	private int review_num;
	private String user_id;
	private String product_code;
	private String product_name;
	private String review_content;
	private int review_star_rating;
	private Timestamp review_reg_date;
}