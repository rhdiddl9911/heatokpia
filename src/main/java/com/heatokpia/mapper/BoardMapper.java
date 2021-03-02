package com.heatokpia.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.Board;
import com.heatokpia.dto.BoardNonMemberDTO;

@Mapper
public interface BoardMapper {
	// 익명유저 글작성
	public void save(BoardNonMemberDTO data);
	
	// 글 목록 불러오기
	public List<Board> findAllByCategory(HashMap<String, Integer> categoryPage);
	
	// 검색 글 목록 불러오기 
	public List<Board> findSearchByCategoryAndSearch(HashMap<String, Object> map);
	
	// 글 하나 가져오기
	public Board findById(int seq);
	
	// 글번호로 비밀번호 가져오기
	public String findPasswordById(int seq);
	
	// 글 번호로 업데이트 하기
	public void update(BoardNonMemberDTO data);
	
	// 글 번호로 글 삭제하기
	public void deleteById(int seq);
	
	// 카테고리에 따른 페이지 최대 수 가져오기
	public int findMaxPage(int categorynum);
	
	// 검색 수에 따른 페이지 최대 수 가져오기
	public int findSearchMaxPage(HashMap<String, Object> map);
	
	// 글 조회수 1만큼 올리기
	public void updateHit(int seq);
	
	// ---- admin
	// 글 목록 내용 포함해서 가져오기
	public List<Board> findContentPlusByCategory(HashMap<String, Object> categoryPage);
	
	// 검색 글 목록 내용 포함해서 가져오기
	public List<Board> findContentPlusByCategoryAndSearch(HashMap<String, Object> map);
}
