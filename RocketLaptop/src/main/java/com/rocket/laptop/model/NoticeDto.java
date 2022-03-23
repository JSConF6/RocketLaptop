package com.rocket.laptop.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeDto {
	private int notice_num;
	private String notice_title;
	private String notice_content;
	private Timestamp notice_reg_date;
}
