package com.rocket.laptop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.service.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String home(Model model) {
		System.out.println("홈으로 이동");
		
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		System.out.println("로그인 view로 이동");
		
		return "/home/loginView";
	}
	
	@GetMapping("/register")
	public String register() {
		System.out.println("회원가입 view로 이동");
		
		return "/home/registerView";
	}
	
	@GetMapping("/cart")
	public String cart() {
		System.out.println("장바구니 view로 이동");
		
		return "/user/cartView";
	}
	
	@GetMapping("/productDetail")
	public String productDetail() {
		System.out.println("상품 상세설명 view로 이동");
		
		return "/product/productDetailView";
	}
	
	@GetMapping("/productList")
	public String productList() {
		System.out.println("상품 리스트 view로 이동");
		
		return "/product/productListView";
	}
	
	@GetMapping("/notice")
	public String notice() {
		System.out.println("공지사항 view로 이동");
		
		return "/home/noticeView";
	}
	
	@GetMapping("/question")
	public String question() {
		System.out.println("문의사항 view로 이동");
		
		return "/home/questionView";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		System.out.println("마이페이지 view로 이동");
		
		return "/user/mypageView";
	}
}
