package com.spring.login.user;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class CustomUserLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	Logger log = Logger.getLogger(getClass());
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	private String logId;
	private String defaultSuccessURL;
	
	@Resource(name="userLoginService")
	private UserDetailsService userSer;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		//에러 세션 지우기(51~56행)
		clearAuthenticationAttributes(request);
		
		//Redirect URL 작업(51~84행)
		resultRedirectStrategy(request, response, authentication);
		
	}
	
	//세션 지우기 메서드
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session==null) return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	//Redirect URL 지정 메서드
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
		Authentication authentication) throws IOException, ServletException {
		
			SavedRequest savedRequest = requestCache.getRequest(request, response);
		
			if(savedRequest!=null) {
				log.debug("권한이 필요한 페이지에 접근했을 경우");
				useSessionUrl(request, response);
			} else {
				log.debug("직접 로그인 url로 이동했을 경우");
				useDefaultUrl(request, response);
			}
			
	}
	
	protected void useSessionUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String targetUrl = savedRequest.getRedirectUrl();
		redirectStratgy.sendRedirect(request, response, targetUrl);
	}
	
	protected void useDefaultUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		redirectStratgy.sendRedirect(request, response, defaultSuccessURL);
	}
		
	public String getLogId() {
		return logId;
	}

	public void setLogId(String logId) {
		this.logId = logId;
	}

	public String getDefaultSuccessURL() {
		return defaultSuccessURL;
	}

	public void setDefaultSuccessURL(String defaultSuccessURL) {
		this.defaultSuccessURL = defaultSuccessURL;
	}

}