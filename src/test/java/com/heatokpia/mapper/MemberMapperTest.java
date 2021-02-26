package com.heatokpia.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.heatokpia.domain.Member;
import com.heatokpia.domain.MemberRole;

@SpringBootTest
public class MemberMapperTest {

	@Autowired
	MemberMapper memMapper;
	
	@Test
	public void insertTest() {
		Member mem = new Member();
		mem.setId("test");
		mem.setPassword("1234");
		mem.setName("테스터");
		mem.setEmail("1234");
		memMapper.save(mem);
	}
	
	@Test
	public void selectByid() {
		Member member = memMapper.findById("test");
		System.out.println(member.toString());
	}
}
