package com.rocket.laptop.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.CommentDto;
import com.rocket.laptop.model.QuestionDto;

@Mapper
@Repository
public interface QuestionMapper {

	List<QuestionDto> getQuestionList(Map<String, Object> map);

	int getQuestionListCount();

	QuestionDto getQuestionDetail(int num);

	CommentDto getComment(int num);

	int questionDelete(int num);

	int commentAdd(Map<String, Object> map);
	
}
