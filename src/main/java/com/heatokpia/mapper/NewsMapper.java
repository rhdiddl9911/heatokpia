package com.heatokpia.mapper;

import java.util.HashMap;
import java.util.List;

import com.heatokpia.domain.News;

public interface NewsMapper {

	// 새로운 뉴스 insert 
	public void save(News data);
	
	// 뉴스 Title List
	public List<News> findTitleList(int page);
	
	// 뉴스 Title List Search - map : int page, String searchArea, String search
	public List<News> findTitleListBySearch(HashMap<String, Object> map);
	
	// 뉴스 Title List MaxPage
	public int findMaxPage();
	
	// 뉴스 Title List MaxPage Search있을때 - map : String searchArea, String search
	public int findMaxPageBySearch(HashMap<String, Object> map);
}
