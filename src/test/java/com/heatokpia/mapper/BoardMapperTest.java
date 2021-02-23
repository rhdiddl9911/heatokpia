package com.heatokpia.mapper;

import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.heatokpia.domain.Board;
import com.heatokpia.domain.BoardCategory;
import com.heatokpia.dto.BoardNonMemberDTO;

import lombok.Data;

@SpringBootTest
public class BoardMapperTest {

	@Autowired
	private BoardMapper boardMapper;
	
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
		HashMap<String, Integer> test = new HashMap<String, Integer>();
		test.put("categorynum", BoardCategory.free.getCategoryNum());
		test.put("page", 1);
		
		List<Board> freeList = boardMapper.findAllByCategory(test);
		
		System.out.println(freeList.toString());
	}
	
	@Test
	public void selectOneTest() {
		Board data = boardMapper.findById(1);
		System.out.println(data.toString());
	}
	
	@Test
	public void insertManyTest() {
		BoardNonMemberDTO data = new BoardNonMemberDTO();
		data.setName("테스트");
		data.setTitle("제목");
		data.setContent("내용");
		data.setIp("127.0.0.1");
		data.setCategory(BoardCategory.free.getCategoryNum());
		data.setPassword("1234");
		
		for(int i = 0; i<24; i++) {
			data.setTitle("제목:::"+i);
			boardMapper.save(data);
		}
	}
}
