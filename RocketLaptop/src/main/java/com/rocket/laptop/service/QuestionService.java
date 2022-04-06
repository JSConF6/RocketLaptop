package com.rocket.laptop.service;

import java.util.List;

import com.rocket.laptop.model.CommentDto;
import com.rocket.laptop.model.NoticeDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.QuestionDto;

public interface QuestionService {
	public List<QuestionDto> getQuestionList(PageHandler pageHandler);

	public int getQuestionListCount();

	public QuestionDto getQuestionDetail(int num);
	
	public CommentDto getComment(int num);

	public int questionDelete(int num);

	public int commentAdd(int num, String comment_content);
	
	public int questionAdd(QuestionDto questionDto);

	public int getUserQuestionListCount(String user_id);

	public List<QuestionDto> getUserQuestionList(String user_id, PageHandler pageHandler);

	public QuestionDto getUserQuestionDetail(int num, String user_id);

	public int getAjaxQuestionListCount(String commentState);

	public List<QuestionDto> getAjaxQuestionList(String commentState, PageHandler pageHandler);

	public int getAjaxUserQuestionListCount(String user_id, String commentState);

	public List<QuestionDto> getAjaxUserQuestionList(String user_id, String commentState, PageHandler pageHandler);

	public int getProductQuestionListCount(String product_code);

	public List<QuestionDto> getProductQuestionList(PageHandler pageHandler, String product_code);

	public QuestionDto getProductQuestionDetail(int num);

	public void updateQnaCommentYN(int num);
}
