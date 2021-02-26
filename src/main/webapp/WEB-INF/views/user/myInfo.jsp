<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>내정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	body{
    margin-top:20px;
    background:#f8f8f8;
	}
</style>

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
          <li class="nav-item"><a class="nav-link px-2 active" href="${path}/updateMember?mId=${vo.mId}"><span>｜情報修正</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${path}/modifyPwdForm?mId=${vo.mId}"><span>｜パスワード変更</span></a></li>
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
              
<form class="form" >

<div class="row">
<div class="col">
<div class="row">
<div class="col">

<div class="form-group row ">
    <label class="col-sm-3 col-form-label"><b>　　ID</b></label>
    <div class="col-sm-8">
      <input readonly class="form-control-plaintext" type="text" value="${vo.mId }">
    </div>
</div>
<div class="form-group row">
    <label class="col-sm-3 col-form-label"><b>　パスワード</b></label>
    <div class="col-sm-8">
      <input readonly class="form-control-plaintext" type="password" value="${vo.mPwd }" >
    </div>
</div>
<div class="form-group row">
    <label class="col-sm-3 col-form-label"><b>　　氏名</b></label>
    <div class="col-sm-8">
      <input readonly class="form-control-plaintext" type="text" value="${vo.mName }" >
    </div>
</div>
<div class="form-group row">
    <label class="col-sm-3 col-form-label"><b>　　性別</b></label>
    <div class="col-sm-8">
      <input readonly class="form-control-plaintext" type="text" value="${vo.mGender }" >
    </div>
</div>
<div class="form-group row">
    <label class="col-sm-3 col-form-label"><b>　　生年月日</b></label>
    <div class="col-sm-8">
      <input readonly class="form-control-plaintext" type="text" value="${vo.mBirth }" >
    </div>
</div>
<div class="form-group row">
    <label class="col-sm-3 col-form-label"><b>　　Email</b></label>
    <div class="col-sm-8">
      <input readonly class="form-control-plaintext" type="text" value="${vo.mEmail }" >
    </div>
</div>
<div class="form-group row">
    <label class="col-sm-3 col-form-label"><b>　　TEL</b></label>
    <div class="col-sm-8">
      <input readonly class="form-control-plaintext" type="text" value="${vo.mPhone }" >
    </div>
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

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>

</body>
</html>