package com.heatokpia.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.heatokpia.domain.Member;

@SpringBootTest
public class MemberMapperTest {

	@Autowired
	MemberMapper memMapper;
	
	@Test
	public void insertTestAdminTest() {
		memMapper.insertTestAdminMember();
	}
	
	@Test
	public void selectBYid() {
		//Member mem = memMapper.readMemberById("admin");
		// d안넘어옴 ;
		//System.out.println(mem.getUsername());
	}
}
