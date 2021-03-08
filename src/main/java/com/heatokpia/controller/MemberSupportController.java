package com.heatokpia.controller;

import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.heatokpia.Service.QnAService;
import com.heatokpia.domain.SupportQ;
import com.heatokpia.dto.SupportQnA;

import lombok.RequiredArgsConstructor;

@PreAuthorize("isAuthenticated()")
@Controller
@RequestMapping("/support/my")
@RequiredArgsConstructor
public class MemberSupportController {

	private final QnAService service;
	
	@GetMapping("/new")
	public ModelAndView qWriteView() {
		ModelAndView model = new ModelAndView("support/qnaQWrite");
		return model;
	}
	
	@PostMapping("/new")
	public @ResponseBody ResponseEntity<?> qWriteDo(
			@RequestBody @Valid SupportQ data,
			@AuthenticationPrincipal UserDetails member){
		service.insertQData(data, member);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@GetMapping()
	public ModelAndView myQList(
			@RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer fpage,
			@AuthenticationPrincipal UserDetails member) {
		
		if(page == null) page = 1;
		if(fpage == null) fpage = 1;
		
		ModelAndView model = new ModelAndView("support/qnaQList");
		model.addObject("nonfinishQList", service.getQList(page, false, member));
		model.addObject("finishQList", service.getQList(page, true, member));
		return model;
	}
	
	@GetMapping("/{seq}")
	public ModelAndView adminQnA(
			@PathVariable int seq) {
		ModelAndView model = new ModelAndView("support/qnaDetails");
		
		SupportQnA result = service.getQnA(seq);
		model.addObject("question", result.getQuestion());
		model.addObject("anser", result.getAnser());
		return model;
	}
}
