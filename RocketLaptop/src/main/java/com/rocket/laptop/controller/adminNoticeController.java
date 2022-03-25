package com.rocket.laptop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rocket.laptop.model.NoticeDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.service.NoticeService;

@Controller
public class adminNoticeController {
	
	private final Logger logger = LoggerFactory.getLogger(adminNoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/admin/noticeList")
	public String adminNoticeView(@RequestParam(value="page", defaultValue = "1", required = false) int page, Model model) {
		logger.info("공지사항 관리 페이지로 이동");
		
		int limit = 10;
		logger.info("limit : " + limit);
		
		int listCount = noticeService.getNoticeListCount();
		logger.info("총 공지사항 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<NoticeDto> noticeList = noticeService.getNoticeList(pageHandler);
		logger.info("공지사항 리스트 갯수 : " + noticeList);
		
		model.addAttribute("pageHandler", pageHandler);
		model.addAttribute("noticeList", noticeList);
		
		return "/admin/adminNoticeListView";
	}
	
	@PostMapping("/admin/noticeAdd")
	public String noticeAdd(NoticeDto noticeDto, Model model) {
		logger.info("공지사항 등록");

		int result = noticeService.noticeAdd(noticeDto);
		
		model.addAttribute("result", "등록성공");
		return "redirect:/admin/noticeList";
	}
	
	@GetMapping("/admin/noticeDetail")
	public String adminNoticeDetailView(@RequestParam(value="num") int num, Model model) {
		logger.info("공지사항 상세 페이지로 이동");
		
		NoticeDto noticeDto = noticeService.getNoticeDetail(num);
		
		model.addAttribute("noticeDto", noticeDto);
		
		return "/admin/adminNoticeDetailView";
	}
	
	@GetMapping("/admin/noticeModifyView")
	public String adminNoticeModifyView(@RequestParam(value="num") int num, Model model) {
		logger.info("공지사항 상세 페이지로 이동");
		
		NoticeDto noticeDto = noticeService.getNoticeDetail(num);
		
		model.addAttribute("noticeDto", noticeDto);
		
		return "/admin/adminNoticeModifyView";
	}
	
	@PostMapping("/admin/noticeModify")
	public ResponseDto<String> adminNoticeModify(NoticeDto noticeDto, Model model) {
		logger.info("공지사항 상세 페이지로 이동");
		
		int result = noticeService.noticeModify(noticeDto);
		
		if(result != 1) {
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "공지사항 수정 실패");
		}
		
		return new ResponseDto<String> (HttpStatus.OK.value(), "공지사항 수정 성공");
	}
	
	@PostMapping("/admin/noticeDelete")
	@ResponseBody
	public int adminNoticeDelete(@RequestParam(value="num") int num, Model model) {
		logger.info("공지사항 삭제 처리");
		
		int result = noticeService.noticeDelete(num);
		
		return result;
	}
}
