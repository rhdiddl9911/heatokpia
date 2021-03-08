package com.heatokpia.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;
import javax.websocket.server.PathParam;

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

import com.heatokpia.domain.Member;
import com.heatokpia.domain.SupportA;
import com.heatokpia.dto.SupportQnA;
import com.heatokpia.service.QnAService;

import lombok.RequiredArgsConstructor;

@PreAuthorize("hasRole('ADMIN')")
@Controller
@RequestMapping("/admin/support")
@RequiredArgsConstructor
public class AdminSupportController {
	
	private final QnAService service;

	@GetMapping()
	public ModelAndView adminQnAList() {
		ModelAndView model = new ModelAndView("admin/support/adminqnaQList");
		model.addObject("QList", service.getAdminQList(1));
		model.addObject("QListNoAnser", service.getAdminQListNoAnser(1));
		return model;
	}
	
	@GetMapping("/{seq}")
	public ModelAndView adminQnA(
			@PathVariable int seq) {
		ModelAndView model = new ModelAndView("admin/support/adminqnaDetails");
		
		SupportQnA result = service.getQnA(seq);
		
		model.addObject("question", result.getQuestion());
		model.addObject("anser", result.getAnser());
		
		return model;
	}
	
	// 해당글에 답변 등록
	@PostMapping("/{seq}")
	public @ResponseBody ResponseEntity<?> adminWriteAnser(
			@PathVariable int seq,
			@RequestBody @Valid SupportA anser,
			@AuthenticationPrincipal UserDetails member) {
		
		service.insertAData(seq, member, anser);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
