package com.rocket.laptop.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.UserDto;

@Mapper
@Repository
public interface UserMapper {

	int save(UserDto user);

	UserDto findById(String id);
	
}
