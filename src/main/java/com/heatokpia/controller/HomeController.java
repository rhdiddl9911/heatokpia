package com.heatokpia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@GetMapping()
	public ModelAndView indexReturn() {
		ModelAndView model = new ModelAndView("index");
		return model;
	}
	
	@GetMapping("/workzone")
	public ModelAndView workZone() {
		ModelAndView model = new ModelAndView("inging");
		return model;
	}
}
