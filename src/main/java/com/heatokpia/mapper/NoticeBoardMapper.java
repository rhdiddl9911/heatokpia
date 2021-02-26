package com.heatokpia.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.heatokpia.domain.NoticeBoard;

@Mapper
public interface NoticeBoardMapper {

	public void save(NoticeBoard data);
	
	public List<NoticeBoard> findTitleList(int page);
	
	public List<NoticeBoard> findTitleListByCategory(@Param("page")int page, @Param("category") int category);
	
	public List<NoticeBoard> findTitleListByCategoryAndSearch(HashMap<String, Object> map);
	
	public int findMaxPage();
}
