package com.rocket.laptop.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rocket.laptop.exception.OrderFailException;
import com.rocket.laptop.model.CartDto;
import com.rocket.laptop.model.OrderDetailDto;
import com.rocket.laptop.model.OrderDto;
import com.rocket.laptop.model.OrderViewDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.repository.CartMapper;
import com.rocket.laptop.repository.OrderMapper;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int getAdminOrderListCount() {
		return orderMapper.getAdminOrderListCount();
	}

	@Override
	public List<OrderDto> getAdminOrderList(PageHandler pageHandler) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return orderMapper.getAdminOrderList(map);
	}

	@Override
	public OrderDto getOrder(String order_id) {
		return orderMapper.getOrder(order_id);
	}

	@Override
	public List<OrderDetailDto> getOrderDetail(String order_id) {
		return orderMapper.getOrderDetail(order_id);
	}

	@Override
	public int OrderDeliveryUpdate(String order_id, String delivery_text) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("order_id", order_id);
		map.put("delivery_text", delivery_text);
		
		return orderMapper.OrderDeliveryUpdate(map);
	}

	@Override
	public List<OrderViewDto> getOrderViewList(String user_id, int[] cartNumList) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("user_id", user_id);
		map.put("cartNumList", cartNumList);

		return orderMapper.getOrderViewList(map);
	}

	@Override
	@Transactional
	public void orderAdd(OrderDto orderDto, List<CartDto> cartDtoList, int[] cartNumList, IamportClient iamportClient) throws IamportResponseException, IOException{
		Map<String, Object> map = new HashMap<>();
		
		map.put("orderDto", orderDto);
		map.put("cartNumList", cartNumList);
		
		try {
			orderMapper.orderAdd(orderDto);
			
			for(CartDto cartDto : cartDtoList) {
				map.put("product_code", cartDto.getProduct_code());
				map.put("order_de_amount", cartDto.getOrder_de_amount());
				orderMapper.orderDetailAdd(map);
			}
			
			cartMapper.orderCartDelete(map);
		} catch (Exception e) {
			CancelData cancelData = new CancelData(orderDto.getImpUid(), true);
			iamportClient.cancelPaymentByImpUid(cancelData);
			throw new OrderFailException("주문 실패 결제가 취소됩니다.");
		}
	}

	@Override
	public int getOrderListCount(String user_id) {
		return orderMapper.getOrderListCount(user_id);
	}

	@Override
	public List<OrderDto> getOrderList(String user_id, PageHandler pageHandler) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("user_id", user_id);
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return orderMapper.getOrderList(map);
	}

	@Override
	public OrderDto getUserOrderDetail(String order_id, String user_id) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("user_id", user_id);
		map.put("order_id", order_id);
		
		return orderMapper.getUserOrderDetail(map);
	}

	@Override
	public List<OrderViewDto> getMainOrderViewList(String product_code) {
		return orderMapper.getMainOrderViewList(product_code);
	}

	@Override
	public void mainOrderAdd(OrderDto orderDto, String product_code, int order_de_amount, IamportClient iamportClient) throws IamportResponseException, IOException {
		Map<String, Object> map = new HashMap<>();
		
		map.put("orderDto", orderDto);
		map.put("product_code", product_code);
		map.put("order_de_amount", order_de_amount);
		
		try {
			orderMapper.orderAdd(orderDto);
			
			orderMapper.orderDetailAdd(map);
		} catch (Exception e) {
			CancelData cancelData = new CancelData(orderDto.getImpUid(), true);
			iamportClient.cancelPaymentByImpUid(cancelData);
			throw new OrderFailException("주문 실패 결제가 취소됩니다.");
		}
	}

}
