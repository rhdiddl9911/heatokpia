package com.heatokpia.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.heatokpia.Service.NoticeService;
import com.heatokpia.domain.Member;
import com.heatokpia.domain.NoticeBoard;

import lombok.RequiredArgsConstructor;

// 관리자 공지관련 url 매핑 controller
@Controller
@RequestMapping("/admin/notice")
@RequiredArgsConstructor
public class AdminNoticeController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final NoticeService service;
	
	@GetMapping()
	public ModelAndView noticeList(
			@RequestParam(required = false) Integer page,
			@RequestParam(required = false) String searchArea,
			@RequestParam(required = false) String search,
			@RequestParam(required = false) String category
			) {
		ModelAndView model = new ModelAndView("admin/notice/adminNoticeList");
		RedirectView listRe = new RedirectView("/admin/notice");
		
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
	
	@GetMapping("/write")
	public ModelAndView noticeWriteView() {
		ModelAndView model = new ModelAndView("admin/notice/writeNoticeForm");
		model.addObject("memobean", new NoticeBoard());
		return model;
	}
	
	@PostMapping("/write")
	public ModelAndView noticeWriteDo(NoticeBoard data, @AuthenticationPrincipal Member member) {
		ModelAndView model = new ModelAndView("redirect:/admin/notice");
		System.out.println(member.toString());
		data.setMember(member);
		service.insertBoard(data);
		return model;
	}
	
			
}
