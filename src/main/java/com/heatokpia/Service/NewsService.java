package com.heatokpia.Service;

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
	
}
