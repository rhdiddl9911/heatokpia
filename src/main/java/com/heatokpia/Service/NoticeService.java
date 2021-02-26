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
	
	public List<NoticeBoard> getNoticeList(){
		return noticeMapper.findTitleList();
	}
}
