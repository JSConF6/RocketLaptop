package com.rocket.laptop.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rocket.laptop.model.CategoryDto;
import com.rocket.laptop.model.FileDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.service.CategoryService;
import com.rocket.laptop.service.FileService;
import com.rocket.laptop.service.ProductService;

@Controller
public class adminProductController {
	
	private final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	@Value("${savefoldername}")
	private String saveFolder;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private FileService fileService;
	
	@GetMapping("/admin/productList")
	public String adminProductView(String pageName, Model model, @RequestParam(value="page", defaultValue = "1", required = false) int page) {
		logger.info("상품관리 페이지로 이동");

		int limit = 4;
		logger.info("limit : " + limit);
		
		int listCount = productService.getProductListCount();
		logger.info("총 게시물 갯수 : " + listCount);
		
		PageHandler pageHandler = new PageHandler(page, listCount, limit);
		
		if(pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}
		
		List<ProductListDto> productList = productService.getProductList(pageHandler);
		logger.info("상품 리스트 갯수 : " + productList);
		
		model.addAttribute("pageName", pageName);
		model.addAttribute("pageHandler", pageHandler);
		model.addAttribute("productList", productList);
		
		return "/admin/adminProductListView";
	}
	
	@GetMapping("/admin/productDetail")
	public String adminProductDetail(@RequestParam(value="product_code") String product_code, String pageName, Model model) {
		logger.info("상품 상세정보 페이지 이동");
		
		ProductDetailDto productDetailDto = productService.getProductDetail(product_code);
		List<FileDto> fileList = fileService.getProductDetailFile(product_code);
		
		model.addAttribute("productDetail", productDetailDto);
		model.addAttribute("fileList", fileList);
		model.addAttribute("pageName", pageName);
		
		return "/admin/adminProductDetailView";
	}
	
	@GetMapping("/admin/productAddView")
	public String adminProductAddView(String pageName, Model model) {
		logger.info("상품등록 페이지로 이동");
		
		model.addAttribute("pageName", pageName);
		
		List<CategoryDto> categoryList = categoryService.getAllCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "/admin/adminProductAddView";
	}
	
	@PostMapping("/admin/productAdd")
	public String adminProductAdd(String pageName, Model model, ProductDto productDto,
			@RequestParam("image_upload") List<MultipartFile> multipartFiles, @RequestParam("imageType") String[] imageTypeList) throws Exception{
		logger.info("상품등록");
		System.out.println(multipartFiles);
		
		productService.productAdd(productDto);
		
		for(int i = 0; i < multipartFiles.size(); i++) {
			MultipartFile file = (MultipartFile) multipartFiles.get(i);
			
			if(file.isEmpty()) {
				continue;
			}
			
			FileDto fileDto = new FileDto();
			
			for(String list : imageTypeList) {
				String[] typeList = list.split("/");
				if(typeList[0].equals(file.getOriginalFilename())) {
					logger.info("오리지날 이름 : " + typeList[0] + " 이미지 타입 : " +typeList[1]);
					fileDto.setProduct_img_type(Integer.parseInt(typeList[1]));
				}
			}			

			String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
			logger.info("오리지날 파일명 : " + originalFileName);
			
			fileDto.setProduct_img_original_name(originalFileName);
			
			fileDto.setProduct_code(productDto.getProduct_code());
			
			String fileDBName = fileDBName(originalFileName, saveFolder);
			
			file.transferTo(new File(saveFolder + fileDBName));
			
			fileDto.setProduct_img_name(fileDBName);
			
			fileService.fileAdd(fileDto);
		}
		
		model.addAttribute("pageName", pageName);
		model.addAttribute("result", "productAddSuccess");
		
		return "redirect:/admin/productList";
	}
	
	private String fileDBName(String originalFileName, String saveFolder) {
		// 새로운 폴더 이름 : 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);
		
		String homeDir = saveFolder + year + "-" + month + "-" + date;
		logger.info("저장될 파일 경로 : " + homeDir);
		
		File path = new File(homeDir);
		if((!path.exists())) {
			path.mkdir();
		}
		
		String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		logger.info("파일 확장자 : " + fileExtension);
		
		String reFileName = "product" + year + month + date + UUID.randomUUID() + fileExtension; // 새로운 파일명
		logger.info("새로운 파일명 : " + reFileName);
		
		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + reFileName; // DB에 저장될 파일명
		logger.info("DB에 저장될 파일명 : " + fileDBName);
		
		return fileDBName;
		
	}
}
