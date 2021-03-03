package com.heatokpia.Service;

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
	
}
