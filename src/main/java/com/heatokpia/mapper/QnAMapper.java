package com.heatokpia.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.heatokpia.domain.SupportQ;

@Mapper
public interface QnAMapper {

	public void saveQ(SupportQ data);
}
