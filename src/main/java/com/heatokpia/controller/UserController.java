package com.heatokpia.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.heatokpia.domain.Member;
import com.heatokpia.service.MemberDetailsService;

@RequestMapping(value = "/users", produces = {MediaType.APPLICATION_JSON_VALUE})
@RestController
public class UserController {
	
	private final MemberDetailsService service;
	
	@Autowired
	public UserController(MemberDetailsService userService) {
		this.service = userService;
	}
	
	@GetMapping("/{id}")
	public Map<String, Object> findById(@PathVariable("id") String id) {
		Map<String, Object> response = new HashMap<>();
		
		Member oUser = service.findById(id);
		if(oUser != null) {
			response.put("result", "SUCCESS");
			response.put("user", oUser);
		} else {
			response.put("result", "FAIL");
			response.put("reason", "일치하는 회원 정보가 없습니다. 사용자 id를 확인해주세요.");
		}
		
		return response;
	}
	
	@PostMapping("")
	public Map<String, Object> save(@RequestBody Member value) {
		Map<String, Object> response = new HashMap<>();
		
		Member user = service.save(value);
		if(user != null) {
			response.put("result", "SUCCESS");
			response.put("user", user);
		} else {
			response.put("result", "FAIL");
			response.put("reason", "회원 가입 실패");
		}
		
		return response;
	}
	
//	@PatchMapping("/{id}")
//	public Map<String, Object> patch(@PathVariable("id") Member user, @RequestBody MemberValue value) {
//		Map<String, Object> response = new HashMap<>();
//		
//		if(user != null && !user.isDel()) {
//			service.patch(user, value);
//			response.put("result", "SUCCESS");
//			response.put("user", user);
//		} else {
//			response.put("result", "FAIL");
//			response.put("reason", "일치하는 회원 정보가 없습니다. 사용자 id를 확인해주세요.");
//		}
//		
//		return response;
//	}
//	
//	@DeleteMapping("/{id}")
//	public Map<String, Object> delete(@PathVariable("id") User user) {
//		Map<String, Object> response = new HashMap<>();
//		
//		if(user != null && !user.isDel()) {
//			userService.delete(user);
//			response.put("result", "SUCCESS");
//		} else {
//			response.put("result", "FAIL");
//			response.put("reason", "일치하는 회원 정보가 없습니다. 사용자 id를 확인해주세요.");
//		}
//		
//		return response;
//	}
	
}
