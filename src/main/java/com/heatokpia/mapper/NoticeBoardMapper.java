package com.heatokpia.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.heatokpia.domain.NoticeBoard;

@Mapper
public interface NoticeBoardMapper {

	public void save(NoticeBoard data);
	
	// 전체 조회
	public List<NoticeBoard> findTitleList(int page);
	
	// 카테고리 조회
	public List<NoticeBoard> findTitleListByCategory(@Param("page")int page, @Param("category") int category);
	
	// 카테고리 & 검색
	public List<NoticeBoard> findTitleListByCategoryAndSearch(HashMap<String, Object> map);
	
	// 전체 & 검색
	public List<NoticeBoard> findTitleListBySearch(HashMap<String, Object> map);
	
	// 전체
	public int findMaxPage();
	
	// 카테고리
	public int findMaxPageByCategory(int category);
	
	// 카테고리 & 검색
	public int findMaxPageByCategoryAndSearch(HashMap<String, Object> map);
	
	// 전체 & 검색
	public int findMaxPageBySearch(HashMap<String, Object> map);
	
	// 글하나 반환
	public NoticeBoard findById(int seq);
}
