package com.spring.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	//로그인
	@RequestMapping(value="/login")
	public String loginPage() throws Exception {
		return "/secu/loginForm";
	}
	
	//로그인 실패
	@RequestMapping(value="/loginFail")
	public String loginFail() throws Exception {
		return "/secu/loginFail";
	}
	
	//접근불가 화면 (403error)
	@RequestMapping(value="/access_denied")
	public String accessDenied() throws Exception {
		return "/secu/access_denied_page";
	}
	
	//로그아웃은 security-context.xml 자동설정되어 있음. path url = "/logout"
	
}