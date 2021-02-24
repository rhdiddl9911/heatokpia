package com.heatokpia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.BoardComment;

@Mapper
public interface BoardCommentMapper {

	public void save(BoardComment comment);
	
	public List<BoardComment> findByBoardSeq(int boardSeq);
}
