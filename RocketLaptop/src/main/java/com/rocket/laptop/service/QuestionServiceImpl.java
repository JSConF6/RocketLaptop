package com.rocket.laptop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.CommentDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.model.QuestionDto;
import com.rocket.laptop.repository.QuestionMapper;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionMapper questionMapper;
	
	@Override
	public List<QuestionDto> getQuestionList(PageHandler pageHandler) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return questionMapper.getQuestionList(map);
	}

	@Override
	public int getQuestionListCount() {
		return questionMapper.getQuestionListCount();
	}

	@Override
	public QuestionDto getQuestionDetail(int num) {
		if(setReadCountUpdate(num) != 1) {
			return null;
		}
		
		return questionMapper.getQuestionDetail(num);
	}

	@Override
	public CommentDto getComment(int num) {
		return questionMapper.getComment(num);
	}

	@Override
	public int questionDelete(int num) {
		return questionMapper.questionDelete(num);
	}

	@Override
	public int commentAdd(int num, String comment_content) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("comment_content", comment_content);
		map.put("num", num);
		
		return questionMapper.commentAdd(map);
	}

	@Override
	public int questionAdd(QuestionDto questionDto) {
		return questionMapper.questionAdd(questionDto);
	}

	@Override
	public int getUserQuestionListCount(String user_id) {
		return questionMapper.getUserQuestionListCount(user_id);
	}

	@Override
	public List<QuestionDto> getUserQuestionList(String user_id, PageHandler pageHandler) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("user_id", user_id);
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return questionMapper.getUserQuestionList(map);
	}

	@Override
	public QuestionDto getUserQuestionDetail(int num, String user_id) {
		if(setReadCountUpdate(num) != 1) {
			return null;
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("user_id", user_id);
		map.put("num", num);
		
		return questionMapper.getUserQuestionDetail(map);
	}

	@Override
	public int getAjaxQuestionListCount(String commentState) {
		return questionMapper.getAjaxQuestionListCount(commentState);
	}

	@Override
	public List<QuestionDto> getAjaxQuestionList(String commentState, PageHandler pageHandler) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("commentState", commentState);
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return questionMapper.getAjaxQuestionList(map);
	}

	@Override
	public int getAjaxUserQuestionListCount(String user_id, String commentState) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("commentState", commentState);
		map.put("user_id", user_id);
		
		return questionMapper.getAjaxUserQuestionListCount(map);
	}
	
	@Override
	public List<QuestionDto> getAjaxUserQuestionList(String user_id, String commentState, PageHandler pageHandler) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("commentState", commentState);
		map.put("user_id", user_id);
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return questionMapper.getAjaxUserQuestionList(map);
	}

	@Override
	public int setReadCountUpdate(int num) {
		return questionMapper.setReadCountUpdate(num);
	}

}
