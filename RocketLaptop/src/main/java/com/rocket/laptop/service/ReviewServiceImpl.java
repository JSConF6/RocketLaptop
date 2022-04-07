package com.rocket.laptop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ReviewDto;
import com.rocket.laptop.repository.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public int reviewAdd(ReviewDto reviewDto, String order_id) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("order_id", order_id);
		map.put("reviewDto", reviewDto);
		
		reviewMapper.orderReviewUpdate(map);
		
		return reviewMapper.reviewAdd(reviewDto);
	}

	@Override
	public int getReviewListCount(String product_code) {
		return reviewMapper.getReviewListCount(product_code);
	}

	@Override
	public List<ReviewDto> getReviewList(PageHandler pageHandler, String product_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		map.put("product_code", product_code);
		
		return reviewMapper.getReviewList(map);
	}

	@Override
	public int getUserReviewListCount(String user_id) {
		return reviewMapper.getUserReviewListCount(user_id);
	}

	@Override
	public List<ReviewDto> getUserReviewList(String user_id, PageHandler pageHandler) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		map.put("user_id", user_id);
		
		return reviewMapper.getUserReviewList(map);
	}

}
