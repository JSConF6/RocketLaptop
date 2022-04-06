package com.rocket.laptop.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QuestionDto {
	private int qna_num;
	private String user_id;
	private String product_code;
	private String product_name;
	private String qna_title;
	private String qna_content;
	private String comment_content;
	private String qna_secret;
	private String qna_comment_yn;
	private Timestamp comment_reg_date;
	private Timestamp qna_reg_date;
}
