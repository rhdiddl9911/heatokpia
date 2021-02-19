package com.heatokpia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.BoardCategory;
import com.heatokpia.dto.BoardForListDTO;
import com.heatokpia.dto.BoardNonMemberDTO;

@Mapper
public interface BoardMapper {
	// 익명유저 글작성
	public void save(BoardNonMemberDTO data);
	
	
}
