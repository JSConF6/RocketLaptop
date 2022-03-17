package com.rocket.laptop.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity // 스프링 시큐리티 필터가 스프링 필터체인에 등록
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true) // secured 어노테이션 활성, preAuthorize, postAuthorize 어노테이션 활성화
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		
		http.authorizeRequests()
		.antMatchers("/user/**").authenticated()
		.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
		.anyRequest().permitAll()
		.and()
		.formLogin()
		.loginPage("/login")
		.loginProcessingUrl("/login")
		.defaultSuccessUrl("/");
	}
	
}
