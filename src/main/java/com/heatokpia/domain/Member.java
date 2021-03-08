package com.heatokpia.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class Member implements UserDetails{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String password;
	private String email;
	private String name;
	private boolean satus;
	private MemberRole role;
	
	@Override
	public String getPassword() {
		return password;
	}
	@Override
	public String getUsername() {
		return id;
	}
	
	// 권한 리턴
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
			//DB에 저장된 룰이 없으면 member ROLE 리턴
			if(role == null) {
				this.role = MemberRole.ROLE_MEMBER;
			}
		roles.add(new SimpleGrantedAuthority(role.toString()));
		return roles;
	}
	
	// 계정 컨트롤은 일단 전부 true입니다. 나중에 status에 따라 추가 로직 구현
	
	// 계정 만료 x true o false
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	// 계정 잠김 여부 - false가 계정잠김
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	// 패스워드 쓸 수 있는지 만료되었는지
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	// 계정이 사용 가능한 계정인지 리턴
	@Override
	public boolean isEnabled() {
		return true;
	}
}
