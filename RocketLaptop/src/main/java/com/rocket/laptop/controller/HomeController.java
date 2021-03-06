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
import com.rocket.laptop.model.NoticeDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.service.CategoryService;
import com.rocket.laptop.service.MailService;
import com.rocket.laptop.service.NoticeService;
import com.rocket.laptop.service.ProductService;
import com.rocket.laptop.service.UserService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/")
	public String home(Model model) {
		logger.info("????????? ??????");
		
		List<CategoryDto> categoryList = categoryService.getAllCategory();
		
		int productListCount = productService.getProductListCount();
		
		PageHandler pageHandler = new PageHandler(1, productListCount, 9);
		List<ProductListDto> newProductList = productService.getNewProductList(pageHandler);
		List<ProductListDto> bestProductList = productService.getBestProductList(pageHandler);
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("newProductList", newProductList);
		model.addAttribute("bestProductList", bestProductList);
		
		return "index";
	}
	
	@GetMapping("/MainCategoryList")
	@ResponseBody
	public List<CategoryDto> MainCategoryList(){
		List<CategoryDto> categoryList = categoryService.getAllCategory();
		
		return categoryList;
	}
	
	@GetMapping("/login")
	public String login(Model model,
			@CookieValue(value="saveId", required = false) Cookie readCookie,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		logger.info("????????? view??? ??????");
		
		if(principalDetails != null) {
			return "redirect:/";
		}
		
		if(readCookie != null) {
			model.addAttribute("saveId", readCookie.getValue());
			logger.info("Cookie Time : " + readCookie.getMaxAge());
		}
		
		return "/home/loginView";
	}
	
	@GetMapping("/loginFail")
	public String loginFail(HttpServletRequest request) {
		logger.info("????????? view??? ??????");
		
		request.setAttribute("result", "fail");
		
		return "/home/loginView";
	}
	
	@GetMapping("/register")
	public String register() {
		logger.info("???????????? view??? ??????");
		
		return "/home/registerView";
	}
	
	@PostMapping("/registerProcess")
	public String registerProcess(UserDto userDto, RedirectAttributes rattr, Model model, 
			HttpServletRequest request) throws Exception {
		logger.info("???????????? ??????");
		
		int result = userService.register(userDto);
		
		if(result == 1) {
			rattr.addFlashAttribute("result", "registerSuccess");
			return "redirect:login";
		}else {
			model.addAttribute("result", "fail");
			return "redirect:register";
		}
	}
	
	@ResponseBody
	@GetMapping("/register/idcheck")
	public int idCheck(@RequestParam("id") String id) {
		return userService.isId(id);
	}
	
	@GetMapping("/findIdPasswordView")
	public String findIdPasswordView() {
		logger.info("????????? ???????????? ?????? view??? ??????");
		
		return "/home/findIdPasswordView";
	}
	
	@PostMapping("/findIdProcess")
	@ResponseBody
	public ResponseDto<String> findIdProcess(UserDto userDto) throws Exception{
			logger.info("????????? ??????");
			UserDto findUser = userService.findByUsernameAndEmail(userDto);
			
			if(findUser == null) {
				return new ResponseDto<String>(HttpStatus.UNAUTHORIZED.value(), "???????????? ????????? ????????? ????????????.");
			}
			
			return new ResponseDto<String>(HttpStatus.OK.value(), findUser.getUser_id());
	}
	
	@PostMapping("/findPasswordProcess")
	@ResponseBody
	public ResponseDto<String> findPasswordProcess(UserDto userDto) throws Exception{
			logger.info("???????????? ??????");
			UserDto findUser = userService.findByIdAndUsernameAndEmail(userDto);
			
			if(findUser == null) {
				return new ResponseDto<String>(HttpStatus.UNAUTHORIZED.value(), "???????????? ????????? ????????? ????????????.");
			}
			
			try {
				mailService.sendMailPassword(userDto);
			} catch (Exception e) {
				return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "?????? ?????? ?????? ?????? ?????? ????????????.");
			}
		
		return new ResponseDto<String>(HttpStatus.OK.value(), "????????? ????????? ????????????????????? ???????????????.");
	}
	
	@GetMapping("/notice/list")
	public String noticeView(@RequestParam(value="page", defaultValue = "1", required = false) int page, Model model) {
		logger.info("???????????? ???????????? ??????");
		
		int limit = 5;
		logger.info("limit : " + limit);
		
		int listCount = noticeService.getNoticeListCount();
		logger.info("??? ???????????? ?????? : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<NoticeDto> noticeList = noticeService.getNoticeList(pageHandler);
		logger.info("???????????? ????????? ?????? : " + noticeList);
		
		model.addAttribute("pageHandler", pageHandler);
		model.addAttribute("noticeList", noticeList);
		
		return "/home/noticeListView";
	}
	
	@GetMapping("/notice/detail")
	public String adminNoticeDetailView(@RequestParam(value="num") int num, Model model) {
		logger.info("???????????? ?????? ???????????? ??????");
		
		NoticeDto noticeDto = noticeService.getNoticeDetail(num);
		
		model.addAttribute("noticeDto", noticeDto);
		
		return "/home/noticeDetailView";
	}
}
