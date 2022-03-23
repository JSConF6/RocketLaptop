package com.rocket.laptop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rocket.laptop.model.NoticeDto;
import com.rocket.laptop.model.PageHandler;
import com.rocket.laptop.repository.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public int noticeAdd(NoticeDto noticeDto) {
		return noticeMapper.noticeAdd(noticeDto);
	}

	@Override
	public int getNoticeListCount() {
		return noticeMapper.getNoticeListCount();
	}

	@Override
	public List<NoticeDto> getNoticeList(PageHandler pageHandler) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("start", pageHandler.getStartRow());
		map.put("end", pageHandler.getEndRow());
		
		return noticeMapper.getNoticeList(map);
	}

	@Override
	public NoticeDto getNoticeDetail(int num) {
		return noticeMapper.getNoticeDetail(num);
	}

	@Override
	public int noticeDelete(int num) {
		return noticeMapper.noticeDelete(num);
	}

	@Override
	public int noticeModify(NoticeDto noticeDto) {
		return noticeMapper.noticeModify(noticeDto);
	}

}
