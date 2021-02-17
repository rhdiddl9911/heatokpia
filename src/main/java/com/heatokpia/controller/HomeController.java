package com.heatokpia.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor // final 붙은 필드는 자동으로 생성자로 받습니다 (그 결과 Autowired없어도 의존성 주입)
public class HomeController {

	// 테스트용도입니다!! /index, admin/adminIndex 동작
	@GetMapping("/{page}")
	public String testPageReturn(@PathVariable String page) {
		return page;
	}
}
