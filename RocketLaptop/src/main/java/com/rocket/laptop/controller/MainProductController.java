package com.rocket.laptop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rocket.laptop.model.FileDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.service.FileService;
import com.rocket.laptop.service.ProductService;

@Controller
@RequestMapping("/product")
public class MainProductController {
	
	private final Logger logger = LoggerFactory.getLogger(MainProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private FileService fileService;
	
	@GetMapping("/bestProductList")
	public String bestProduct(Model model, @RequestParam(value="page", defaultValue = "1", required = false) int page) {
		logger.info("베스트 상품 view로 이동");
		
		int limit = 8;
		logger.info("limit : " + limit);
		
		int listCount = productService.getProductListCount();
		logger.info("총 상품 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<ProductListDto> bestProductList = productService.getBestProductList(pageHandler);
		logger.info("베스트 상품 리스트 갯수 : " + bestProductList);
		
		model.addAttribute("pageHandler", pageHandler);
		model.addAttribute("bestProductList", bestProductList);
		
		return "/product/bestProductListView";
	}
	
	@GetMapping("/newProductList")
	public String newProduct(Model model, @RequestParam(value="page", defaultValue = "1", required = false) int page) {
		logger.info("새로운 상품 view로 이동");
		
		int limit = 8;
		logger.info("limit : " + limit);
		
		int listCount = productService.getProductListCount();
		logger.info("총 상품 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<ProductListDto> newProductList = productService.getProductList(pageHandler);
		logger.info("새로운 상품 리스트 갯수 : " + newProductList);
		
		model.addAttribute("pageHandler", pageHandler);
		model.addAttribute("newProductList", newProductList);
		
		return "/product/newProductListView";
	}
	
	@GetMapping("/detail")
	public String productDetail(@RequestParam(value="product_code") String product_code, Model model) {
		logger.info("상품 상세정보 페이지 이동");
		
		ProductDetailDto productDetailDto = productService.getProductDetail(product_code);
		List<FileDto> fileList = fileService.getProductDetailFile(product_code);
		
		model.addAttribute("productDetail", productDetailDto);
		model.addAttribute("fileList", fileList);
		
		return "/product/productDetailView";
	}
}
