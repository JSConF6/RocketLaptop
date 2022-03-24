package com.rocket.laptop.service;

import java.util.List;

import com.rocket.laptop.model.OrderDetailDto;
import com.rocket.laptop.model.OrderDto;
import com.rocket.laptop.model.PageHandler;

public interface OrderService {
	
	public int getOrderListCount();
	
	public List<OrderDto> getOrderList(PageHandler pageHandler);
	
	public OrderDto getOrder(String order_id);
	
	public List<OrderDetailDto> getOrderDetail(String order_id);
	
	public int OrderDeliveryUpdate(String order_id, String delivery_text);
}
