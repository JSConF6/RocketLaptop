package com.rocket.laptop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.repository.UserMapper;

@Service
public class UserServuceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserDto getUser(String id) {
		return userMapper.findById(id);
	}

}
