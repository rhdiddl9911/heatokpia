package com.heatokpia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/support")
public class SuppoprtController {

	@GetMapping()
	public ModelAndView supportIndex() {
		ModelAndView model = new ModelAndView("support/qnaIndex");
		return model;
	}
	
	// 이 아래 자주 묻는 질문 Detail 추가
}
