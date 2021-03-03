package com.heatokpia.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.heatokpia.Service.NewsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/news")
@RequiredArgsConstructor
public class NewsController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private final NewsService service;

	// redirect NEWSList
	RedirectView listRe = new RedirectView("/news");
	
	@GetMapping()
	public ModelAndView newsHome(
			@RequestParam(required = false) Integer page,
			@RequestParam(required = false) String searchArea,
			@RequestParam(required = false) String search
			) {
		logger.info("newsHome");
		ModelAndView model = new ModelAndView("news/newsList");
		
		// page 없이, page 0 보다 작게 접근 하였을 때 1번 페이지로 redirect
		if(page == null || page <= 0) {
			model.setView(listRe);
			model.addObject("page", 1);
			return model;
		}
		
		int maxPage = service.getMaxPage(searchArea, search);
		
		model.addObject("maxPage", maxPage);
		model.addObject("newsList", service.getTitleList(page, searchArea, search));
		return model;
	}
	
	@GetMapping("/{seq}")
	public ModelAndView newsDetail(
			@PathVariable int seq) {
		ModelAndView model = new ModelAndView("news/newsDetail");
		model.addObject("newsData", service.getNewsData(seq));
		return model;
	}
}
