package com.rocket.laptop.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QuestionDto {
	private int qna_num;
	private String user_id;
	private String qna_title;
	private String qna_content;
	private String comment_content;
	private int qna_readcount;
	private Timestamp qna_reg_date;
}
