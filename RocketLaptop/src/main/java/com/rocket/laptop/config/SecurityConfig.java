package com.rocket.laptop.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.rocket.laptop.config.auth.PrincipalDetailsService;
import com.rocket.laptop.config.handler.CustomAccessDeniedHandler;
import com.rocket.laptop.config.handler.LoginFailHandler;
import com.rocket.laptop.config.handler.LoginSuccessHandler;

@Configuration
@EnableWebSecurity // 스프링 시큐리티 필터가 스프링 필터체인에 등록
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true) // secured 어노테이션 활성, preAuthorize, postAuthorize 어노테이션 활성화
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable(); // csrf 비활성화
		
		http.authorizeRequests() // 요청 URL에 따라 접근 권한 설정
			.antMatchers("/user/**").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')") // /user 로 시작하는 URL은 ROLE_USER, ROLE_ADMIN 권한만 접근 가능
			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')") // /admin 으로 시작하는 URL은 ROLE_ADMIN 권한만 접근 가능
			.anyRequest().permitAll(); // 다른 모든 요청은 전부 허용
		
		http.formLogin() // form 로그인 이용
			.loginPage("/login") // 해당 주소로 로그인 페이지를 호출한다.
			.loginProcessingUrl("/login") // 해당 URL로 요청이 오면 스프링 시큐리티가 가로채서 로그인 처리를 한다. PrincipalDetailsService의 loadUserByName
			.usernameParameter("user_id") // usernameParameter를 user_id로 설정
			.passwordParameter("user_password") // passwordParameter를useR_password로 설정
			.successHandler(new LoginSuccessHandler()) // 로그인 성공시 요청을 처리할 핸들러
			.failureHandler(new LoginFailHandler()); // 로그인 실패시 요청을 처리할 핸들러
		
		http.logout()
			.logoutUrl("/logout") // 로그아웃 URL
			.logoutSuccessUrl("/login") // 로그아웃 성공시 로그인 페이지로 이동
			.deleteCookies("JSESSIONID") // JSESSIONID 쿠키를 삭제
			.invalidateHttpSession(true); // 인증정보 지우고 세션을 무효화 한다.
		
		http.exceptionHandling()
			.accessDeniedHandler(new CustomAccessDeniedHandler()); // 권한이 없는 페이지 접속시 처리할 핸들러
	}
	
}
