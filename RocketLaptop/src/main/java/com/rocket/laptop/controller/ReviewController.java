package com.rocket.laptop.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rocket.laptop.config.auth.PrincipalDetails;
import com.rocket.laptop.model.CategoryDto;
import com.rocket.laptop.model.FileDto;
import com.rocket.laptop.model.NoticeDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.model.ReviewDto;
import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.service.CategoryService;
import com.rocket.laptop.service.MailService;
import com.rocket.laptop.service.NoticeService;
import com.rocket.laptop.service.ProductService;
import com.rocket.laptop.service.ReviewService;
import com.rocket.laptop.service.UserService;

@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping("/user/product/reviewAdd")
	@ResponseBody
	public ResponseDto<String> reviewAdd(ReviewDto reviewDto, @RequestParam("order_id") String order_id) {
		logger.info("상품 리뷰 등록");
		
		int result = reviewService.reviewAdd(reviewDto, order_id);
		
		if(result != 1) {
			return new ResponseDto<String> (HttpStatus.BAD_REQUEST.value(), "상품 리뷰 등록 실패");
		}
		
		return new ResponseDto<String> (HttpStatus.OK.value(), "상품 리뷰 등록 완료");
	}
	
	@GetMapping("/product/reviewList")
	@ResponseBody
	public ResponseDto<Map<String, Object>> reviewList(@RequestParam("product_code") String product_code,
			@RequestParam(value="page", defaultValue = "1", required = false) int page) {
		logger.info("상품 리뷰 리스트");
		
		int limit = 10;
		logger.info("limit : " + limit);
		
		int listCount = reviewService.getReviewListCount(product_code);
		logger.info("총 리뷰 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<ReviewDto> reviewList = reviewService.getReviewList(pageHandler, product_code);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("reviewList", reviewList);
		map.put("pageHandler", pageHandler);
		
		return new ResponseDto<Map<String, Object>> (HttpStatus.OK.value(), map);
	}
}
