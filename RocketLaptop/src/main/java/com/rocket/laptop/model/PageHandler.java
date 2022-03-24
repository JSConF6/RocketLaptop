package com.rocket.laptop.model;

import lombok.Data;

@Data
public class PageHandler {
	private int page; // 현재 페이지
	private int listCount; // 총 게시물 갯수
	private int limit; // 한 페이지 크기
	private int maxPage; // 총 페이지 수
	private int startPage; // 네비게이션 첫번째 페이지
	private int endPage; // 네비게이션 마지막 페이지
	private int startRow;
	private int endRow;
    
    public PageHandler(int page, int listCount, int limit) {
        this.page = page;
        this.listCount = listCount;
        this.limit = limit;
        
        maxPage = (listCount + limit - 1) / limit;
        startPage = ((page - 1) / 10) * 10 + 1;
        endPage = startPage + 10 - 1;
        startRow = (page - 1) * limit + 1;
        endRow = startRow + limit - 1;
    }
}
