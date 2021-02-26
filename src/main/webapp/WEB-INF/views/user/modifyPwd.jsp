<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パスワード変更</title>
</head>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	body{
    margin-top:20px;
    background:#f8f8f8;
	}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function change(){
	var pwd1 = $("#passCh1").val();
	var pwd2 = $("#mPwd").val();
	
	if($("#userPwd").val() == $("#passNOW").val()){
		
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
		
	} else {
		alert('パスワードが一致しません。');
		return false;
	}
	
}
</script>

<body>
<br>
	<div class="container text-center" onclick="location.href='<c:url value='/'/>'">
  		<h1>InterClass</h1>
	</div>
<br>
<hr>

<div class="container" style="width: 800px;">
	<div class="row flex-lg-nowrap">
	<div class="col-12 col-lg-auto mb-3" style="width: 210px;">
    <div class="card p-3">
      <div class="e-navlist e-navlist--active-bg">
        <ul class="nav">
          <li class="nav-item"><a class="nav-link px-2 active" href="${path}/memberInfo"><span>｜マイページ</span></a></li>
          <li class="nav-item"><a class="nav-link px-2 active" href="${path}/updateMember?mId=${mId}"><span>｜情報修正</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${path}/modifyPwdForm?mId=${mId}"><span>｜パスワード変更</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${path}/deleteMyAccount"><span>｜会員脱退</span></a></li>
         </ul>
       </div>
     </div>
   </div>
   
   <div class="col">
    <div class="row">
      <div class="col mb-3">
        <div class="card">
          <div class="card-body">
            <div class="e-profile">
              <div class="tab-content pt-3">
              
<form action="modifyPwd" method="post" >

<div class="row">
<div class="col">
<div class="row">
<div class="col">

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
			<label><b>現在のパスワード</b></label>
			<input class="form-control mb-2" type="password"  name="passNOW" id="passNOW">
		</div>
	</div>
</div>
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

<input type="text" name="mId" id="mId" value="${mId}" style="visibility:hidden">
<input type="text" name="userPwd" id="userPwd" value="${currentPwd}" style="visibility:hidden">

<div class="form-row float-right">
	<button type="submit" class="btn btn-primary btn-lg mb-2" onclick="return change();">変更</button>
	<a href="/modifyPwdForm"><button type="button" class="btn btn-light btn-lg mb-2" >キャンセル</button></a>
</div>

</div>
</div>
</div>
</div>
</form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	</div>
</div>
        
</body>
</html>