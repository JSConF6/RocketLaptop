package com.rocket.laptop.model;

public enum RoleType {
	USER ("ROLE_USER"),
	ADMIN ("ROLE_ADMIN");
	
	private String role;

	RoleType(String role) {
		this.role = role;
	}
	
	public String role() {
		return role;
	}
}
