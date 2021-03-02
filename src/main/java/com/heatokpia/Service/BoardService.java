package com.heatokpia.Service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.heatokpia.domain.Board;
import com.heatokpia.domain.BoardCategory;
import com.heatokpia.domain.BoardComment;
import com.heatokpia.dto.BoardNonMemberDTO;
import com.heatokpia.mapper.BoardCommentMapper;
import com.heatokpia.mapper.BoardLikeMapper;
import com.heatokpia.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final BoardMapper boardMapper;
	private final BoardCommentMapper commentMapper;
	private final BoardLikeMapper likeMapper;
	private final PasswordEncoder passEncoder;
	
	// 글 입력
	public void write(BoardNonMemberDTO data, String ip, BoardCategory category) {
		data.setIp(ip);
		data.setCategory(category.getCategoryNum());
		data.setPassword(passEncoder.encode(data.getPassword()));
		boardMapper.save(data);
		logger.info("write:"+data.toString());
	}

	// seq에 따른 조회수 올리기
	// seq에 따른 글 하나 반환
	public Board getBoardData(int seq) {
		boardMapper.updateHit(seq);
		Board resultData = boardMapper.findById(seq);
		return resultData;
	}
	
	// seq에 따른 password 체크 수행
	public boolean passCheck(int seq, String password) {
		return passEncoder.matches(password, boardMapper.findPasswordById(seq));
	}
	
	// Board Update 실행
	public void updateBoardData(int seq, BoardNonMemberDTO data, String ip) {
		data.setSeq(seq);
		data.setIp(ip);
		data.setPassword(passEncoder.encode(data.getPassword()));
		boardMapper.update(data);
	}
	
	// seq에 따른 글 삭제
	public void deleteBoardData(int seq) {
		boardMapper.deleteById(seq);
	}
	
	// 일반 글 리스트 반환
	public List<Board> getBoardList(BoardCategory category, int page){
		HashMap<String, Integer> categoryPage = new HashMap<String, Integer>();
		categoryPage.put("categorynum", category.getCategoryNum());
		categoryPage.put("page", page);
		
		List<Board> resultList = boardMapper.findAllByCategory(categoryPage);
		return resultList;
	}
	
	// 검색 글 리스트 반환
	public List<Board> getBoardList(BoardCategory category, int page, String searchArea, String search){
		HashMap<String, Object> mapperParam = new HashMap<String, Object>();
		mapperParam.put("categorynum", category.getCategoryNum());
		mapperParam.put("page", page);
		mapperParam.put("searchArea", searchArea);
		mapperParam.put("search", search);
		
		List<Board> resultList = boardMapper.findSearchByCategoryAndSearch(mapperParam);
		return resultList;
	}
	
	// 카테고리에 따른 Board page 최대값
	public int getBoardListMaxPage(int categorynum) {
		return boardMapper.findMaxPage(categorynum);
	}
	
	// 카테고리 & 검색 페이지 최대값
	public int getBoardListMaxPage(int categorynum, String searchArea, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("categorynum", categorynum);
		map.put("searchArea", searchArea);
		map.put("search", search);
		return boardMapper.findSearchMaxPage(map);
	}
	
	// 댓글 입력
	public void writeComment(BoardComment data, String ip, int boardSeq) {
		data.setPassword(passEncoder.encode(data.getPassword()));
		data.setIp(ip);
		data.setBoardSeq(boardSeq);
		commentMapper.save(data);
	}
	
	// 글 번호에 따른 댓글 리스트반환
	public List<BoardComment> getCommentList(int boardSeq){
		return commentMapper.findByBoardSeq(boardSeq);
	}
	
	// 좋아요 버튼 눌렀을때 이미 있으면 삭제 없으면 추가 동작 후 동작한 내용 반환
	public String likeDo(String ip, int boardSeq) {
		String resultCount;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ip", ip);
		map.put("boardSeq", boardSeq);
		
		// find로 안하고 일단 try catch함
		try {
			likeMapper.save(map);
			resultCount = "+1";
		}catch (Exception e) {
			likeMapper.deleteByBoardSeqAndIp(map);
			resultCount = "-1";
		}
		
		return resultCount;
	}
	
	// 글 번호에 따른 좋아요 갯수 반환
	public int getLikeCount(int boardSeq) {
		return likeMapper.findCount(boardSeq);
	}
	
	// 댓글 번호에 따른 삭제 성공 true, 실패 false
	public boolean deleteBoardComment(int seq, String password) {
		if(passEncoder.matches(password, commentMapper.findPasswordBySeq(seq))) {
			commentMapper.deleteBoardComment(seq);
			return true;
		}else {
			return false;
		}
	}
	
	// --- admin
	public List<Board> getAdminViewList(int page, int category, String searchArea, String search){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("categorynum", category);
		if(searchArea == null) {
			return boardMapper.findContentPlusByCategory(map);
		}else {
			map.put("searchArea", searchArea);
			map.put("search", search);
			return boardMapper.findContentPlusByCategoryAndSearch(map);
		}
	}
	
	// seq에 따른 글 하나 반환
	public Board getBoardDataNoHit(int seq) {
		Board resultData = boardMapper.findById(seq);
		return resultData;
	}
}
