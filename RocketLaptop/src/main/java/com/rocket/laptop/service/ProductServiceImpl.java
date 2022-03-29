package com.rocket.laptop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductDto;
import com.rocket.laptop.model.ProductListDto;
import com.rocket.laptop.repository.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public void productAdd(ProductDto productDto) {
		productMapper.productInsert(productDto);
	}

	@Override
	public List<ProductListDto> getProductList(PageHandler pageHandler) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return productMapper.getProductList(map);
	}

	@Override
	public int getProductListCount() {
		return productMapper.getProductListCount();
	}

	@Override
	public ProductDetailDto getProductDetail(String product_code) {
		return productMapper.getProductDetail(product_code);
	}

	@Override
	public int productDelete(String product_code) {
		return productMapper.productDelete(product_code);
	}

	@Override
	public void productModify(ProductDto productDto) {
		productMapper.productModify(productDto);
	}

	@Override
	public List<ProductListDto> getNewProductList(PageHandler pageHandler) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return productMapper.getProductList(map);
	}

	@Override
	public List<ProductListDto> getBestProductList(PageHandler pageHandler) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return productMapper.getBestProductList(map);
	}

	@Override
	public int getCategoryProductListCount(int category_code) {
		return productMapper.getCategoryProductListCount(category_code);
	}

	@Override
	public List<ProductListDto> getCategoryProductList(PageHandler pageHandler, int category_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("category_code", category_code);
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return productMapper.getCategoryProductList(map);
	}

}
