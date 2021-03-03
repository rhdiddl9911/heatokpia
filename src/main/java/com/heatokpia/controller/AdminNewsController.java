package com.heatokpia.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.heatokpia.Service.NewsService;
import com.heatokpia.domain.News;

import lombok.RequiredArgsConstructor;

@Controller
@PreAuthorize("hasRole('ADMIN')")
@RequestMapping("/admin/news")
@RequiredArgsConstructor
public class AdminNewsController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private final NewsService service;

	// redirect NEWSList
	RedirectView listRe = new RedirectView("/admin/news");
	
	
	@GetMapping("/new")
	public ModelAndView adminNewsWriteView() {
		ModelAndView model = new ModelAndView("admin/news/adminNewsWrite");
		
		return model;
	}
	
	// 관리자 뉴스 추가
	@PostMapping("/new")
	public @ResponseBody ResponseEntity<?> adminNewsWriteDo(
			@RequestBody @Valid News data,
			@AuthenticationPrincipal UserDetails member) {
		
		logger.info("adminNewsWriteDo");
		
		if(member == null) {
			return new ResponseEntity<>("다시 시도해 주세요", HttpStatus.BAD_REQUEST);
		}
		
		// 데이터 입력 시도
		service.insertNews(data, member);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
