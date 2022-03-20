package com.rocket.laptop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.RoleType;
import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.repository.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public UserDto getUser(String id) {
		return userMapper.findById(id);
	}

	@Override
	public int isId(String id) {
		UserDto userDto = userMapper.findById(id);
		return (userDto == null) ? -1 : 1;
	}

	@Override
	public int register(UserDto userDto) {
		String rawPassword = userDto.getUser_password();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		userDto.setUser_password(encPassword);
		
		userDto.setUser_role(RoleType.USER.role());
		
		return userMapper.save(userDto);
	}

}
