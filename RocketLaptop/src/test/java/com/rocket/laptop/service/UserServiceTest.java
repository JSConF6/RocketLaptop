package com.rocket.laptop.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.rocket.laptop.model.UserDto;

class UserServiceTest {
	
	@Autowired
	private UserService userService;
	
	@Test
	void getUser() {
		UserDto userDto = userService.getUser("jsconf");
		System.out.println(userDto);
	}

}
