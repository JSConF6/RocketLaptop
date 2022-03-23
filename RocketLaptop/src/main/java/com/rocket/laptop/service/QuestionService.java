package com.rocket.laptop.service;

import java.util.List;

import com.rocket.laptop.model.CommentDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.QuestionDto;

public interface QuestionService {
	public List<QuestionDto> getQuestionList(PageHandler pageHandler);

	public int getQuestionListCount();

	public QuestionDto getQuestionDetail(int num);
	
	public CommentDto getComment(int num);

	public int questionDelete(int num);

	public int commentAdd(int num, String comment_content);
}
