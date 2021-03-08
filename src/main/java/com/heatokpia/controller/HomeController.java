package com.heatokpia.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.heatokpia.domain.Member;
import com.heatokpia.domain.MemberRole;
import com.heatokpia.dto.MemberValue;
import com.heatokpia.service.HomeService;
import com.heatokpia.service.MemberDetailsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final HomeService service;
	private final MemberDetailsService memberService;
	
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
	
	@GetMapping(value = "/login")
	public String login(@AuthenticationPrincipal UserDetails securityUser){
		if(securityUser != null) {
			return "redirect:/";
		}
		return "thymeleaf/login/login";
	}
	
//	@PostMapping(value = "/logout")
//	public String logout(@AuthenticationPrincipal UserDetails securityUser){
//		return "redirect:/";
//	}
	
	@GetMapping(value = "/err/denied-page")
	public String accessDenied(){
		return "thymeleaf/err/deniedPage";
	}
	
	@GetMapping(value = "/join")
	public String joinForm(@AuthenticationPrincipal UserDetails securityUser){
		if(securityUser != null) {
			return "redirect:/";
		}
		return "thymeleaf/login/join";
	}
	
	@ResponseBody
	@PostMapping(value = "/join")
	public Map<String, Object> join(@RequestBody Member value){
		Map<String, Object> response = new HashMap<>();
		
		if(memberService.findById(value.getId()) != null) {
			response.put("duplicate", true);
			return response;
		}
		
		response.put("success", memberService.save(value) != null ? true : false);
		return response;
	}
}
