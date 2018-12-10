package com.movie.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("mb_ID");
		// 세션값 id가 없으면 loginForm.jsp 화면으로 이동
		if (id == null) {

			response.sendRedirect("/movie");
			return false;
		}
		
		return true;
	}		
	
}