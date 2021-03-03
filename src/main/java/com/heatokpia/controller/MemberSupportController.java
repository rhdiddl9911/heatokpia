package com.heatokpia.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@PreAuthorize("authenticated()")
@Controller
@RequestMapping("/support/my")
@RequiredArgsConstructor
public class MemberSupportController {

	
}
