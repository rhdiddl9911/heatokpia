package com.heatokpia.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.heatokpia.domain.Member;

@Mapper
public interface MemberMapper {
	
	// 아이디로 member 찾기
    public Member findById(@Param("member_id") String member_id);
    
    // 멤버 insert
	public void save(Member member);
	
}
