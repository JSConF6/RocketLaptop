package com.rocket.laptop.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.rocket.laptop.model.UserDto;
import com.rocket.laptop.service.CategoryService;
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
	
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv,
			@CookieValue(value="saveId", required = false) Cookie readCookie,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		logger.info("로그인 view로 이동");
		
		if(principalDetails != null) {
			mv.addObject("duplicate", "duplicateLogin");
			mv.setViewName("/duplicateLogin");
			return mv;
		}
		
		if(readCookie != null) {
			mv.addObject("saveId", readCookie.getValue());
			logger.info("Cookie Time : " + readCookie.getMaxAge());
		}
		
		mv.setViewName("/home/loginView");
		return mv;
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
			return "refirect:register";
		}
	}
	
	@ResponseBody
	@GetMapping("/register/idcheck")
	public int idCheck(@RequestParam("id") String id) {
		return userService.isId(id);
	}
	
	@GetMapping("/accessDenied")
	public String accessDenied() {
		logger.info("권한 없이 페이지 접속");
		
		return "/accessDeniedView";
	}
	
	@GetMapping("/cart")
	public String cart() {
		logger.info("장바구니 view로 이동");
		
		return "/user/cartView";
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
	
	@GetMapping("/mypage")
	public String mypage() {
		logger.info("마이페이지 view로 이동");
		
		return "/user/mypageView";
	}
}
