package com.rocket.laptop.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rocket.laptop.config.auth.PrincipalDetails;
import com.rocket.laptop.model.CategoryDto;
import com.rocket.laptop.model.OrderDetailDto;
import com.rocket.laptop.model.OrderDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.PasswordDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.service.CategoryService;
import com.rocket.laptop.service.OrderService;
import com.rocket.laptop.service.ProductService;
import com.rocket.laptop.service.UserService;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/user/mypage/userInfo")
	public String userInfo(@RequestParam("user_id") String user_id, Model model) {
		logger.info("내정보 view로 이동");
		
		UserDto userDto = userService.getUser(user_id);
		
		model.addAttribute(userDto);
		
		return "/user/userInfoView";
	}
	
	@GetMapping("/user/mypage/orderList")
	public String orderListView(@RequestParam(value="page", defaultValue = "1", required = false) int page,
			@RequestParam("user_id") String user_id, Model model) {
		logger.info("유저 주문목록 리스트");
		
		int limit = 10;
		logger.info("limit : " + limit);
		
		int listCount = orderService.getOrderListCount(user_id);
		logger.info("총 주문 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<OrderDto> orderList = orderService.getOrderList(user_id, pageHandler);
		logger.info("주문 리스트 갯수 : " + orderList);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageHandler", pageHandler);
		
		return "/user/orderListView";
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
	
	@GetMapping("/user/mypage/orderDetail")
	public String userOrderList(@RequestParam("user_id") String user_id, @RequestParam("order_id") String order_id, Model model) {
		logger.info("주문 상세 페이지로 이동");
		
		OrderDto orderDto = orderService.getUserOrderDetail(order_id, user_id);
		List<OrderDetailDto> orderDetailList = orderService.getOrderDetail(order_id);
		
		model.addAttribute("orderDto", orderDto);
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "/user/orderDetailView";
	}
}
