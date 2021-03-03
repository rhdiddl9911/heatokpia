package com.heatokpia.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.heatokpia.Service.QnAService;

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
		return model;
	}
}
