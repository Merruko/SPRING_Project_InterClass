<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='<c:url value="/login"/>';
		})
	})
	
	var msg = '${msg}';
	if (msg != '') {
       alert(msg);
		history.go(-1);
	}
	
	function change(){
		var pwd1 = $("#passCh1").val();
		var pwd2 = $("#mPwd").val();
			
			if(pwd1 == null || pwd2 == null){
				alert('空白は入力できません。');
				return false;
			} else if(pwd1.search(/\s/) != -1 || pwd2.search(/\s/) != -1){
				alert('空白は入力できません。');
				return false;
			} else if(pwd2.length < 4 || pwd2.length > 16){
				alert('4~16文字の以内にの英文、数字、特殊文字で入力してください。');
				return false;
			} else if(pwd1 != pwd2){
				alert('変更するパスワードを同一に入力してください。');
				return false;
			} else if(pwd1 == pwd2){
				alert('パスワードを変更しました。改めてログインしてください。');
				return true;
			}
			
	}
</script>

<title><title>パスワード検索結果</title></title>
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
<form action="modifyPwd" method="post">
<input type="text" name="mId" id="mId" value="${mId}" style="visibility:hidden">
<div class="container">
	<div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card-group mb-0">
          <div class="card p-4">
            <div class="card-body">
				<div class="row">
	<div class="col">
	<p><h4>変更するパスワードを入力してください。</h4>
	<p><h6>4~16文字の以内にの英文、数字、特殊文字で入力してください。</h6> 
	<p><h6>空白は入力できません。</h6>
	</div>
</div>
<br>
<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>新しいパスワード</b></label>
			<input class="form-control mb-2" type="password" name="passCh1" id="passCh1">
		</div>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>パスワード確認</b></label>
			<input class="form-control mb-5" type="password" name="mPwd" id="mPwd">
		</div>
	</div>
</div>
					<p class="w3-center">
						<button type="submit" onclick="return change();" class="w3-button w3-block w3-blue w3-ripple w3-margin-top w3-margin-bottom w3-round">変更</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-blue w3-ripple w3-margin-top w3-margin-bottom w3-round">戻る</button>
					</p>
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