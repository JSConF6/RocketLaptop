package com.rocket.laptop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.PageHandler;
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

}
