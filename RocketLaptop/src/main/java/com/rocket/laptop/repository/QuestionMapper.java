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

	int questionAdd(QuestionDto questionDto);

	int getUserQuestionListCount(String user_id);

	List<QuestionDto> getUserQuestionList(Map<String, Object> map);

	QuestionDto getUserQuestionDetail(Map<String, Object> map);

	CommentDto getUserComment(Map<String, Object> map);

	int getAjaxQuestionListCount(String commentState);

	List<QuestionDto> getAjaxQuestionList(Map<String, Object> map);

	int getAjaxUserQuestionListCount(Map<String, Object> map);

	List<QuestionDto> getAjaxUserQuestionList(Map<String, Object> map);
	
}
