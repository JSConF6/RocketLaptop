package com.rocket.laptop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rocket.laptop.model.FileDto;
import com.rocket.laptop.model.OrderDetailDto;
import com.rocket.laptop.model.OrderDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.service.OrderService;

@Controller
public class adminOrderController {
	
	private Logger logger = LoggerFactory.getLogger(adminOrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/admin/orderList")
	public String adminOrderListView(Model model, @RequestParam(value="page", defaultValue = "1", required = false) int page) {
		logger.info("주문목록 페이지로 이동");

		int limit = 10;
		logger.info("limit : " + limit);
		
		int listCount = orderService.getOrderListCount();
		logger.info("총 주문 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<OrderDto> orderList = orderService.getOrderList(pageHandler);
		logger.info("주문 리스트 갯수 : " + orderList);
		
		model.addAttribute("pageHandler", pageHandler);
		model.addAttribute("orderList", orderList);
		
		return "/admin/adminOrderListView";
	}
	
	@GetMapping("/admin/orderDetail")
	public String adminOrderDetail(@RequestParam(value="order_id") String order_id, Model model) {
		logger.info("주문 상세정보 페이지 이동");
		
		OrderDto orderDto = orderService.getOrder(order_id);
		List<OrderDetailDto> orderDetailList = orderService.getOrderDetail(order_id);
		
		model.addAttribute("orderDto", orderDto);
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "/admin/adminOrderDetailView";
	}
	
	@PostMapping("/admin/orderDeliveryUpdate")
	@ResponseBody
	public int adminOrderDeliveryUpdate(@RequestParam("order_id") String order_id, @RequestParam("delivery_text") String delivery_text) {
		logger.info("배송 상태 변경");
		
		return orderService.OrderDeliveryUpdate(order_id, delivery_text);
	}
	
}
