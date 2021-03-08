package com.heatokpia.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.heatokpia.domain.BoardComment;
import com.heatokpia.dto.BoardNonMemberDTO;
import com.heatokpia.service.BoardService;
import com.heatokpia.utils.ClientIP;

import lombok.RequiredArgsConstructor;

@Controller
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
		
		// page 없이, page 0 보다 작게 접근 하였을 때 1번 페이지로 redirect
		if(page == null || page <= 0) {
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

		// 데이터가 없어서 maxPage가 0일때!
		if(maxPage == 0) {
			maxPage = 1;
		}
		
		// 입력된 페이지 크기가 MaxPage보다 크면 redirect
		if(page > maxPage) {
			RedirectView review = new RedirectView("/board/"+category+"?page="+maxPage);
			review.setContextRelative(true); 
			// RedirectView 사용 해봄
			//model.setViewName();
			//model.addObject("page", maxPage);
			model.setView(review);
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
		Board data = service.getBoardData(seq);
		// 글 번호 정보가 없으면
		if(data == null) {
			model.setViewName("redirect:/board/"+category);
			return model;
		}
		model.addObject("category", category);
		model.addObject("boardData", data);
		model.addObject("commentList", service.getCommentList(seq));
		model.addObject("likeCount", service.getLikeCount(seq));
		return model;
	}
	
	
	// PassCheck
	@PostMapping("/{category}/{seq}/pass")
	public ModelAndView boardPassCheckView(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@RequestParam("method") String method) {
		ModelAndView model = new ModelAndView("board/boardPassCheck");
		model.addObject("category", category);
		model.addObject("seq", seq);
		model.addObject("method", method);
		return model;
	}
	
	// 글 수정 화면반환
	@PostMapping("/{category}/{seq}/up")
	public ModelAndView boardUpdateView(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@RequestParam("password") String password) {

		ModelAndView model = new ModelAndView();
		
		if(password == null || !service.passCheck(seq, password)) {
			// 비밀번호 틀리면 null 반환하고 view에서 처리 
			// --------------------------------- 더 좋은 방법?
			//model.addObject("back", true);
			//return model;
			return null;
		}
		// 비밀번호 맞으면 수정화면 반환
		model.setViewName("board/boardUpdate");
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
	public @ResponseBody ResponseEntity<?> boardDataDel(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@RequestParam String password) {
		
		if(password == null || !service.passCheck(seq, password)) {
			// 비밀번호 틀리면
			return new ResponseEntity<>("맞지 않습니다", HttpStatus.BAD_REQUEST);
		}
		
		// 비밀번호 맞으면
		service.deleteBoardData(seq);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// 댓글 추가
	@PostMapping("/{category}/{seq}/new")
	public @ResponseBody ResponseEntity<?> boardCommentWriteDo(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@RequestBody @Valid BoardComment data,
			@ClientIP String ip) {
		
		logger.info("boardCommentWriteDo");
		
		if(ip == null && category == null) {
			return new ResponseEntity<>("다시 시도해 주세요", HttpStatus.BAD_REQUEST);
		}
		
		// 데이터 입력 시도
		service.writeComment(data, ip, seq);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// 좋아요 동작
	@PostMapping("/{category}/{seq}/like")
	public @ResponseBody ResponseEntity<?> boardLikeDo(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@ClientIP String ip) {
		
		logger.info("boardLikeDo");
		
		if(ip == null && category == null) {
			return new ResponseEntity<>("다시 시도해 주세요", HttpStatus.BAD_REQUEST);
		}
		
		// 데이터 입력 시도
		String result = service.likeDo(ip, seq);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	// 댓글 삭제
	@PostMapping("/{category}/{seq}/{commentseq}")
	public @ResponseBody ResponseEntity<?> boardCommentDelDo(
			@PathVariable BoardCategory category,
			@PathVariable int seq,
			@PathVariable int commentseq,
			@RequestParam String password) {
		
		logger.info("boardCommentDelDo");
		// 데이터 삭제 시도
		if(service.deleteBoardComment(commentseq, password)) {
			// 성공하면
			return new ResponseEntity<>("삭제 되었습니다.", HttpStatus.OK);
		}else {
			// 실패하면
			return new ResponseEntity<>("실패 하였습니다.", HttpStatus.BAD_REQUEST);
		}
	}
	
}
