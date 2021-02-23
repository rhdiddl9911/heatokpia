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
	
	// 글번호로 비밀번호 가져오기
	public String findPasswordById(int seq);
	
	// 글 번호로 업데이트 하기
	public void update(BoardNonMemberDTO data);
	
	// 글 번호로 글 삭제하기
	public void deleteById(int seq);
}
