package com.heatokpia.Service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.heatokpia.domain.Board;
import com.heatokpia.domain.BoardCategory;
import com.heatokpia.dto.BoardNonMemberDTO;
import com.heatokpia.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final BoardMapper boardMapper;
	private final PasswordEncoder passEncoder;
	
	// 글 입력
	public void write(BoardNonMemberDTO data, String ip, BoardCategory category) {
		data.setIp(ip);
		data.setCategory(category.getCategoryNum());
		data.setPassword(passEncoder.encode(data.getPassword()));
		boardMapper.save(data);
		logger.info("write:"+data.toString());
	}
	
	// 글 리스트 반환
	public List<Board> getBoardList(BoardCategory category){
		List<Board> resultList = boardMapper.findAllByCategory(category.getCategoryNum());
		return resultList;
	}
	
	// seq에 따른 글 하나 반환
	public Board getBoardData(int seq) {
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
}
