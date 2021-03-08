package com.heatokpia.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.heatokpia.domain.Member;
import com.heatokpia.domain.SupportA;
import com.heatokpia.domain.SupportQ;
import com.heatokpia.dto.SupportQnA;
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
	
	public List<SupportQ> getAdminQList(int page){
		return qnaMapper.findQTitleListPlusEmail(page);
	}
	
	public List<SupportQ> getAdminQListNoAnser(int page){
		return qnaMapper.findQTitleListPlusEmailOrderByASC(page);
	}
	
	public SupportQnA getQnA(int seq){
		SupportQ qresult = qnaMapper.findByQSeq(seq);
		SupportA aresult;
		
		if(qresult.isAnser()) {
			aresult = qnaMapper.findByASeq(seq);
		}else {
			aresult = null;
		}
		
		SupportQnA result = new SupportQnA();
		result.setQuestion(qresult);
		result.setAnser(aresult);
		
		return result;
	}
	
	public void insertAData(int seq, UserDetails member, SupportA data) {
		data.setQSeq(seq);
		data.setAmember((Member) member);
		qnaMapper.saveA(data);
	}
	
}
