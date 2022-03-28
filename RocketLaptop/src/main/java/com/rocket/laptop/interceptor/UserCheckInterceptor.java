package com.rocket.laptop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.config.web.server.SecurityWebFiltersOrder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;

import com.rocket.laptop.config.auth.PrincipalDetails;

public class UserCheckInterceptor implements HandlerInterceptor{
	
	private final Logger logger = LoggerFactory.getLogger(UserCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("UserCheck 인터셉터 실행");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(!request.getParameter("user_id").equals(authentication.getName())) {
			response.sendRedirect("/");
			return false;
		}
		
		return true;
	}
	
}
