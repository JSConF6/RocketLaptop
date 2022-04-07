package com.rocket.laptop.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.NoticeDto;
import com.rocket.laptop.model.ReviewDto;

@Mapper
@Repository
public interface ReviewMapper {

	int reviewAdd(ReviewDto reviewDto);

	int getReviewListCount(String product_code);

	List<ReviewDto> getReviewList(Map<String, Object> map);

	void orderReviewUpdate(Map<String, Object> map);

	int getUserReviewListCount(String user_id);

	List<ReviewDto> getUserReviewList(Map<String, Object> map);
	
}
