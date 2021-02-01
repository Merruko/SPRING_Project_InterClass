<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>회원탈퇴(로그인)</title>
</head>
<body class="container">
<%@include file="../menu.jsp" %>

    <div class="jumbotron">
        <h1>로그인</h1>
        <p>회원탈퇴를 원하신다면 아이디와 비밀번호를 입력해주십시오.</p>
    </div>

    <!-- 로그인 폼: https://getbootstrap.com/docs/4.1/components/forms/ -->
    <form action="deleteMember" method="post">
        <div class="form-group">
            <label>아이디</label>
            <input name="mId" type="text" class="form-control" />
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input name="mPwd" type="password" class="form-control" />
        </div>
        <button type="submit" class="btn btn-primary">탈퇴</button>
    </form>
    
</body>
</html>