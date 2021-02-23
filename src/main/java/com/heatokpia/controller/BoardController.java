package com.heatokpia.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.heatokpia.Service.BoardService;
import com.heatokpia.domain.Board;
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

	// 카테고리에 따른 보드 리스트, 뷰 반환
	@GetMapping("/{category}")
	public ModelAndView boardListReturn(
			@PathVariable BoardCategory category,
			@RequestParam(required = false) Integer page,
			@RequestParam(required = false) String searchArea,
			@RequestParam(required = false) String search) {
		ModelAndView model = new ModelAndView("board/boardList");
		
		// page 없이 접근 하였을 때 1번 페이지로 redirect
		if(page == null) {
			model.setViewName("redirect:/board/"+category);
			model.addObject("page", 1);
			return model;
		}
		
		// 최대 페이지 크기
		int maxPage;
		
		//최대 페이지 구하기 
		//검색 여부에 따라 동작 달라짐
		if(searchArea == null) {
			maxPage = service.getBoardListMaxPage(category.getCategoryNum());
		}else {
			// 검색 영역은 있는데 검색어가 없으면 return 후에 view에서도 막기
			if(search == null || search.isEmpty()) {
				model.setViewName("redirect:/board/"+category);
				return model;
			}
			maxPage = service.getBoardListMaxPage(category.getCategoryNum(), searchArea, search);
		}
		
		// 입력된 페이지 크기가 MaxPage보다 크면 redirect
		if(page > maxPage) {
			model.setViewName("redirect:/board/"+category);
			model.addObject("page", maxPage);
			return model;
		}
		
		// boardList 구하기
		List<Board> boardList;
		
		// 검색 여부에 따라 List 달리 가져옴
		if (searchArea == null) {
			boardList = service.getBoardList(category, page);
		}else {
			boardList = service.getBoardList(category, page, searchArea, search);
		}
		
		model.addObject("category", category);
		model.addObject("boardList", boardList);
		model.addObject("maxPage", maxPage);
		return model;
	}
	
	// 카테고리에따른 글쓰기 폼 반환
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
	
	// 글 Detail반환
	@GetMapping("/{category}/{seq}")
	public ModelAndView boardDetail(
			@PathVariable BoardCategory category,
			@PathVariable int seq) {
		ModelAndView model = new ModelAndView("board/boardDetail");
		model.addObject("category", category);
		model.addObject("boardData", service.getBoardData(seq));
		return model;
	}
	
	
	// PassCheck
	@PostMapping("/{category}/{seq}")
	public ModelAndView boardPassCheckView(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@RequestParam String method) {
		ModelAndView model = new ModelAndView("board/boardPassCheck");
		model.addObject("category", category);
		model.addObject("seq", seq);
		model.addObject("method", method);
		return model;
	}
	
	// 글 수정
	@PostMapping("/{category}/{seq}/up")
	public ModelAndView boardUpdateView(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@RequestParam String password) {
		
		ModelAndView model = new ModelAndView();
		
		if(service.passCheck(seq, password)) {
			// 비밀번호 맞으면
			model.setViewName("board/boardUpdate");
			model.addObject("category", category);
			model.addObject("seq", seq);
			model.addObject("boardData", service.getBoardData(seq));
			return model;
		}else {
			// 비밀번호 틀리면
			model.setViewName("redirect:/board/"+category+"/"+seq);
			return model;
		}
	}
	
	// 글 수정
	@PostMapping("/{category}/{seq}/up/do")
	public @ResponseBody ResponseEntity<?> boardDataUpdate(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@RequestBody @Valid BoardNonMemberDTO data,
			@ClientIP String ip) {
		if(ip == null && category == null) {
			return new ResponseEntity<>("다시 시도해 주세요", HttpStatus.BAD_REQUEST);
		}
		// 데이터 수정시도
		service.updateBoardData(seq , data, ip);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// 글 삭제
	@PostMapping("/{category}/{seq}/del")
	public ModelAndView boardDataDel(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@RequestParam String password) {
		
		ModelAndView model = new ModelAndView();
		
		if(service.passCheck(seq, password)) {
			// 비밀번호 맞으면
			service.deleteBoardData(seq);
			
			model.setViewName("redirect:/board/"+category);
			return model;
		}else {
			// 비밀번호 틀리면
			model.setViewName("redirect:/board/"+category+"/"+seq);
			return model;
		}
	}
	
}
