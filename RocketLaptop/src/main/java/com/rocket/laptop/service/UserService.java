package com.rocket.laptop.service;

import java.util.List;

import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.PasswordDto;
import com.rocket.laptop.model.UserDto;

public interface UserService {
	
	public int isId(String id);
	
	public UserDto getUser(String id);
	
	public int register(UserDto userDto);

	public int getUserListCount();

	public List<UserDto> getUserList(PageHandler pageHandler);

	public int userUpdate(UserDto userDto);

	public int updatePassword(UserDto userDto, PasswordDto passwordDto);

	public UserDto findByUsernameAndEmail(UserDto userDto);

	public UserDto findByIdAndUsernameAndEmail(UserDto userDto);

	public void updateFindPassword(UserDto userDto);
}
