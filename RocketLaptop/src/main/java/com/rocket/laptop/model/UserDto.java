package com.rocket.laptop.model;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserDto {
	private String user_id;
	private String user_name;
	private String user_password;
	private String user_email;
	private String user_birth;
	private String user_phone;
	private String user_gender;
	private String user_role; // ROLE_USER, ROLE_ADMIN
	private Timestamp user_reg_date;
	
	@Builder
	public UserDto(String user_id, String user_name, String user_password, String user_email, 
			String user_birth, String user_phone, String user_gender, String user_role, Timestamp user_reg_date) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_email = user_email;
		this.user_birth = user_birth;
		this.user_phone = user_phone;
		this.user_gender = user_gender;
		this.user_role = user_role;
		this.user_reg_date = user_reg_date;
	}
	
	
}
