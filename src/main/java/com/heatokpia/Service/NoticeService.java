package com.heatokpia.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.heatokpia.domain.NoticeBoard;
import com.heatokpia.mapper.NoticeBoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeService {

	private final NoticeBoardMapper noticeMapper;
	
	public void insertBoard(NoticeBoard data) {
		noticeMapper.save(data);
	}
	
	public List<NoticeBoard> getNoticeList(int page, String category){
		if(category == null) {
			return noticeMapper.findTitleList(page);
		}
		// 공지사항 : 0
		// 이벤트 : 1
		if(category.equals("공지사항")) {
			return noticeMapper.findTitleListByCategory(page, 0);
		}else {
			return noticeMapper.findTitleListByCategory(page, 1);
		}
	}
	
	public int getMaxPage(String category) {
		if(category == null) {
			return noticeMapper.findMaxPage();
		}
		return 0;
	}
}
