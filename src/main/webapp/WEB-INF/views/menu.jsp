<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
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
<meta charset="UTF-8">
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
	.navbar{
		margin-bottom:0;
		border-radius:0;
	}


	.menu{
		margin-right:30px;
	}
	.menulast{
		margin-right:50px;
	}
</style>
<body>
<nav class="navbar navbar-default">
  	<div class="collapse navbar-collapse" id="myNavbar">
  		<ul class="nav navbar-nav navbar-right">
  		
		    <!-- 로그인하지 않은 사용자가 접근했을 때에만 등장 -->
			<!-- 로그인, 회원가입 -->
			<sec:authorize access="isAnonymous()">
				<li>
					<button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/login"/>'" >로그인</button>
			    </li>
			    <li>
			  		<button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/signUp"/>'" >회원가입</button>
			    </li>
			</sec:authorize>
			
			<!-- 로그인한 경우에만 등장 -->
			<!-- 로그아웃, 내정보 -->
			<sec:authorize access="hasRole('ROLE_USER')">
				<li>
					<h5><%=user%>님, 반갑습니다.</h5>
				</li>
				<li>
				    <form action="/logout" method="POST">
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				        <button type="submit" class="btn btn-info btn-link">LOGOUT</button>
				    </form>
			    </li>
			    <li>
			    	<button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/memberInfo"/>'" >내정보</button>
			    </li>
			</sec:authorize>
			
			<!-- 관리자(admin)이 로그인 했을때에만 등장 -->
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li>
					<h5><%=user%>님, 반갑습니다.</h5>
				</li>
				<li>
					<form action="/logout" method="POST">
			        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			        	<button type="submit" class="btn btn-info btn-link">LOGOUT</button>
			    	</form>
				</li>
				<li>
					<button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/listMemberAll"/>'" >회원관리</button>
				</li>
			</sec:authorize>
		</ul>
    </div>
    </nav>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a id="logo" class="navbar-brand" href='<c:url value='/'/>'>InterClass</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
    	<!-- 모든 사용자에게 오픈 -->
    	<sec:authorize access="isAnonymous()">
    			<li class="menu"><a href='<c:url value='/lecture/list'/>'>강의정보</a></li>
      			<li class="menu"><a href='<c:url value='/reser/reservation'/>'>예약하기</a></li>
     			<li class="menulast"><a href='<c:url value='notice/getBoardList'/>'>공지사항</a></li>
     	</sec:authorize>
     	
     	<!-- 관리자에게만 오픈 -->		
    	<sec:authorize access="hasRole('ROLE_ADMIN')">
    			<li class="menu"><a href='<c:url value='/lecture/list'/>'>강의정보</a></li>
      			<li class="menu"><a href='<c:url value='/lecture/writeView'/>'>강의등록</a></li>
      			<li class="menu"><a href='<c:url value='/reser/adminOrderList'/>'>예약관리</a></li>
     			<li class="menulast"><a href='<c:url value='/notice/getBoardList'/>'>공지사항</a></li>
    	</sec:authorize>
    	
    	<!-- 로그인한 사용자에게만 오픈 -->
    	<sec:authorize access="hasRole('ROLE_USER')">
    			<li class="menu"><a href='<c:url value='/lecture/list'/>'>강의정보</a></li>
      			<li class="menu"><a href='<c:url value='reser/reservation'/>'>예약하기</a></li>
      			<li class="menu"><a href='<c:url value='/reser/myLecture'/>'>나의강의</a></li>
      			<li class="menu"><a href='<c:url value='/lecture/cartList'/>'>찜한강의</a></li>
     			<li class="menulast"><a href='<c:url value='/notice/getBoardList'/>'>공지사항</a></li>
    	</sec:authorize>
    </ul>
  </div>
</nav>
</body>
</html>