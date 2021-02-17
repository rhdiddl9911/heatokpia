package com.heatokpia.Service;

import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.heatokpia.domain.Member;
import com.heatokpia.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberDetailsService implements UserDetailsService {

	private final MemberMapper memMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<Member> optional = memMapper.readMemberById(username);
		
		if(!optional.isPresent()) {
			throw new UsernameNotFoundException(username+" 사용자 없음");
		}else {
			Member member = optional.get();
			return member;
		}
	}
}
