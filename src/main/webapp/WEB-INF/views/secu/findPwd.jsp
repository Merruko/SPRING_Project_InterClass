<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>パスワード検索</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

</head>
<body>
<br>
<br>
<div class="container text-center" onclick="location.href='<c:url value='/'/>'">
  	<h1>InterClass</h1>
</div>
<hr>
<br>
<br>
<form action="/foundPwd" method="post">
<div class="container">
	<div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card-group mb-0">
          <div class="card p-4">
            <div class="card-body">
				<div class="w3-center w3-large w3-margin-top">
					<h3>パスワード検索</h3>
				</div> 
				<div>
					<p>
						<br>
						<label>ID</label>
						<input class="w3-input" type="text" id="u_id" name="u_id" required>
						<label>生年月日</label>
						<input class="w3-input" type="text" id="u_birth" name="u_birth" required>
						<label>TEL</label>
						<input class="w3-input" type="text" id="u_phone" name="u_phone" required>
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-blue w3-ripple w3-margin-top w3-round">検索</button>
						<button type="button" onclick="location.href='<c:url value="/" />'" class="w3-button w3-block w3-blue w3-ripple w3-margin-top w3-margin-bottom w3-round">戻る</button>
					</p>
				</div>
			</div>
		  </div>
		</div>
	  </div>
	</div>
</div>
</form>

</body>
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>