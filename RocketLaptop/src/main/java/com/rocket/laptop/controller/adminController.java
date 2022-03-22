package com.rocket.laptop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rocket.laptop.model.CategoryDto;
import com.rocket.laptop.model.FileDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.service.CategoryService;
import com.rocket.laptop.service.FileService;
import com.rocket.laptop.service.ProductService;

@Controller
public class adminController {
	
	private final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	@Value("${savefoldername}")
	private String saveFolder;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private FileService fileService;
	
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
	
	@GetMapping("/admin/userList")
	public String adminUserView(String pageName, Model model) {
		logger.info("유저목록 페이지로 이동");
		model.addAttribute("pageName", pageName);
		
		return "/admin/adminUserListView";
	}
	
	
}
