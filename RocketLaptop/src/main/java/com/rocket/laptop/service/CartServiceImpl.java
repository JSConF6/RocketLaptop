package com.rocket.laptop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.CartDto;
import com.rocket.laptop.repository.CartMapper;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int cartAdd(CartDto cartDto) {
		return cartMapper.cartAdd(cartDto);
	}

	@Override
	public CartDto findByProductCode(String product_code) {
		return cartMapper.findByProductCode(product_code);
	}

	@Override
	public List<CartDto> getCartList(String user_id) {
		return cartMapper.getCartList(user_id);
	}

	@Override
	public int getCartListcount(String user_id) {
		return cartMapper.getCartListCount(user_id);
	}

	@Override
	public int cartDelete(CartDto cartDto) {
		return cartMapper.cartDelete(cartDto);
	}

	@Override
	public int cartAllDelete(String user_id, int[] cartNumList) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("user_id", user_id);
		map.put("cartNumList", cartNumList);
		
		return cartMapper.cartAllDelete(map);
	}

}
