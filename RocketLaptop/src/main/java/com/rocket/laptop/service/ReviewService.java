package com.rocket.laptop.service;

import java.util.List;

import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.ReviewDto;

public interface ReviewService {
	public int reviewAdd(ReviewDto reviewDto, String order_id);

	public List<ReviewDto> getReviewList(PageHandler pageHandler, String product_code);

	public int getReviewListCount(String product_code);
}
