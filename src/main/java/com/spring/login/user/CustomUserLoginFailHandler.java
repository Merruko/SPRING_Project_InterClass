package com.spring.login.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Service
/* 로그인 실패 대응 로직 */
public class CustomUserLoginFailHandler implements AuthenticationFailureHandler {
	
	private String logId;
	private String logPwd;
	private String defaultFailureURL;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		//로그인 페이지에서 아이디와 비밀번호 가져오기
		String username = request.getParameter(logId);
		String password = request.getParameter(logPwd);
		
		if (exception instanceof AuthenticationServiceException) {
			request.setAttribute("loginFailMsg", "存在しないアカウントです。");
		
		} else if(exception instanceof BadCredentialsException) {
			request.setAttribute("loginFailMsg", "IDまたはパスワードが間違えました。");
			
		} else if(exception instanceof InternalAuthenticationServiceException) {
			request.setAttribute("loginFailMsg", "IDまたはパスワードが間違えました。");
			
		} else if(exception instanceof DisabledException) {
			request.setAttribute("loginFailMsg", "活性化されてないアカウントです。");
		}
		
		request.setAttribute(logId, username);
		request.setAttribute(logPwd, password);
		
		//로그인 실패시 이동할 화면 연결, forward를 사용해야만 jstl 가동
		request.getRequestDispatcher(defaultFailureURL).forward(request, response);

	}
		
	public String getLogId() {
		return logId;
	}
	
	public void setLogId(String logId) {
		this.logId = logId;
	}
	
	public String getLogPwd() {
		return logPwd;
	}
	
	public void setLogPwd(String logPwd) {
		this.logPwd = logPwd;
	}
	
	public String getDefaultFailureURL() {
		return defaultFailureURL;
	}
	
	public void setDefaultFailureURL(String defaultFailureURL) {
		this.defaultFailureURL = defaultFailureURL;
	}
		
}