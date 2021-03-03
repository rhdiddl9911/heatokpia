package com.heatokpia.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.SupportQ;

@Mapper
public interface QnAMapper {

	public void saveQ(SupportQ data);
	
	// map - int page, boolean anser, String id필요
	public List<SupportQ> findQTitleListByAnser(HashMap<String, Object> map);
}
