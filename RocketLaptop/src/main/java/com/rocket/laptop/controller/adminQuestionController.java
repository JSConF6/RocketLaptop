package com.rocket.laptop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.rocket.laptop.service.QuestionService;

@Controller
public class adminQuestionController {
	
	private final Logger logger = LoggerFactory.getLogger(adminQuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	@GetMapping("/admin/questionList")
	public String adminQuestionView(Model model, @RequestParam(value="page", defaultValue = "1", required = false) int page) {
		logger.info("문의사항 관리 페이지로 이동");
		
		int limit = 10;
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
		
		return "/admin/adminQuestionListView";
	}
	
	@GetMapping("/admin/questionDetail")
	public String adminQuestionDetailView(@RequestParam(value="num") int num, Model model) {
		logger.info("문의사항 상세 페이지로 이동");
		
		QuestionDto questionDto = questionService.getQuestionDetail(num);
		CommentDto commentDto = questionService.getComment(num);
		
		model.addAttribute("questionDto", questionDto);
		model.addAttribute("commentDto", commentDto);
		
		return "/admin/adminQuestionDetailView";
	}	
	
	@PostMapping("/admin/questionDelete")
	@ResponseBody
	public int adminQuestionDelete(@RequestParam(value="num") int num, Model model) {
		logger.info("문의사항 삭제 처리");
		
		int result = questionService.questionDelete(num);
		
		return result;
	}
	
	@PostMapping("/admin/commentAdd")
	@ResponseBody
	public int commentAdd(@RequestParam("num") int num, @RequestParam("comment_content") String comment_content) {
		logger.info("답글 등록");

		int result = questionService.commentAdd(num, comment_content);
		questionService.updateQnaCommentYN(num);
		
		return result;
	}
}
