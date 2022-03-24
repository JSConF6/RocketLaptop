package com.rocket.laptop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rocket.laptop.model.CategoryDto;
import com.rocket.laptop.model.FileDto;
import com.rocket.laptop.model.NoticeDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.model.QuestionDto;
import com.rocket.laptop.service.CategoryService;
import com.rocket.laptop.service.FileService;
import com.rocket.laptop.service.NoticeService;
import com.rocket.laptop.service.OrderService;
import com.rocket.laptop.service.ProductService;
import com.rocket.laptop.service.QuestionService;
import com.rocket.laptop.service.UserService;

@Controller
public class adminController {
	
	private final Logger logger = LoggerFactory.getLogger(adminController.class);

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private QuestionService questionService;
	
	@GetMapping("/admin")
	public String adminView(Model model) {
		logger.info("관리자 페이지로 이동");
		
		int noticeListCount = noticeService.getNoticeListCount();
		int productListCount = productService.getProductListCount();
		int userListCount = userService.getUserListCount();
		int orderListCount = orderService.getOrderListCount();
		int questionListCount = questionService.getQuestionListCount();
		
		PageHandler questionPageHandler = new PageHandler(1, questionListCount, 5);
		List<QuestionDto> questionList = questionService.getQuestionList(questionPageHandler);
		
		PageHandler noticePageHandler = new PageHandler(1, noticeListCount, 5);
		List<NoticeDto> noticeList = noticeService.getNoticeList(noticePageHandler);
		
		model.addAttribute("noticeListCount", noticeListCount);
		model.addAttribute("productListCount", productListCount);
		model.addAttribute("userListCount", userListCount);
		model.addAttribute("orderListCount", orderListCount);
		
		model.addAttribute("questionPageHandler", questionPageHandler);
		model.addAttribute("questionList", questionList);
		
		model.addAttribute("noticePageHandler", noticePageHandler);
		model.addAttribute("noticeList", noticeList);
		
		return "/admin/adminView";
	}
	
	@GetMapping("/admin/updateListCount")
	@ResponseBody
	public Map<String, Object> updateListCount(@RequestParam("type") String type) {
		int listCount = 0;
		String updateClass = "";
		
		switch (type) {
		case "notice":
			listCount = noticeService.getNoticeListCount();
			updateClass = "noticeListCount";
			break;
			
		case "product":
			listCount = productService.getProductListCount();
			updateClass = "productListCount";
			break;
			
		case "user":
			listCount = userService.getUserListCount();
			updateClass = "userListCount";
			break;
			
		case "order":
			listCount = orderService.getOrderListCount();
			updateClass = "orderListCount";
			break;
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("updateClass", updateClass);
		map.put("listCount", listCount);
		
		return map;
	}
	
}
