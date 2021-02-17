package com.heatokpia.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.heatokpia.Service.MemberDetailsService;
import com.heatokpia.domain.Member;
import com.heatokpia.domain.MemberRole;

@SpringBootTest
public class MemberDetailsServiceTest {

	@Autowired
	MemberDetailsService service;
	
	@Test
	public void addAdminTest() {
		Member testAdmin = new Member();
		testAdmin.setMember_id("admin");
		testAdmin.setName("관리자");
		testAdmin.setPassword("1234");
		testAdmin.setRole(MemberRole.ROLE_ADMIN);
		
		service.save(testAdmin);
	}
}
