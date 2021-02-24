package com.heatokpia.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.BoardLike;

@Mapper
public interface BoardLikeMapper {

	// 좋아요 저장 +1
	public void save(HashMap<String, Object> map);
	
	// 좋아요 찾기
	public BoardLike findByBoardSeqAndIp(HashMap<String, Object> map);
	
	// 글번호에 따른 좋아요 전체 카운트
	public int findCount(int boardSeq);
	 
	// 좋아요 삭제
	public void deleteByBoardSeqAndIp(HashMap<String, Object> map);
	
}
