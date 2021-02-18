package com.heatokpia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.BoardCategory;
import com.heatokpia.dto.BoardForListDTO;
import com.heatokpia.dto.BoardNonMember;

@Mapper
public interface BoardMapper {

	//public List<BoardForListDTO> findTitleAllByCategory(BoardCategory categorynum);
	
	// 익명유저 글작성
	public void save(BoardNonMember data);
	
}
