package com.heatokpia.Service;

import java.util.HashMap;
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
	
	public List<NoticeBoard> getNoticeList(int page, String category, String searchArea, String search){
		
		if(category == null) {
			if(search == null) {
				// 전체
				return noticeMapper.findTitleList(page);
			}else {
				// 전체 & 검색
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("page", page);
				map.put("searchArea", searchArea);
				map.put("search", search);
				return noticeMapper.findTitleListBySearch(map);
			}
		}else {
			int categorynum = category.equals("공지사항") ? 0 : 1;
			if(search ==null) {
				// 카테고리 
				return noticeMapper.findTitleListByCategory(page, categorynum);
			}else {
				// 카테고리 & 검색
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("page", page);
				map.put("category", categorynum);
				map.put("searchArea", searchArea);
				map.put("search", search);
				return noticeMapper.findTitleListByCategoryAndSearch(map);
			}
		}
	}
	
	public int getMaxPage(String category, String searchArea, String search) {
		if(category == null) {
			if(search == null) {
				// 전체
				return noticeMapper.findMaxPage();
			}else {
				// 전체 & 검색
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("searchArea", searchArea);
				map.put("search", search);
				return noticeMapper.findMaxPageBySearch(map);
			}
		}else {
			int categorynum = category.equals("공지사항") ? 0 : 1;
			if(search == null) {
				// 카테고리 
				return noticeMapper.findMaxPageByCategory(categorynum);
			}else {
				// 카테고리 & 검색
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("category", categorynum);
				map.put("searchArea", searchArea);
				map.put("search", search);
				return noticeMapper.findMaxPageByCategoryAndSearch(map);
			}
		}
	}
}
