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

import com.rocket.laptop.model.CommentDto;
import com.rocket.laptop.model.NoticeDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.QuestionDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.service.QuestionService;

@Controller
public class QuestionController {
	
	private final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	@GetMapping("/question/list")
	public String adminQuestionView(Model model, @RequestParam(value="page", defaultValue = "1", required = false) int page) {
		logger.info("문의사항 페이지로 이동");
		
		int limit = 6;
		logger.info("limit : " + limit);
		
		int listCount = questionService.getQuestionListCount();
		logger.info("총 게시물 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<QuestionDto> questionList = questionService.getQuestionList(pageHandler);
		logger.info("문의사항 리스트 갯수 : " + questionList);
		
		model.addAttribute("pageHandler", pageHandler);
		model.addAttribute("questionList", questionList);
		
		return "/home/questionListView";
	}
	
	@GetMapping("/question/detail")
	public String adminQuestionDetailView(@RequestParam(value="num") int num, Model model) {
		logger.info("문의사항 상세 페이지로 이동");
		
		QuestionDto questionDto = questionService.getQuestionDetail(num);
		CommentDto commentDto = questionService.getComment(num);
		
		model.addAttribute("questionDto", questionDto);
		model.addAttribute("commentDto", commentDto);
		
		return "/home/questionDetailView";
	}
	
	@PostMapping("/question/list/ajax")
	@ResponseBody
	public Map<String, Object> adminQuestionView(@RequestParam(value="page", defaultValue = "1", required = false) int page,
				@RequestParam("comment_state") int comment_state) {
		logger.info("문의사항 리스트 ajax 처리");
		
		String[] commentStateList = {"전체", "답변대기", "답변완료"};
		
		String commentState = commentStateList[comment_state];
		
		int limit = 6;
		logger.info("limit : " + limit);
		
		int listCount = questionService.getAjaxQuestionListCount(commentState);
		logger.info("총 문의사항 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<QuestionDto> questionList = questionService.getAjaxQuestionList(commentState, pageHandler);
		logger.info("문의사항 리스트 갯수 : " + questionList);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pageHandler", pageHandler);
		map.put("questionList", questionList);
		map.put("comment_state", comment_state);
		
		return map;
	}
}
