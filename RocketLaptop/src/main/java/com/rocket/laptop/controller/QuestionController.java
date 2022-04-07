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
import com.rocket.laptop.model.ReviewDto;
import com.rocket.laptop.service.QuestionService;

@Controller
public class QuestionController {
	
	private final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	@PostMapping("/user/product/question/add")
	@ResponseBody
	public ResponseDto<String> productQuestionAdd(QuestionDto questionDto) {
		logger.info("문의사항 등록");

		int result = questionService.questionAdd(questionDto);
		
		if(result != 1) {
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "문의사항 등록 실패");
		}
		
		return new ResponseDto<String>(HttpStatus.OK.value(), "문의사항 등록 완료");
	}
	
	@GetMapping("/product/question/list")
	@ResponseBody
	public ResponseDto<Map<String, Object>> reviewList(@RequestParam("product_code") String product_code,
			@RequestParam(value="page", defaultValue = "1", required = false) int page) {
		logger.info("상품 문의사항 리스트");
		
		int limit = 10;
		logger.info("limit : " + limit);
		
		int listCount = questionService.getProductQuestionListCount(product_code);
		logger.info("총 문의사항 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<QuestionDto> questionList = questionService.getProductQuestionList(pageHandler, product_code);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("questionList", questionList);
		map.put("pageHandler", pageHandler);
		
		return new ResponseDto<Map<String, Object>> (HttpStatus.OK.value(), map);
	}
	
	@GetMapping("/product/question/detail")
	@ResponseBody
	public ResponseDto<QuestionDto> productQuestionDetail(@RequestParam(value="num") int num) {
		logger.info("상품문의 답변");
		
		QuestionDto questionDto = questionService.getProductQuestionDetail(num);
		
		return new ResponseDto<QuestionDto> (HttpStatus.OK.value(), questionDto);
	}
	
	@GetMapping("/user/mypage/question/list")
	@ResponseBody
	public ResponseDto<Map<String, Object>> myQuestionView(@RequestParam("user_id") String user_id, Model model, 
			@RequestParam(value="page", defaultValue = "1", required = false) int page) {
		logger.info("내 문의사항 페이지로 이동");
		
		int limit = 6;
		logger.info("limit : " + limit);
		
		int listCount = questionService.getUserQuestionListCount(user_id);
		logger.info("총 문의사항 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<QuestionDto> questionList = questionService.getUserQuestionList(user_id, pageHandler);
		logger.info("내 문의사항 리스트 갯수 : " + questionList);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pageHandler", pageHandler);
		map.put("questionList", questionList);
		
		return new ResponseDto<Map<String, Object>> (HttpStatus.OK.value(), map);
	}
	
	@GetMapping("/user/mypage/question/detail")
	public String myQuestionDetailView(@RequestParam("user_id") String user_id, @RequestParam(value="num") int num, Model model) {
		logger.info("내 문의사항 상세 페이지로 이동");
		
		QuestionDto questionDto = questionService.getUserQuestionDetail(num, user_id);
		CommentDto commentDto = questionService.getComment(num);
		
		model.addAttribute("questionDto", questionDto);
		model.addAttribute("commentDto", commentDto);
		
		return "/user/myQuestionDetailView";
	}
	
	@PostMapping("/user/mypage/question/delete")
	@ResponseBody
	public int myQuestionDelete(@RequestParam(value="num") int num, Model model) {
		logger.info("문의사항 삭제 처리");
		
		int result = questionService.questionDelete(num);
		
		return result;
	}
}
