package com.heatokpia.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.heatokpia.domain.Member;
import com.heatokpia.domain.News;
import com.heatokpia.mapper.NewsMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NewsService {

	private final NewsMapper newsMapper;
	
	public void insertNews(News data, UserDetails member) {
		data.setMember((Member) member);
		newsMapper.save(data);
	}
	
	public List<News> getTitleList(int page, String searchArea, String search) {
		if(searchArea == null) {
			return newsMapper.findTitleList(page);
		}else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("page", page);
			map.put("searchArea", searchArea);
			map.put("search", search);
			return newsMapper.findTitleListBySearch(map);
		}
	}
	
	public int getMaxPage(String searchArea, String search) {
		// 아예 0 처리까지 하기위한 result
		int result;
		
		if(searchArea == null) {
			result = newsMapper.findMaxPage();
		}else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("searchArea", searchArea);
			map.put("search", search);
			result = newsMapper.findMaxPageBySearch(map);
		}
		return result == 0 ? 1 : result;
	}
	
	public News getNewsData(int seq) {
		return newsMapper.findBySeq(seq);
	}
	
	public void deleteNewsData(int seq) {
		newsMapper.deleteBySeq(seq);
	}
}
