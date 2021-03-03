package com.heatokpia.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.heatokpia.domain.Member;
import com.heatokpia.domain.SupportQ;
import com.heatokpia.mapper.QnAMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnAService {

	private final QnAMapper qnaMapper;
	
	public void insertQData(SupportQ data, UserDetails member) {
		data.setQmember((Member) member);
		qnaMapper.saveQ(data);
	}
	
	public List<SupportQ> getQList(int page, boolean anser, UserDetails member){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("anser", anser);
		map.put("id", member.getUsername());
		
		return qnaMapper.findQTitleListByAnser(map);
	}
	
}
