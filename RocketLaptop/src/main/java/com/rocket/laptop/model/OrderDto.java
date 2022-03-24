package com.rocket.laptop.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderDto {
	private String order_id;
	private String user_id;
	private String order_name;
	private String user_address1;
	private String user_address2;
	private String user_address3;
	private String order_phone;
	private String order_state;
	private int order_totalprice;
	private Timestamp order_date;
}
