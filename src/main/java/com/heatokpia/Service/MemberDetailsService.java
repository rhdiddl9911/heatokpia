package com.heatokpia.Service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.heatokpia.domain.Member;
import com.heatokpia.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // final 붙은 필드는 자동으로 생성자로 받습니다 (Autowired없어도 의존성 주입)
public class MemberDetailsService implements UserDetailsService{

	private final MemberMapper memMapper;
	private final PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member member = memMapper.findById(username);
		
		if(member != null) {
			return member;
		}else {
			throw new UsernameNotFoundException(username);
		}
		
	}
	
	public Member save(Member member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memMapper.save(member);
		return member;
	}
	
}
