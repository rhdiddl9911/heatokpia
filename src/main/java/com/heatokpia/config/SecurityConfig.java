package com.heatokpia.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;


@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// 로그인 1명만 되게, 나중에 로그인한 사람이 로그인됨
		http.sessionManagement()
			.maximumSessions(1)
			.maxSessionsPreventsLogin(false)
			.sessionRegistry(sessinoRegistry());
		
		// 권한 접근 url 설정
		http.authorizeRequests().antMatchers("/").permitAll();
		//http.authorizeRequests().antMatchers("/member/**").authenticated();
		http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");

		http.csrf().disable();
		//http.csrf().csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse());
		
		// 기본 로그인과 기본 로그아웃 사용
		http.formLogin().and().logout();
		
	}
	
	@Bean
	public PasswordEncoder PasswordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
	
	@Bean
	public SessionRegistry sessinoRegistry() {
		return new SessionRegistryImpl();
	}
	
	

}
