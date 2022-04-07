package com.rocket.laptop.service;

import java.util.List;

import com.rocket.laptop.model.CartDto;

public interface CartService {
	
	public int cartAdd(CartDto cartDto);

	public CartDto findByProductCode(String product_code);

	public List<CartDto> getCartList(String user_id);

	public int getCartListcount(String user_id);

	public int cartDelete(CartDto cartDto);

	public int cartAllDelete(String user_id, int[] cartNumList);

	public List<CartDto> findByCartNumList(int[] cartNumList);

	public void updateOrderDeAmount(CartDto cartDto);
}
