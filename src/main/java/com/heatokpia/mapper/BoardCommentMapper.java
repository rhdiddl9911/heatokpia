package com.heatokpia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.BoardComment;

@Mapper
public interface BoardCommentMapper {

	// 댓글 저장
	public void save(BoardComment comment);
	
	// 글 번호로 댓글 목록 찾기
	public List<BoardComment> findByBoardSeq(int boardSeq);
	
	// 댓글 번호로 비밀번호 반환
	public String findPasswordBySeq(int seq);
	
	// 댓글 번호로 삭제
	public void deleteBoardComment(int seq);
}
