package com.rocket.laptop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rocket.laptop.exception.OrderFailException;
import com.rocket.laptop.model.OrderDetailDto;
import com.rocket.laptop.model.OrderDto;
import com.rocket.laptop.model.OrderViewDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.repository.CartMapper;
import com.rocket.laptop.repository.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int getOrderListCount() {
		return orderMapper.getOrderListCount();
	}

	@Override
	public List<OrderDto> getOrderList(PageHandler pageHandler) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return orderMapper.getOrderList(map);
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
	public void orderAdd(OrderDto orderDto, int[] cartNumList) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("orderDto", orderDto);
		map.put("cartNumList", cartNumList);
		
		try {
			orderMapper.orderAdd(orderDto);
			
			orderMapper.orderDetailAdd(map);
			
			cartMapper.orderCartDelete(map);
		} catch (Exception e) {
			throw new OrderFailException("주문 실패했습니다.");
		}
	}

}
