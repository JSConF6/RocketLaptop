package com.rocket.laptop.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rocket.laptop.model.CartDto;
import com.rocket.laptop.model.FileDto;
import com.rocket.laptop.model.OrderDto;
import com.rocket.laptop.model.OrderViewDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.service.CartService;
import com.rocket.laptop.service.FileService;
import com.rocket.laptop.service.OrderService;
import com.rocket.laptop.service.ProductService;
import com.rocket.laptop.service.UserService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class OrderController {
	
	private final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;
	
	private IamportClient iamportClient;
	
	public OrderController(@Value("${imp_key}") String imp_key, @Value("${imp_secret}") String imp_secret) {
		this.iamportClient = new IamportClient(imp_key, imp_secret);
	}
	
	@PostMapping("/user/order/orderView")
	public String orderView(@RequestParam("cartNumList") int[] cartNumList,
							@RequestParam("user_id") String user_id, 
							Model model) {
		logger.info("주문 페이지 이동");

		List<OrderViewDto> orderViewList = orderService.getOrderViewList(user_id, cartNumList);
		int orderViewListCount = orderViewList.size();
		
		UserDto userDto = userService.getUser(user_id);
		
		model.addAttribute("orderViewList", orderViewList);
		model.addAttribute("orderViewListCount", orderViewListCount);
		model.addAttribute("userDto", userDto);
		
		return "/user/orderView";
	}
	
	@PostMapping("/user/order/mainOrderView")
	public String mainOrderView(@RequestParam("user_id") String user_id, Model model, 
			@RequestParam("order_de_amount") int order_de_amount,
			@RequestParam("product_code") String product_code) {
		logger.info("주문 페이지 이동");
		
		List<OrderViewDto> orderViewList = orderService.getMainOrderViewList(product_code);
		orderViewList.get(0).setOrder_de_amount(order_de_amount);
		int orderViewListCount = orderViewList.size();
		
		UserDto userDto = userService.getUser(user_id);
		
		model.addAttribute("orderViewList", orderViewList);
		model.addAttribute("orderViewListCount", orderViewListCount);
		model.addAttribute("userDto", userDto);
		
		return "/user/orderView";
	}
	
	@PostMapping("/user/order/payment/complete")
	@ResponseBody
	public ResponseDto<String> paymentComplete(OrderDto orderDto, 
			@RequestParam(value = "cartNumList", required = false) int[] cartNumList,
			@RequestParam("order_de_amount") int order_de_amount,
			@RequestParam("productCode") String product_code) throws IamportResponseException, IOException{
		logger.info("상품 결제");
		System.out.println(order_de_amount);
		System.out.println(product_code);
		System.out.println(cartNumList);
		
		Payment payment = iamportClient.paymentByImpUid(orderDto.getImpUid()).getResponse();
		
		if(!orderDto.getOrder_totalprice().equals(payment.getAmount())) {
			CancelData cancelData = new CancelData(orderDto.getImpUid(), true);
			iamportClient.cancelPaymentByImpUid(cancelData);
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "결제 금액 오류, 결제가 취소됩니다.");
		}
		
		if(cartNumList != null) {
			List<CartDto> cartDtoList = cartService.findByCartNumList(cartNumList);
			
			orderService.orderAdd(orderDto, cartDtoList, cartNumList, iamportClient);
		}else {
			orderService.mainOrderAdd(orderDto, product_code, order_de_amount, iamportClient);
		}
		
		return new ResponseDto<String>(HttpStatus.OK.value(), "주문이 완료되었습니다.");
	}
}
