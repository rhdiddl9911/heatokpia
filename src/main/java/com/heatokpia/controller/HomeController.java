package com.heatokpia.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.heatokpia.Service.HomeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final HomeService service;
	
	@GetMapping()
	public ModelAndView indexReturn() {
		ModelAndView model = new ModelAndView("index");
		HashMap<String, Object> list = service.boardNoticeNews();
		//freeBoardList, infoBoardList, noticeBoardList, newsBoardList
		for(String key : list.keySet()) {
			model.addObject(key, list.get(key));
		}
		return model;
	}
	
	@GetMapping("/workzone")
	public ModelAndView workZone() {
		ModelAndView model = new ModelAndView("inging");
		return model;
	}
}
