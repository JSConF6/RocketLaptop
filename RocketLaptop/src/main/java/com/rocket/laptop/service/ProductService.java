package com.rocket.laptop.service;

import java.util.List;
import java.util.Map;

import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductDto;
import com.rocket.laptop.model.ProductListDto;

public interface ProductService {
	public void productAdd(ProductDto productDto);
	
	public List<ProductListDto> getProductList(PageHandler pageHandler);
	
	public int getProductListCount();
	
	public ProductDetailDto getProductDetail(String product_code);
	
	public int productDelete(String product_code);
	
	public void productModify(ProductDto productDto);
	
	public List<ProductListDto> getNewProductList(PageHandler pageHandler);
	
	public List<ProductListDto> getBestProductList(PageHandler pageHandler);

	public int getCategoryProductListCount(int category_code);

	public List<ProductListDto> getCategoryProductList(PageHandler pageHandler, int category_code);

	public int getSearchProductListCount(String string, String search_word);

	public List<ProductListDto> getSearchProductList(PageHandler pageHandler, String string, String search_word);
}
