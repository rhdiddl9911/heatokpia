package com.heatokpia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.heatokpia.service.NoticeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeController {

	private final NoticeService service;
	
	@GetMapping("")
	public ModelAndView list(
			@RequestParam(required = false) Integer page,
			@RequestParam(required = false) String searchArea,
			@RequestParam(required = false) String search,
			@RequestParam(required = false) String category) {
		
		ModelAndView model = new ModelAndView("notice/noticeList");
		
		RedirectView listRe = new RedirectView("/notice");
		
		// page 없이, page 0 보다 작게 접근 하였을 때 1번 페이지로 redirect
		if(page == null || page <= 0) {
			model.setView(listRe);
			model.addObject("page", 1);
			return model;
		}
		
		int maxPage = service.getMaxPage(category, searchArea, search);
		
		model.addObject("maxPage", maxPage);
		model.addObject("noticeList", service.getNoticeList(page, category, searchArea, search));
		return model;
	}
	
	@GetMapping("/{seq}")
	public ModelAndView noticeDetail(
			@PathVariable int seq) {
		ModelAndView model = new ModelAndView("notice/noticeDetail");
		model.addObject("noticeData", service.getNoticeData(seq));
		return model;
	}
	
}
