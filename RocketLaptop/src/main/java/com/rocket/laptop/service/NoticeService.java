package com.rocket.laptop.service;

import java.util.List;

import com.rocket.laptop.model.NoticeDto;
import com.rocket.laptop.model.PageHandler;

public interface NoticeService {
	public int noticeAdd(NoticeDto noticeDto);

	public int getNoticeListCount();
	
	public List<NoticeDto> getNoticeList(PageHandler pageHandler);
	
	public NoticeDto getNoticeDetail(int num);

	public int noticeDelete(int num);

	public int noticeModify(NoticeDto noticeDto);
}
