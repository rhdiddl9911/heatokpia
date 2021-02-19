package com.heatokpia.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.heatokpia.Service.BoardService;
import com.heatokpia.domain.BoardCategory;
import com.heatokpia.dto.BoardNonMemberDTO;
import com.heatokpia.utils.ClientIP;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private final BoardService service;

	@GetMapping("/{category}")
	public void boardListReturn(@PathVariable String category) {
		
	}
	
	// 카테고리에 따른 보드 리스트 , 뷰 반환 예정
	@GetMapping("/{category}/new")
	public ModelAndView boardWriteView(
			@PathVariable BoardCategory category) {
		logger.info("boardWriteView");
		ModelAndView model = new ModelAndView("board/boardWrite");
		model.addObject("category", category);
		return model;
	}
	
	// 익명 사용자 글추가
	@PostMapping("/{category}/new")
	public @ResponseBody ResponseEntity<?> boardWriteDo(
			@PathVariable BoardCategory category,
			@RequestBody @Valid BoardNonMemberDTO data,
			@ClientIP String ip) {
		
		logger.info("boardWriteDo");
		
		if(ip == null && category == null) {
			return new ResponseEntity<>("다시 시도해 주세요", HttpStatus.BAD_REQUEST);
		}
		
		// 데이터 입력 시도
		service.write(data, ip, category);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}