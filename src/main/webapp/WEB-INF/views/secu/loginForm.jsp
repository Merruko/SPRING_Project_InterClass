<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com    @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>로그인페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" >
<style type="text/css">
body{
    margin-top:20px;
    background:#eee;
}

.container {
    margin-right: auto;
    margin-left: auto;
    padding-right: 15px;
    padding-left: 15px;
    width: 100%;
}

@media (min-width: 576px) {
    .container {
        max-width: 540px;
    }
}

@media (min-width: 768px) {
    .container {
        max-width: 720px;
    }
}

@media (min-width: 992px) {
    .container {
        max-width: 960px;
    }
}

@media (min-width: 1200px) {
    .container {
        max-width: 1140px;
    }
}

.card-columns .card {
    margin-bottom: 0.75rem;
}

@media (min-width: 576px) {
    .card-columns {
        column-count: 3;
        column-gap: 1.25rem;
    }
    .card-columns .card {
        display: inline-block;
        width: 100%;
    }
}
.text-muted {
    color: #9faecb !important;
}

p {
    margin-top: 0;
    margin-bottom: 1rem;
}
.mb-3 {
    margin-bottom: 1rem !important;
}

.input-group {
    position: relative;
    display: flex;
    width: 100%;
}
</style>
<body>
<br>
<br>
	<div class="container text-center" onclick="location.href='<c:url value='/'/>'">
  			<h1>InterClass</h1>
	</div>
<hr>
<br>
<div class="container" style="width: 700px;">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card-group mb-0">
          <div class="card p-4">
            <div class="card-body">
              <h3>Login</h3>
              <p class="text-muted">Sign In to your account</p>
			
		<form action="/login" method="post">
			<!-- ID -->
              <div class="input-group mb-2">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="logId" placeholder="ID">
              </div>
              
            <!-- PASSWORD -->
              <div class="input-group mb-4">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" name="logPwd" placeholder="Password">
              </div>
              
            <!-- LOGIN -->
              <div class="input-group mb-2">
                	<!-- 117행 중요! spring security 관련, 변경하지말 것 -->
                	<button type="submit" class="btn btn-lg btn-primary btn-block">Login</button>
                	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
              </div>
              <div>
              <table>
              	<tr>
              		<td><button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/findId"/>'" >아이디 찾기</button></td>
              		<td><button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/findPwd"/>'" >비밀번호 찾기</button></td>
              		<td><button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/signUp"/>'" >회원가입</button></td>
              	</tr>
              </table>
              </div>
		</form>
          
            </div>
          </div>
          
        </div>
      </div>
    </div>
  </div>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>