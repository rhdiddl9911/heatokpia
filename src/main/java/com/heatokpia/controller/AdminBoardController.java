package com.heatokpia.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.heatokpia.Service.BoardService;
import com.heatokpia.domain.Board;
import com.heatokpia.domain.BoardCategory;

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
	
}
