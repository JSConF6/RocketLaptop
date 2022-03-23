package com.rocket.laptop.controller;

import java.util.List;

import org.slf4j.ILoggerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rocket.laptop.model.CommentDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.QuestionDto;
import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.service.UserService;

@Controller
public class adminUserController {
	
	private Logger logger = LoggerFactory.getLogger(adminUserController.class);
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/admin/userList")
	public String adminUserList(Model model, @RequestParam(value="page", defaultValue = "1", required = false) int page) {
		logger.info("유저목록 페이지로 이동");
		
		int limit = 10;
		logger.info("limit : " + limit);
		
		int listCount = userService.getUserListCount();
		logger.info("총 유저수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<UserDto> userList = userService.getUserList(pageHandler);
		logger.info("유저 리스트 갯수 : " + userList);
		
		model.addAttribute("pageHandler", pageHandler);
		model.addAttribute("userList", userList);
		
		return "/admin/adminUserListView";
	}
	
	@GetMapping("/admin/userDetail")
	public String adminUserDetailView(@RequestParam(value="user_id") String user_id, Model model) {
		logger.info("공지사항 상세 페이지로 이동");
		
		UserDto userDto = userService.getUser(user_id);
		
		model.addAttribute("userDto", userDto);
		
		return "/admin/adminUserDetailView";
	}	
}
