package com.it16306.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.it16306.interceptors.AuthenInterceptorLogin;

@Configuration
public class InterCeptorConfig implements WebMvcConfigurer{
	@Autowired
	private AuthenInterceptorLogin authen;
	
	public void addInterceptors(InterceptorRegistry registry) {
		
		  registry.addInterceptor(authen) .addPathPatterns("/admin/**")
		  .excludePathPatterns("/login");
		 
	}
}

