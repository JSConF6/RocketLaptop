package com.rocket.laptop.service;

import java.util.List;

import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.UserDto;

public interface UserService {
	
	public int isId(String id);
	
	public UserDto getUser(String id);
	
	public int register(UserDto userDto);

	public int getUserListCount();

	public List<UserDto> getUserList(PageHandler pageHandler);
}
