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
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;


@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.sessionManagement()
			.maximumSessions(1)
			.maxSessionsPreventsLogin(false).sessionRegistry(sessinoRegistry());
		http.authorizeRequests().antMatchers("/").permitAll();
		http.authorizeRequests().antMatchers("/member/**").authenticated();
		http.authorizeRequests().antMatchers("/admin/**").authenticated();
		//http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");

		http.csrf().disable();
		//http.csrf().csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse());
		http.formLogin();
		
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
