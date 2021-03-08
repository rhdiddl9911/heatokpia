package com.heatokpia.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.heatokpia.service.HomeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final HomeService service;

	@GetMapping("")
	public String testAdminPage() {
		return "redirect:/admin/manage";
	}
	
	@GetMapping("/manage")
	public ModelAndView selectView() {
		ModelAndView model = new ModelAndView("admin/adminboardSelect");
		HashMap<String, Object> list = service.boardNoticeNews();
		//freeBoardList, infoBoardList, noticeBoardList, newsBoardList
		for(String key : list.keySet()) {
			model.addObject(key, list.get(key));
		}
		return model;
	}
	
	@GetMapping("/workzone")
	public String workzone() {
		return "admin/adminWorkzone";
	}
}
