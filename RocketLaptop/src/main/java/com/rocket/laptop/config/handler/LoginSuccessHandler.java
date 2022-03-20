package com.rocket.laptop.config.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.rocket.laptop.config.auth.PrincipalDetails;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		String remember = (String) request.getParameter("remember");
		
		Cookie saveCookie = new Cookie("saveId", authentication.getName());
		if(remember != null) {
			saveCookie.setMaxAge(60*60);
		}else {
			saveCookie.setMaxAge(0);
		}
		
		response.addCookie(saveCookie);
		response.sendRedirect("/");
	}

}
