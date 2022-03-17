package com.rocket.laptop.service;

import com.rocket.laptop.model.UserDto;

public interface UserService {
	
	public int isId(String id);
	
	public UserDto getUser(String id);
	
	public int register(UserDto userDto);
}
