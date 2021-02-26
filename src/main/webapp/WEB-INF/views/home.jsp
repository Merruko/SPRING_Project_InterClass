<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String user= "";
	if(principal != null) {
	    user = auth.getName();
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>Interclass</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
</head>

<body>

<!-- 권한에 따라 접속 가능한 페이지를 나눴음 -->
<!--  모두가 사용 가능한 페이지 -->
<a href='<c:url value="/page" />'>GUEST</a>

<!-- 사용자가 로그인 했을 때 사용가능한 페이지 -->
<a href='<c:url value="/user/page" />'>USER</a>

<!-- admin 로그인 했을 때 사용가능한 페이지-->
<a href='<c:url value="/admin/page" />'>ADMIN</a>

<!-- 사용자명 받아오기 (8~14행)-->
<h5><%=user %> 様、こんにちは。</h5>

<!-- 로그인 -->
<sec:authorize access="isAnonymous()">
    <h5><a href='<c:url value="/login"/>'>ログイン</a> ログインしてください。</h5>
</sec:authorize>

<!-- 로그아웃 -->
<sec:authorize access="isAuthenticated()">
    <form action="/logout" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">ログアウト</button>
    </form>
</sec:authorize>

<!-- 회원가입 및 회원목록 불러오기 버튼 -->
<a href="${path}/signUp"><button type="button">会員登録</button></a>
<a href="${path}/list"><button type="button">会員リスト</button></a>

</body>
</html>