package com.rocket.laptop.service;

import java.util.List;

import com.rocket.laptop.model.CategoryDto;

public interface CategoryService {
	public List<CategoryDto> getAllCategory();

	public String getCategoryName(int category_code);
}
