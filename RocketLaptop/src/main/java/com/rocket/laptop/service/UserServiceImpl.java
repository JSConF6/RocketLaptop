package com.rocket.laptop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.PasswordDto;
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

	@Override
	public int getUserListCount() {
		return userMapper.getUserListCount();
	}

	@Override
	public List<UserDto> getUserList(PageHandler pageHandler) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return userMapper.getUserList(map);
	}

	@Override
	public int userUpdate(UserDto userDto) {
		return userMapper.userUpdate(userDto);
	}

	@Override
	public int updatePassword(UserDto userDto, PasswordDto passwordDto) {
		int result = 0;
		
		if(bCryptPasswordEncoder.matches(passwordDto.getCurrentPassword(), userDto.getUser_password())) {
			if(passwordDto.getNewPassword().equals(passwordDto.getReNewPassword())) {
				String encPassword = bCryptPasswordEncoder.encode(passwordDto.getNewPassword());
				
				Map<String, Object> map = new HashMap<>();
				
				map.put("user_id", userDto.getUser_id());
				map.put("encPassword", encPassword);
				
				result = userMapper.updatePassword(map);
			}
		}
		
		return result;
	}

}
