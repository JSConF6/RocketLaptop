package com.rocket.laptop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
	private final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	@GetMapping("/admin")
	public String adminView(String pageName, Model model) {
		logger.info("관리자 페이지로 이동");
		model.addAttribute("pageName", pageName);
		
		return "/admin/adminView";
	}
	
	@GetMapping("/admin/noticeList")
	public String adminNoticeView(String pageName, Model model) {
		logger.info("공지사항 관리 페이지로 이동");
		model.addAttribute("pageName", pageName);
		
		return "/admin/adminNoticeListView";
	}
	
	@GetMapping("/admin/questionList")
	public String adminQuestionView(String pageName, Model model) {
		logger.info("문의사항 관리 페이지로 이동");
		model.addAttribute("pageName", pageName);
		
		return "/admin/adminQuestionListView";
	}
	
	@GetMapping("/admin/orderList")
	public String adminOrderView(String pageName, Model model) {
		logger.info("주문관리 페이지로 이동");
		model.addAttribute("pageName", pageName);
		
		return "/admin/adminOrderListView";
	}
	
	@GetMapping("/admin/productList")
	public String adminProductView(String pageName, Model model) {
		logger.info("상품관리 페이지로 이동");
		model.addAttribute("pageName", pageName);
		
		return "/admin/adminProductListView";
	}
	
	@GetMapping("/admin/userList")
	public String adminUserView(String pageName, Model model) {
		logger.info("유저목록 페이지로 이동");
		model.addAttribute("pageName", pageName);
		
		return "/admin/adminUserListView";
	}
}
