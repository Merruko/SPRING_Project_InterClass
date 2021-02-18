<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 비밀번호 변경</title>
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
	if($("#userPwd").val() == $("#passNOW").val()){

		if($("#passCh1").val() == $("#mPwd").val()){
			alert('비밀번호 변경이 완료되었습니다. 다시 로그인해주세요.');
			return true;
		} else {
			alert('새로 입력하신 비밀번호가 일치하지 않습니다.');
			return false;
		}
	} else {
		alert('현재 비밀번호가 일치하지 않습니다.');
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
	
	<div class="col-12 col-lg-auto mb-3" style="width: 200px;">
    <div class="card p-3">
      <div class="e-navlist e-navlist--active-bg">
        <ul class="nav">
          <li class="nav-item"><a class="nav-link px-2 active" href="${path}/memberInfo"><span>｜My Page</span></a></li>
          <li class="nav-item"><a class="nav-link px-2 active" href="${path}/updateMember?mId=${mId}"><span>｜내정보 수정</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${path}/modifyPwdForm?mId=${mId}"><span>｜비밀번호 변경</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${path}/deleteMyAccount"><span>｜회원탈퇴</span></a></li>
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
	<p><h4>변경할 비밀번호를 입력해주세요.</h4>
	<p><h6>비밀번호는 4~16개의 문자(특수문자 포함)로 입력해주세요.</h6> 
	<p><h6>단, 공백은 사용하실 수 없습니다.</h6>
	</div>
</div>
<br>
<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>현재 비밀번호</b></label>
			<input class="form-control mb-2" type="password"  name="passNOW" id="passNOW">
		</div>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>새 비밀번호</b></label>
			<input class="form-control mb-2" type="password" name="passCh1" id="passCh1">
		</div>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>비밀번호 재확인</b></label>
			<input class="form-control mb-5" type="password" name="mPwd" id="mPwd">
		</div>
	</div>
</div>

<input type="text" name="mId" id="mId" value="${mId}" style="visibility:hidden">
<input type="text" name="userPwd" id="userPwd" value="${currentPwd}" style="visibility:hidden">

<div class="form-row float-right">
	<button type="submit" class="btn btn-primary btn-lg mb-2" onclick="return change();">변경</button>
	<a href="/modifyPwdForm"><button type="button" class="btn btn-light btn-lg mb-2" >취소</button></a>
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