package com.rocket.laptop.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.CategoryDto;

@Mapper
@Repository
public interface CategoryMapper {
	List<CategoryDto> getAllCategory();

	String getCategoryName(int category_code);
}
