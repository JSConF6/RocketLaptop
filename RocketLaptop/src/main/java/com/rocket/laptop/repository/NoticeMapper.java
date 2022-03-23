package com.rocket.laptop.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.rocket.laptop.model.NoticeDto;

@Mapper
@Repository
public interface NoticeMapper {
	public int noticeAdd(NoticeDto noticeDto);

	public int getNoticeListCount();

	public List<NoticeDto> getNoticeList(Map<String, Object> map);

	public NoticeDto getNoticeDetail(int num);

	public int noticeDelete(int num);

	public int noticeModify(NoticeDto noticeDto);
}
