package com.rocket.laptop.model;

import lombok.Data;

@Data
public class PasswordDto {
	private String currentPassword;
	private String newPassword;
	private String reNewPassword;
}
