package com.rocket.laptop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.CategoryDto;
import com.rocket.laptop.repository.CategoryMapper;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public List<CategoryDto> getAllCategory() {
		return categoryMapper.getAllCategory();
	}

	@Override
	public String getCategoryName(int category_code) {
		return categoryMapper.getCategoryName(category_code);
	}

}
