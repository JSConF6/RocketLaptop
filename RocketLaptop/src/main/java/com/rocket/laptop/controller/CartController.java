package com.rocket.laptop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.service.CartService;
import com.rocket.laptop.service.FileService;
import com.rocket.laptop.service.ProductService;

@Controller
public class CartController {
	
	private Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	@PostMapping("/user/cart/add")
	@ResponseBody
	public ResponseDto<String> cartAdd(Model model, CartDto cartDto) {
		logger.info("장바구니 담기");
		System.out.println(cartDto);
		CartDto cart = cartService.findByProductCode(cartDto.getProduct_code());
		
		if(cart != null) {
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "이미 담긴 상품입니다.");
		}
		
		int result = cartService.cartAdd(cartDto);
		
		if(result != 1) {	
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "장바구니 담기 실패");
		}
		
		return new ResponseDto<String>(HttpStatus.OK.value(), "장바구니 담기 성공");
	}
	
	@GetMapping("/user/cart/list")
	public String cartList(@RequestParam("user_id") String user_id, Model model) {
		logger.info("장바구니 리스트");
		
		List<CartDto> cartList = cartService.getCartList(user_id);
		int cartListCount = cartService.getCartListcount(user_id);
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("cartListCount", cartListCount);
		
		return "/user/cartListView";
	}
	
	@GetMapping("/user/cartListCount")
	@ResponseBody
	public int cartListCount(@RequestParam("user_id") String user_id) {
		logger.info("장바구니 리스트 갯수");
		
		int cartListCount = cartService.getCartListcount(user_id);
		
		return cartListCount;
	}
	
	@PostMapping("/user/cart/delete")
	@ResponseBody
	public ResponseDto<String> cartDelete(CartDto cartDto) {
		logger.info("장바구니 삭제");
		
		int result = cartService.cartDelete(cartDto);
		
		if(result != 1) {
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "장바구니 삭제 실패");
		}
		
		return new ResponseDto<String>(HttpStatus.OK.value(), "장바구니 삭제 성공");
	}
	
	@PostMapping("/user/cart/allDelete")
	@ResponseBody
	public ResponseDto<String> allDelete(@RequestParam("user_id") String user_id, @RequestParam("cartNumList") int[] cartNumList) {
		logger.info("장바구니 전체 삭제");
		
		int result = cartService.cartAllDelete(user_id, cartNumList);
		
		if(result != cartNumList.length) {
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "장바구니 전체 삭제 실패");
		}
		
		return new ResponseDto<String>(HttpStatus.OK.value(), "장바구니 전체 삭제 성공");
	}
}
