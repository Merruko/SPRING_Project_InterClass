<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>情報修正</title>
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
              
<form:form action="updateMember" method="post" modelAttribute="memberVO">

<div class="row">
<div class="col">
<div class="row">
<div class="col">


<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>ID</b></label>
			<form:input class="form-control" type="text" path="mId" value="${vo.mId}" readonly="true" />
		</div>
	</div>
</div>

<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>氏名</b></label>
			<form:input class="form-control" type="text" path="mName" value="${vo.mName}" />
			<div>
				<spring:hasBindErrors name="memberVO">
				<c:if test="${erros.hasFieldErros('mName') }" />
				</spring:hasBindErrors>
				<form:errors path="mName" style='color:red' />
			</div>
		</div>
	</div>
</div>

<div class="form-group row">
	<div class="col">
		<div class="form-group">
			<label><b>性別</b></label>
			<form:select class="form-control" path="mGender" id="gender" isChanged="false">
				<form:option value="男性" selected="${vo.mGender =='男性'? 'selected' : '' }">男性</form:option>
				<form:option value="女性" selected="${vo.mGender =='女性'? 'selected' : '' }">女性</form:option>
			</form:select>
		</div>
	</div>
</div>

<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>生年月日</b></label>
			<form:input class="form-control" type="text" path="mBirth" value="${vo.mBirth}" />
			<div>
				<spring:hasBindErrors name="memberVO">
				<c:if test="${erros.hasFieldErros('mBirth') }" />
				</spring:hasBindErrors>
				<form:errors path="mBirth" style='color:red' />
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>Email</b></label>
			<form:input class="form-control" type="email" path="mEmail" value="${vo.mEmail}" />
			<div>
				<spring:hasBindErrors name="memberVO">
				<c:if test="${erros.hasFieldErros('mEmail') }" />
				</spring:hasBindErrors>
				<form:errors path="mEmail" style='color:red' />
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>TEL</b></label>
			<form:input class="form-control mb-5" type="text" path="mPhone" value="${vo.mPhone}" />
			<div>
				<spring:hasBindErrors name="memberVO">
				<c:if test="${erros.hasFieldErros('mPhone') }" />
				</spring:hasBindErrors>
				<form:errors path="mPhone" style='color:red' />
			</div>
		</div>
	</div>
</div>
<div>
    <button type="submit" class="btn btn-primary btn-lg btn-block mb-1" >確認</button>
    <button type="button" class="btn btn-light btn-lg btn-block mb-1" onclick="location.href='${path}/memberInfo'" >キャンセル</button>
</div>
</div>
</div>
</div>
</div>
            
</form:form>

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