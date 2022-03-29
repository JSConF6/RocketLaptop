package com.rocket.laptop.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.rocket.laptop.interceptor.UserCheckInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Value("${imagePath}")
	private String imagePath;
	
	@Value("${uploadPath}")
	private String uploadPath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
			.addResourceLocations(imagePath);
		
		registry.addResourceHandler("/upload/**")
			.addResourceLocations(uploadPath);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
			registry.addInterceptor(new UserCheckInterceptor())
					.addPathPatterns("/user/**");
	}
	
	
}
