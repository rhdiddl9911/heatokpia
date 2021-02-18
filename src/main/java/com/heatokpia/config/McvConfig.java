package com.heatokpia.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.heatokpia.utils.ClientIPResolver;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class McvConfig implements WebMvcConfigurer{

	private final ClientIPResolver clientIPResolver;
	
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		resolvers.add(clientIPResolver);
	}
}
