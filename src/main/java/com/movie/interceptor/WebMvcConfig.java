package com.movie.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

	// .addPathPatterns("/**");
	// .excludePathPatterns("/user/*")
	// 여기서 사용할 거기때문에 다른 클래스 파일에 어노테이션 추가 ㄴㄴ염
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
				.addPathPatterns("/book/**", "/admin/**");
	}
	
}