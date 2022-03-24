package com.rocket.laptop.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.OrderDetailDto;
import com.rocket.laptop.model.OrderDto;

@Mapper
@Repository
public interface OrderMapper {

	int getOrderListCount();

	List<OrderDto> getOrderList(Map<String, Object> map);

	OrderDto getOrder(String order_id);

	List<OrderDetailDto> getOrderDetail(String order_id);

	int OrderDeliveryUpdate(Map<String, Object> map);

}
