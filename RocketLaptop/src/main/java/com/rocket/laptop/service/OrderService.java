package com.rocket.laptop.service;

import java.io.IOException;
import java.util.List;

import com.rocket.laptop.model.CartDto;
import com.rocket.laptop.model.OrderDetailDto;
import com.rocket.laptop.model.OrderDto;
import com.rocket.laptop.model.OrderViewDto;
import com.rocket.laptop.model.PageHandler;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;

public interface OrderService {
	
	public int getOrderListCount(String user_id);
	
	public List<OrderDto> getOrderList(String user_id, PageHandler pageHandler);
	
	public OrderDto getOrder(String order_id);
	
	public List<OrderDetailDto> getOrderDetail(String order_id);
	
	public int OrderDeliveryUpdate(String order_id, String delivery_text);

	public List<OrderViewDto> getOrderViewList(String user_id, int[] cartNumList);

	public void orderAdd(OrderDto orderDto, List<CartDto> cartDtoList, int[] cartNumList, IamportClient iamportClient) throws IamportResponseException, IOException;

	public int getAdminOrderListCount();

	public List<OrderDto> getAdminOrderList(PageHandler pageHandler);

	public OrderDto getUserOrderDetail(String order_id, String user_id);
}
