package com.heatokpia.mapper;

import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.heatokpia.domain.Board;
import com.heatokpia.domain.BoardCategory;
import com.heatokpia.domain.BoardComment;
import com.heatokpia.dto.BoardNonMemberDTO;

import lombok.Data;

@SpringBootTest
public class BoardMapperTest {

	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private BoardCommentMapper commentMapper;
	@Autowired
	private BoardLikeMapper likeMapper;
	@Autowired
	private PasswordEncoder passEncoder;
	
	@Test
	public void insertTest() {
		BoardNonMemberDTO data = new BoardNonMemberDTO();
		data.setName("테스트");
		data.setTitle("제목");
		data.setContent("내용");
		data.setIp("127.0.0.1");
		data.setCategory(BoardCategory.free.getCategoryNum());
		data.setPassword("1234");
		
		boardMapper.save(data);
	}
	
	@Test
	public void selectListTest() {
	}
	
	@Test
	public void selectOneTest() {
		Board data = boardMapper.findById(1);
		System.out.println(data.toString());
	}
	
	@Test
	public void insertCommentTest() {

		BoardComment comment = new BoardComment();
		
		for (int i = 2; i< 30 ; i++) {
			comment.setBoardSeq(2);
			comment.setContent(i+" 번째 comment");
			comment.setName("Nick");
			comment.setPassword(passEncoder.encode("1234"));
			comment.setIp("127.0.0.1");
			
			commentMapper.save(comment);
		}
	}
	
	@Test
	public void findLikeCount() {
		int i = 2;
		System.out.println("가져온 값 ::::: "+likeMapper.findCount(i));
	}
	
	@Test
	public void likeSaveTest() {
		
		for(int i =0; i<5; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("boardSeq", 2);
			map.put("ip", "172.1.0."+i);
			
			likeMapper.save(map);
		}
		
	}
}
