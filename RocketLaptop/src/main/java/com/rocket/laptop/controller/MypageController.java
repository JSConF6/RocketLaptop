package com.rocket.laptop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rocket.laptop.model.OrderDetailDto;
import com.rocket.laptop.model.OrderDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.PasswordDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.model.UserOrderDto;
import com.rocket.laptop.service.OrderService;
import com.rocket.laptop.service.UserService;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/user/mypage")
	public String myPage(@RequestParam("user_id") String user_id, Model model) {
		logger.info("마이페이지로 이동");
		
		int deliveryReadyCount = orderService.getDeliveryCount(user_id, "배송준비");
		int deliveryCount = orderService.getDeliveryCount(user_id, "배송 중");
		int deliveryComCount = orderService.getDeliveryCount(user_id, "배송 완료");
		
		model.addAttribute("deliveryReadyCount", deliveryReadyCount);
		model.addAttribute("deliveryCount", deliveryCount);
		model.addAttribute("deliveryComCount", deliveryComCount);
		
		return "/user/myPageView";
	}
	
	@GetMapping("/user/mypage/activity/list")
	public String myWriteListView(@RequestParam("user_id") String user_id, Model model) {
		logger.info("나의활동 목록으로 이동");
		
		return "/user/myActivityView";
	}
	
	@GetMapping("/user/mypage/userInfo")
	public String userInfo(@RequestParam("user_id") String user_id, Model model) {
		logger.info("내정보 view로 이동");
		
		UserDto userDto = userService.getUser(user_id);
		
		model.addAttribute(userDto);
		
		return "/user/userInfoView";
	}
	
	@PostMapping("/user/mypage/userUpdate")
	@ResponseBody
	public ResponseDto<String> userUpdate(UserDto userDto){
		logger.info("회원 정보 수정");
		
		int result = userService.userUpdate(userDto);
		
		if(result != 1) {
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "회원 수정 실패");
		}
		
		return new ResponseDto<String>(HttpStatus.OK.value(), "회원 수정이 성공"); 
	}
	
	@PostMapping("/user/mypage/updatePassword")
	@ResponseBody
	public ResponseDto<Integer> updatePassword(@RequestParam("user_id") String user_id, PasswordDto passwordDto){
		logger.info("비밀번호 변경");
		
		UserDto userDto = userService.getUser(user_id);
		
		int result = userService.updatePassword(userDto, passwordDto);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result); 
	}
	
	@PostMapping("/user/mypage/userDelete")
	@ResponseBody
	public ResponseDto<Integer> userDelete(@RequestParam("user_id") String user_id, PasswordDto passwordDto){
		logger.info("회원탈퇴");
		
		UserDto userDto = userService.getUser(user_id);
		
		int result = userService.userDelete(userDto, passwordDto);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
	
	@GetMapping("/user/mypage/order/list")
	public String orderListView(@RequestParam(value="page", defaultValue = "1", required = false) int page,
			@RequestParam("user_id") String user_id, Model model) {
		logger.info("유저 주문목록 리스트");
		
		int limit = 3;
		logger.info("limit : " + limit);
		
		int listCount = orderService.getOrderListCount(user_id);
		logger.info("총 주문 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<OrderDto> orderList = orderService.getOrderList(user_id, pageHandler);
		logger.info("주문 리스트 갯수 : " + orderList);
		
		List<UserOrderDto> userOrderList = orderService.getUserOrderList(user_id);
		List<UserOrderDto> userOrderListCount = orderService.getUserOrderListCount(user_id);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("userOrderList", userOrderList);
		model.addAttribute("userOrderListGroupCount", userOrderListCount);
		model.addAttribute("pageHandler", pageHandler);
		
		return "/user/orderListView";
	}
	
	@GetMapping("/user/mypage/order/list/ajax")
	@ResponseBody
	public ResponseDto<Map<String, Object>> orderListView(@RequestParam(value="page", defaultValue = "1", required = false) int page,
			@RequestParam("user_id") String user_id, @RequestParam("order_state") int order_state, Model model) {
		logger.info("유저 주문목록 리스트 ajax");
		
		String[] orderState = new String[] {"전체", "배송준비", "배송 중", "배송 완료"};
		
		
		int limit = 3;
		logger.info("limit : " + limit);
		
		int listCount = orderService.getAjaxOrderListCount(user_id, orderState[order_state]);
		logger.info("총 주문 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<OrderDto> orderList = orderService.getAjaxOrderList(user_id, pageHandler, orderState[order_state]);
		logger.info("주문 리스트 갯수 : " + orderList);
		
		List<UserOrderDto> userOrderList = orderService.getAjaxUserOrderList(user_id, orderState[order_state]);
		List<UserOrderDto> userOrderListCount = orderService.getAjaxUserOrderListCount(user_id, orderState[order_state]);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("orderList", orderList);
		map.put("userOrderList", userOrderList);
		map.put("userOrderListGroupCount", userOrderListCount);
		map.put("pageHandler", pageHandler);
		map.put("order_state", order_state);
		
		return new ResponseDto<Map<String, Object>> (HttpStatus.OK.value(), map);
	}
	
	@GetMapping("/user/mypage/order/detail")
	public String userOrderDetail(@RequestParam("user_id") String user_id, @RequestParam("order_id") String order_id, Model model) {
		logger.info("주문 상세 페이지로 이동");
		
		OrderDto orderDto = orderService.getUserOrderDetail(order_id, user_id);
		List<OrderDetailDto> orderDetailList = orderService.getOrderDetail(order_id);
		
		int y = 0;
		
		for(OrderDetailDto orderDetail: orderDetailList) {
			if(orderDetail.getReview_yn().equals("Y")) {
				y++;
			}
		}
		
		if(y != orderDetailList.size()) {
			model.addAttribute("reviewBtn", true);
		}
		
		model.addAttribute("orderDto", orderDto);
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "/user/orderDetailView";
	}
}
