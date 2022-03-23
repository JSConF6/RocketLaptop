package com.rocket.laptop.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.ProductDetailDto;
import com.rocket.laptop.model.ProductDto;
import com.rocket.laptop.model.ProductListDto;

@Mapper
@Repository
public interface ProductMapper {
	public void productInsert(ProductDto productDto);
	
	public List<ProductListDto> getProductList(Map<String, Object> map);
	
	public int getProductListCount();
	
	public ProductDetailDto getProductDetail(String product_code);
	
	public int productDelete(String product_code);
	
	public void productModify(ProductDto productDto);
}
