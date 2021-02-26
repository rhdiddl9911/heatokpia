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
	
	public List<NoticeBoard> getNoticeList(String category){
		if(category == null) {
			return noticeMapper.findTitleList();
		}
		if(category.equals("공지사항")) {
			return noticeMapper.findTitleListByCategory(0);
		}else {
			return noticeMapper.findTitleListByCategory(1);
		}
	}
}
