<!-- 회원탈퇴후 home으로 눌렀을 때 데이터는 삭제 됐지만 세션 안 끊겨있음... 
	 임시방편으로 시큐리티의 로그아웃 기능을 가져와서 HOME버튼을 만들고 세션 종료시켜 놓음(210201)
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴완료</title>
</head>
<body>
<h5>${mId}님 그동안 이용해 주셔서 감사합니다.</h5>
<form action="/logout" method="POST">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<button type="submit" class="btn btn-info btn-sm">HOME</button>
</form>

</body>
</html>