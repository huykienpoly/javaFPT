package com.it16306.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.it16306.interceptors.DemoLogInterceptors;
@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer {
	@Autowired
private DemoLogInterceptors demoLogInterceptors;
	@Override
	public void addInterceptors(InterceptorRegistry registry)
	{
		registry.addInterceptor(demoLogInterceptors)
			.addPathPatterns("/hello");
	}
	

}
