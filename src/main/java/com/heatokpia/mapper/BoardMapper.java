package com.heatokpia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.heatokpia.dto.BoardForListDTO;
import com.heatokpia.dto.BoardNonMemberDTO;

@Mapper
public interface BoardMapper {
	// 익명유저 글작성
	public void save(BoardNonMemberDTO data);
	
	// 글 목록 불러오기
	public List<BoardForListDTO> findAllByCategory(@Param("categorynum") int categorynum);
	
}
