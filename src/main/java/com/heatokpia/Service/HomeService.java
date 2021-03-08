package com.heatokpia.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.heatokpia.domain.BoardCategory;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HomeService {

	private final BoardService boardService;
	private final NoticeService noticeService;
	private final NewsService newsService;
	
	public HashMap<String, Object> boardNoticeNews(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("freeBoardList", boardService.getBoardList(BoardCategory.free, 1));
		result.put("infoBoardList", boardService.getBoardList(BoardCategory.info, 1));
		result.put("noticeBoardList", noticeService.getNoticeList(1, null, null, null));
		result.put("newsBoardList", newsService.getTitleList(1, null, null));
		
		return result;
	}
	
}
