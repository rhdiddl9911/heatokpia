package com.heatokpia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.Board;
import com.heatokpia.dto.BoardNonMemberDTO;

@Mapper
public interface BoardMapper {
	// 익명유저 글작성
	public void save(BoardNonMemberDTO data);
	
	// 글 목록 불러오기
	public List<Board> findAllByCategory(int categorynum);
	
	// 글 하나 가져오기
	public Board findById(int seq);
}
