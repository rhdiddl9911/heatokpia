package com.heatokpia.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.NoticeBoard;

@Mapper
public interface NoticeBoardMapper {

	public void save(NoticeBoard data);
	
}
