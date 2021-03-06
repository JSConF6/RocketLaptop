package com.rocket.laptop.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rocket.laptop.model.CategoryDto;
import com.rocket.laptop.model.FileDto;
import com.rocket.laptop.model.ImageTypeDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.model.ResponseDto;
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
	public String adminProductView(Model model,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		logger.info("???????????? ???????????? ??????");

		int limit = 4;
		logger.info("limit : " + limit);

		int listCount = productService.getProductListCount();
		logger.info("??? ?????? ?????? : " + listCount);

		PageHandler pageHandler = new PageHandler(page, listCount, limit);

		if (pageHandler.getEndPage() > pageHandler.getMaxPage()) {
			pageHandler.setEndPage(pageHandler.getMaxPage());
		}

		List<ProductListDto> productList = productService.getProductList(pageHandler);
		logger.info("?????? ????????? ?????? : " + productList);

		model.addAttribute("pageHandler", pageHandler);
		model.addAttribute("productList", productList);

		return "/admin/adminProductListView";
	}

	@GetMapping("/admin/productDetail")
	public String adminProductDetail(@RequestParam(value = "product_code") String product_code, Model model) {
		logger.info("?????? ???????????? ????????? ??????");

		ProductDetailDto productDetailDto = productService.getProductDetail(product_code);
		List<FileDto> fileList = fileService.getProductDetailFile(product_code);

		model.addAttribute("productDetail", productDetailDto);
		model.addAttribute("fileList", fileList);

		return "/admin/adminProductDetailView";
	}

	@PostMapping("/admin/productDelete")
	@ResponseBody
	public int adminProductDelete(@RequestParam(value = "product_code") String product_code, Model model) {
		logger.info("?????? ?????? ??????");

		int result = productService.productDelete(product_code);

		return result;
	}

	@GetMapping("/admin/productModifyView")
	public String adminProductModify(@RequestParam(value = "product_code") String product_code, Model model) {
		logger.info("?????? ???????????? ????????? ??????");

		ProductDetailDto productDetailDto = productService.getProductDetail(product_code);
		List<FileDto> fileList = fileService.getProductDetailFile(product_code);

		model.addAttribute("productDetail", productDetailDto);
		model.addAttribute("fileList", fileList);

		return "/admin/adminProductModifyView";
	}

	@PostMapping("/admin/productModify")
	@ResponseBody
	public ResponseDto<String> adminProductModify(ProductDto productDto,
			@RequestParam(value = "image_upload", required = false) List<MultipartFile> multipartFiles,
			@RequestParam("imageType") String imageTypeList) {
		logger.info("????????????");

		productService.productModify(productDto);
		
		ObjectMapper om = new ObjectMapper();
		
		try {
			List<ImageTypeDto> imageTypeDtos = om.readValue(imageTypeList, new TypeReference<List<ImageTypeDto>>() {});

			if (CollectionUtils.isEmpty(multipartFiles)) {
				logger.info("?????? ?????? 5??? ????????? ??????");
				return new ResponseDto<String>(HttpStatus.OK.value(), "?????? ?????? ??????");
			} else {
				for (int i = 0; i < multipartFiles.size(); i++) {
					logger.info("?????? " + multipartFiles.size() + "??? ??????");
					MultipartFile file = (MultipartFile) multipartFiles.get(i);
	
					FileDto fileDto = new FileDto();
	
					String originalFileName = file.getOriginalFilename();
					logger.info("???????????? ?????? ??? : " + originalFileName);
					
					for (ImageTypeDto imageTypeDto : imageTypeDtos) {
						if(imageTypeDto == null) {
							continue;
						}
						
						if (imageTypeDto.getImage_name().equals(originalFileName)) {
							fileDto.setProduct_img_type(imageTypeDto.getImage_type());
							fileDto.setProduct_img_num(imageTypeDto.getImage_num());
						}
					}
	
					fileDto.setProduct_img_original_name(originalFileName);
	
					String fileDBName = fileDBName(originalFileName, saveFolder);
	
					file.transferTo(new File(saveFolder + fileDBName));
	
					fileDto.setProduct_img_name(fileDBName);
	
					fileService.fileModify(fileDto, productDto.getProduct_code());
				}
			}
		} catch (Exception e) {
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "?????? ?????? ??????");
		}

		return new ResponseDto<String>(HttpStatus.OK.value(), "?????? ?????? ??????");
	}

	@GetMapping("/admin/productAddView")
	public String adminProductAddView(Model model) {
		logger.info("???????????? ???????????? ??????");

		List<CategoryDto> categoryList = categoryService.getAllCategory();
		model.addAttribute("categoryList", categoryList);

		return "/admin/adminProductAddView";
	}

	@PostMapping("/admin/productAdd")
	@ResponseBody
	public ResponseDto<String> adminProductAdd(ProductDto productDto,
			@RequestParam("image_upload") List<MultipartFile> multipartFiles,
			@RequestParam("image_type") String imageTypeList) {
		logger.info("????????????");

		productService.productAdd(productDto);

		ObjectMapper om = new ObjectMapper();

		try {

			List<ImageTypeDto> imageTypeDtos = om.readValue(imageTypeList, new TypeReference<List<ImageTypeDto>>() {
			});

			for (int i = 0; i < multipartFiles.size(); i++) {
				MultipartFile file = (MultipartFile) multipartFiles.get(i);

				FileDto fileDto = new FileDto();

				String originalFileName = file.getOriginalFilename(); // ???????????? ?????????
				logger.info("???????????? ????????? : " + originalFileName);

				fileDto.setProduct_img_original_name(originalFileName);

				for (ImageTypeDto imageTypeDto : imageTypeDtos) {
					if (imageTypeDto.getImage_name().equals(originalFileName)) {
						fileDto.setProduct_img_type(imageTypeDto.getImage_type());
					}
				}

				fileDto.setProduct_code(productDto.getProduct_code());

				String fileDBName = fileDBName(originalFileName, saveFolder);

				file.transferTo(new File(saveFolder + fileDBName));

				fileDto.setProduct_img_name(fileDBName);

				fileService.fileAdd(fileDto);
			}
		} catch (Exception e) {
			ProductDetailDto productDetailDto = productService.getProductDetail(productDto.getProduct_code());

			if (productDetailDto != null) {
				productService.productDelete(productDto.getProduct_code());
			}

			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "?????? ?????? ??????");
		}

		return new ResponseDto<String>(HttpStatus.OK.value(), "?????? ?????? ??????");
	}

	private String fileDBName(String originalFileName, String saveFolder) {
		// ????????? ?????? ?????? : ?????? ???+???+???
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);

		String homeDir = saveFolder + year + "-" + month + "-" + date;
		logger.info("????????? ?????? ?????? : " + homeDir);

		File path = new File(homeDir);
		if ((!path.exists())) {
			path.mkdir();
		}

		String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); // ?????? ?????????
		logger.info("?????? ????????? : " + fileExtension);

		String reFileName = "product" + year + month + date + UUID.randomUUID() + fileExtension; // ????????? ?????????
		logger.info("????????? ????????? : " + reFileName);

		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + reFileName; // DB??? ????????? ?????????
		logger.info("DB??? ????????? ????????? : " + fileDBName);

		return fileDBName;

	}
}
