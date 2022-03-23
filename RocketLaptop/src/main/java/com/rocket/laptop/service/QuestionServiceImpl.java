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

}
