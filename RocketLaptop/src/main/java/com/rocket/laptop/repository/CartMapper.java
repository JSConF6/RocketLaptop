package com.rocket.laptop.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.CartDto;
import com.rocket.laptop.model.CategoryDto;

@Mapper
@Repository
public interface CartMapper {

	int cartAdd(CartDto cartDto);

	CartDto getCart(CartDto cartDto);

	List<CartDto> getCartList(String user_id);

	int getCartListCount(String user_id);

	int cartDelete(CartDto cartDto);

	int cartAllDelete(Map<String, Object> map);

	int orderCartDelete(Map<String, Object> map);

	List<CartDto> findByCartNumList(Map<String, Object> map);

	void updateOrderDeAmount(CartDto cartDto);
	
}
