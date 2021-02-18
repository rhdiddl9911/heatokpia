package com.heatokpia.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.heatokpia.domain.BoardCategory;
import com.heatokpia.dto.BoardNonMember;

@SpringBootTest
public class BoardMapperTest {

	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	public void insertTest() {
		BoardNonMember data = new BoardNonMember();
		data.setName("테스트");
		data.setTitle("제목");
		data.setContent("내용");
		data.setIp("127.0.0.1");
		data.setCategory(BoardCategory.free.getBoolType());
		data.setPassword("1234");
		
		boardMapper.save(data);
	}
}
