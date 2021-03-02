package com.heatokpia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("")
	public String testAdminPage() {
		return "admin/adminIndex";
	}
	
	@GetMapping("/manage")
	public String selectView() {
		return "admin/boardSelect";
	}
}
