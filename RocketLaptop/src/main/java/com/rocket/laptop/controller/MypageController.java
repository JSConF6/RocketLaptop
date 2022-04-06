package com.rocket.laptop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.rocket.laptop.model.AddressDto;
import com.rocket.laptop.model.CategoryDto;
import com.rocket.laptop.model.CommentDto;
import com.rocket.laptop.model.FileDto;
import com.rocket.laptop.model.OrderDetailDto;
import com.rocket.laptop.model.OrderDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.PasswordDto;
import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.model.QuestionDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.service.AddressService;
import com.rocket.laptop.service.CategoryService;
import com.rocket.laptop.service.OrderService;
import com.rocket.laptop.service.ProductService;
import com.rocket.laptop.service.QuestionService;
import com.rocket.laptop.service.UserService;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private QuestionService questionService;
	
	@GetMapping("/user/mypage")
	public String myPage(@RequestParam("user_id") String user_id, Model model) {
		logger.info("마이페이지로 이동");
		
		UserDto userDto = userService.getUser(user_id);
		
		model.addAttribute(userDto);
		
		return "/user/myPageView";
	}
	
	@GetMapping("/user/mypage/activity/list")
	public String myWriteListView(@RequestParam("user_id") String user_id, Model model) {
		logger.info("나의활동 목록으로 이동");
		
		return "/user/myActivityView";
	}
	
	@GetMapping("/user/mypage/userInfo")
	public String userInfo(@RequestParam("user_id") String user_id, Model model) {
		logger.info("내정보 view로 이동");
		
		UserDto userDto = userService.getUser(user_id);
		
		model.addAttribute(userDto);
		
		return "/user/userInfoView";
	}
	
	@GetMapping("/user/mypage/order/list")
	public String orderListView(@RequestParam(value="page", defaultValue = "1", required = false) int page,
			@RequestParam("user_id") String user_id, Model model) {
		logger.info("유저 주문목록 리스트");
		
		int limit = 10;
		logger.info("limit : " + limit);
		
		int listCount = orderService.getOrderListCount(user_id);
		logger.info("총 주문 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<OrderDto> orderList = orderService.getOrderList(user_id, pageHandler);
		logger.info("주문 리스트 갯수 : " + orderList);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageHandler", pageHandler);
		
		return "/user/orderListView";
	}
	
	@PostMapping("/user/mypage/userUpdate")
	@ResponseBody
	public ResponseDto<String> userUpdate(UserDto userDto){
		logger.info("회원 정보 수정");
		
		int result = userService.userUpdate(userDto);
		
		if(result != 1) {
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "회원 수정 실패");
		}
		
		return new ResponseDto<String>(HttpStatus.OK.value(), "회원 수정이 성공"); 
	}
	
	@PostMapping("/user/mypage/updatePassword")
	@ResponseBody
	public ResponseDto<Integer> updatePassword(@RequestParam("user_id") String user_id, PasswordDto passwordDto){
		logger.info("비밀번호 변경");
		
		UserDto userDto = userService.getUser(user_id);
		
		int result = userService.updatePassword(userDto, passwordDto);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result); 
	}
	
	@PostMapping("/user/mypage/userDelete")
	@ResponseBody
	public ResponseDto<Integer> userDelete(@RequestParam("user_id") String user_id, PasswordDto passwordDto){
		logger.info("회원탈퇴");
		
		UserDto userDto = userService.getUser(user_id);
		
		int result = userService.userDelete(userDto, passwordDto);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
	
	@GetMapping("/user/mypage/order/detail")
	public String userOrderDetail(@RequestParam("user_id") String user_id, @RequestParam("order_id") String order_id, Model model) {
		logger.info("주문 상세 페이지로 이동");
		
		OrderDto orderDto = orderService.getUserOrderDetail(order_id, user_id);
		List<OrderDetailDto> orderDetailList = orderService.getOrderDetail(order_id);
		
		int y = 0;
		
		for(OrderDetailDto orderDetail: orderDetailList) {
			if(orderDetail.getReview_yn().equals("Y")) {
				y++;
			}
		}
		
		if(y != orderDetailList.size()) {
			model.addAttribute("reviewBtn", true);
		}
		
		model.addAttribute("orderDto", orderDto);
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "/user/orderDetailView";
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
	
	@PostMapping("/user/mypage/question/add")
	@ResponseBody
	public ResponseDto<String> myQuestionAdd(QuestionDto questionDto) {
		logger.info("문의사항 등록");

		int result = questionService.questionAdd(questionDto);
		
		if(result != 1) {
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "문의사항 등록 실패");
		}
		
		return new ResponseDto<String>(HttpStatus.OK.value(), "문의사항 등록 완료");
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
	
	@PostMapping("/user/mypage/question/list/ajax")
	@ResponseBody
	public Map<String, Object> myQuestionAjaxView(@RequestParam(value="page", defaultValue = "1", required = false) int page,
				@RequestParam("comment_state") int comment_state, @RequestParam("user_id") String user_id) {
		logger.info("문의사항 리스트 ajax 처리");
		
		String[] commentStateList = {"전체", "답변대기", "답변완료"};
		
		String commentState = commentStateList[comment_state];
		
		int limit = 6;
		logger.info("limit : " + limit);
		
		int listCount = questionService.getAjaxUserQuestionListCount(user_id, commentState);
		logger.info("총 문의사항 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<QuestionDto> questionList = questionService.getAjaxUserQuestionList(user_id, commentState, pageHandler);
		logger.info("문의사항 리스트 갯수 : " + questionList);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pageHandler", pageHandler);
		map.put("questionList", questionList);
		map.put("comment_state", comment_state);
		
		return map;
	}
}
