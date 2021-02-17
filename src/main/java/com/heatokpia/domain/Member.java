package com.heatokpia.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Member implements UserDetails{
	
	private String member_id;
	private String password;
	private String name;
	private String e_mail;
	private boolean satus;
	private Collection<? extends GrantedAuthority> role;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// 권한 목록 리턴
		return role;
	}
	@Override
	public String getPassword() {
		return password;
	}
	@Override
	public String getUsername() {
		return member_id;
	}
	
	// 계정 컨트롤은 일단 전부 true입니다. 나중에 status에 따라 추가 로직 구현
	@Override
	public boolean isAccountNonExpired() {
		// 계정 만료 x true o false
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// 계정 잠김 여부 - false가 계정잠김
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// 패스워드 쓸 수 있는지 만료되었는지
		return true;
	}
	@Override
	public boolean isEnabled() {
		// 계정이 사용 가능한 계정인지 리턴
		return true;
	}

}
