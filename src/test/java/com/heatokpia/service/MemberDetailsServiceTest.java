package com.heatokpia.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.heatokpia.domain.Member;
import com.heatokpia.domain.MemberRole;
import com.heatokpia.service.MemberDetailsService;

@SpringBootTest
public class MemberDetailsServiceTest {

	@Autowired
	MemberDetailsService service;
	
	@Test
	public void addAdminTest() {
		Member testAdmin = new Member();
		testAdmin.setId("admin");
		testAdmin.setName("관리자");
		testAdmin.setPassword("1234");
		testAdmin.setRole(MemberRole.ROLE_ADMIN);
		testAdmin.setEmail("123@1233.com");
		
		service.save(testAdmin);
	}
	
	@Test
	public void addCommonMemberTest() {
		Member testAdmin = new Member();
		testAdmin.setId("common2");
		testAdmin.setName("일반유저2");
		testAdmin.setPassword("1234");
		testAdmin.setEmail("123@1233.com");
		
		service.save(testAdmin);
	}
}
