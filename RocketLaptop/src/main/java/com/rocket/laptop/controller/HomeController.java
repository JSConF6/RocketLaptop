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
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.model.ResponseDto;
import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.service.CategoryService;
import com.rocket.laptop.service.MailService;
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
	
	@GetMapping("/")
	public String home(Model model) {
		logger.info("홈으로 이동");
		
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
		logger.info("로그인 view로 이동");
		
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
		logger.info("로그인 view로 이동");
		
		request.setAttribute("result", "fail");
		
		return "/home/loginView";
	}
	
	@GetMapping("/register")
	public String register() {
		logger.info("회원가입 view로 이동");
		
		return "/home/registerView";
	}
	
	@PostMapping("/registerProcess")
	public String registerProcess(UserDto userDto, RedirectAttributes rattr, Model model, 
			HttpServletRequest request) throws Exception {
		logger.info("회원가입 시작");
		
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
		logger.info("아이디 비밀번호 찾기 view로 이동");
		
		return "/home/findIdPasswordView";
	}
	
	@PostMapping("/findProcess")
	@ResponseBody
	public ResponseDto<String> findProcess(UserDto userDto, @RequestParam("find") String find) throws Exception{
		
		if(find.equals("findId")) {
			logger.info("아이디 찾기");
			UserDto findUser = userService.findByUsernameAndEmail(userDto);
			
			if(findUser == null) {
				return new ResponseDto<String>(HttpStatus.UNAUTHORIZED.value(), "해당하는 정보의 유저가 없습니다.");
			}
			
			return new ResponseDto<String>(HttpStatus.OK.value(), findUser.getUser_id());
		}else if(find.equals("findPassword")){
			logger.info("비밀번호 찾기");
			UserDto findUser = userService.findByIdAndUsernameAndEmail(userDto);
			
			if(findUser == null) {
				return new ResponseDto<String>(HttpStatus.UNAUTHORIZED.value(), "해당하는 정보의 유저가 없습니다.");
			}
			
			try {
				mailService.sendMailPassword(userDto);
			} catch (Exception e) {
				return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "메일 전송 실패 다시 시도 해주세요.");
			}
		}
		
		return new ResponseDto<String>(HttpStatus.OK.value(), "가입한 메일로 임시비밀번호를 보냈습니다.");
	}
	
	@GetMapping("/notice")
	public String notice() {
		logger.info("공지사항 view로 이동");
		
		return "/home/noticeView";
	}
	
	@GetMapping("/question")
	public String question() {
		logger.info("문의사항 view로 이동");
		
		return "/home/questionView";
	}
}
