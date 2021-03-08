package com.heatokpia.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.SupportA;
import com.heatokpia.domain.SupportQ;

@Mapper
public interface QnAMapper {

	public void saveQ(SupportQ data);
	
	// map - int page, boolean anser, String id필요
	public List<SupportQ> findQTitleListByAnser(HashMap<String, Object> map);
	
	public List<SupportQ> findQTitleListPlusEmail(int page);
	
	public List<SupportQ> findQTitleListPlusEmailOrderByASC(int page);
	
	public SupportQ findByQSeq(int seq);
	
	public SupportA findByASeq(int seq);
	
	public void saveA(SupportA data);
	
}
