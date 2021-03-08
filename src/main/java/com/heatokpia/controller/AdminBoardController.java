package com.heatokpia.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.heatokpia.domain.Board;
import com.heatokpia.domain.BoardCategory;
import com.heatokpia.dto.BoardNonMemberDTO;
import com.heatokpia.service.BoardService;
import com.heatokpia.utils.ClientIP;

import lombok.RequiredArgsConstructor;

@Controller
@PreAuthorize("hasRole('ADMIN')")
@RequestMapping("/admin/board")
@RequiredArgsConstructor
public class AdminBoardController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private final BoardService service;

	// 카테고리에 따른 보드 리스트, 뷰 반환
	@GetMapping("/{category}")
	public ModelAndView boardListReturn(
			@PathVariable BoardCategory category,
			@RequestParam(required = false) Integer page,
			@RequestParam(required = false) String searchArea,
			@RequestParam(required = false) String search) {
		ModelAndView model = new ModelAndView("admin/board/adminboardList");
		
		// page 없이, page 0 보다 작게 접근 하였을 때 1번 페이지로 redirect
		if(page == null || page <= 0) {
			model.setViewName("redirect:/admin/board/"+category);
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
				model.setViewName("redirect:/admin/board/"+category);
				return model;
			}
			maxPage = service.getBoardListMaxPage(category.getCategoryNum(), searchArea, search);
		}

		// 데이터가 없어서 maxPage가 0일때!
		if(maxPage == 0) {
			maxPage = 1;
		}
		
		// 입력된 페이지 크기가 MaxPage보다 크면 redirect
		if(page > maxPage) {
			RedirectView review = new RedirectView("/admin/board/"+category+"?page="+maxPage);
			review.setContextRelative(true); 
			// RedirectView 사용 해봄
			//model.setViewName();
			//model.addObject("page", maxPage);
			model.setView(review);
			return model;
		}
		
		// boardList 구하기
		List<Board> boardList = service.getAdminViewList(page, category.getCategoryNum(), searchArea, search);
		
		model.addObject("category", category);
		model.addObject("boardList", boardList);
		model.addObject("maxPage", maxPage);
		return model;
	}
	
	// 글 Detail반환
	@GetMapping("/{category}/{seq}")
	public ModelAndView boardDetail(
			@PathVariable BoardCategory category,
			@PathVariable int seq) {
		ModelAndView model = new ModelAndView("admin/board/adminboardDetail");
		Board data = service.getBoardDataNoHit(seq);
		// 글 번호 정보가 없으면
		if(data == null) {
			model.setViewName("redirect:/admin/board/"+category);
			return model;
		}
		model.addObject("category", category);
		model.addObject("boardData", data);
		model.addObject("commentList", service.getCommentList(seq));
		model.addObject("likeCount", service.getLikeCount(seq));
		return model;
	}
	
	// 글 수정 화면반환
	@GetMapping("/{category}/{seq}/up")
	public ModelAndView boardUpdateView(
			@PathVariable BoardCategory category,
			@PathVariable int seq) {

		ModelAndView model = new ModelAndView();
		
		// 수정화면 반환
		model.setViewName("admin/board/adminboardUpdate");
		model.addObject("category", category);
		model.addObject("seq", seq);
		model.addObject("boardData", service.getBoardData(seq));
		return model;
		
	}
	
	// 글 수정 시도
	@PostMapping("/{category}/{seq}/up/do")
	public @ResponseBody ResponseEntity<?> boardDataUpdate(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@RequestBody @Valid Board data) {
		if(category == null) {
			return new ResponseEntity<>("다시 시도해 주세요", HttpStatus.BAD_REQUEST);
		}
		// 데이터 수정시도
		service.adminUpdateBoardData(seq, data);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// 글 삭제
	@PostMapping("/{category}/{seq}/del/do")
	public @ResponseBody ResponseEntity<?> boardDataDel(
			@PathVariable BoardCategory category,
			@PathVariable int seq) {
		
		// 글 삭제
		try {
			service.deleteBoardData(seq);
			logger.info("boardDataDel:"+seq+"---OK");
			return new ResponseEntity<>(HttpStatus.OK);
		}catch (Exception e) {
			logger.error("boardDataDel:"+seq+"---Exception:"+e.toString());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	// 댓글 삭제
	@PostMapping("/{category}/{seq}/{commentseq}/del/do")
	public @ResponseBody ResponseEntity<?> boardCommentDelDo(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@PathVariable int commentseq) {
		
		logger.info("boardCommentDelDo");
		// 데이터 삭제 시도
		try{
			service.adminDeleteBoardComment(commentseq);
			logger.info("boardCommentDelDo:"+commentseq+"---OK");
			return new ResponseEntity<>(HttpStatus.OK);
		}catch (Exception e) {
			logger.error("boardCommentDelDo:"+commentseq+"---Exception:"+e.toString());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
