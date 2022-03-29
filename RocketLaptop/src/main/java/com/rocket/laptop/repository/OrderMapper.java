package com.rocket.laptop.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.OrderDetailDto;
import com.rocket.laptop.model.OrderDto;
import com.rocket.laptop.model.OrderViewDto;

@Mapper
@Repository
public interface OrderMapper {

	int getOrderListCount(String user_id);

	List<OrderDto> getOrderList(Map<String, Object> map);

	OrderDto getOrder(String order_id);

	List<OrderDetailDto> getOrderDetail(String order_id);

	int OrderDeliveryUpdate(Map<String, Object> map);

	List<OrderViewDto> getOrderViewList(Map<String, Object> map);

	void orderAdd(OrderDto orderDto);

	void orderDetailAdd(Map<String, Object> map);

	int getAdminOrderListCount();

	List<OrderDto> getAdminOrderList(Map<String, Object> map);

	List<OrderDto> getOrderDtoList(Map<String, Object> map);

	OrderDto getUserOrderDetail(Map<String, Object> map);

	List<OrderViewDto> getMainOrderViewList(String product_code);

}
