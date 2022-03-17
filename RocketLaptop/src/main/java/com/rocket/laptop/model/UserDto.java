package com.rocket.laptop.model;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserDto {
	private String id;
	private String username;
	private String password;
	private String email;
	private String birth;
	private String phone;
	private String gender;
	private String role; // ROLE_USER, ROLE_ADMIN
	private String provider;
	private Timestamp createDate;
	
	@Builder
	public UserDto(String id, String username, String password, String email, 
			String birth, String phone, String gender, String role, String provider, Timestamp createDate) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.birth = birth;
		this.phone = phone;
		this.gender = gender;
		this.role = role;
		this.provider = provider;
		this.createDate = createDate;
	}
	
	
}
