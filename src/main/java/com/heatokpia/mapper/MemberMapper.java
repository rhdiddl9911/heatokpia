package com.heatokpia.mapper;

import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.heatokpia.domain.Member;

@Mapper
public interface MemberMapper {
	
	public void insertTestAdminMember();
	
    public Optional<Member> readMemberById(@Param("member_id") String member_id);
}
