package com.rocket.laptop.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentDto {
	private int comment_num;
	private int qna_num;
	private String comment_content;
	private Timestamp comment_reg_date;
}
