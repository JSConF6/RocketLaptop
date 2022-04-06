package com.rocket.laptop.model;

import lombok.Data;

@Data
public class AddressDto {
	private int address_num;
	private String address_name;
	private String user_id;
	private String address_recipient;
	private String address_phone;
	private String address_zipcode;
	private String address_city;
	private String address_street;
}
