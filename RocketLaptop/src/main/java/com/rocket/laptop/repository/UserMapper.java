package com.rocket.laptop.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.UserDto;

@Mapper
@Repository
public interface UserMapper {

	int save(UserDto user);

	UserDto findById(String id);

	int getUserListCount();

	List<UserDto> getUserList(Map<String, Object> map);

	int userUpdate(UserDto userDto);

	int updatePassword(Map<String, Object> map);
	
}
