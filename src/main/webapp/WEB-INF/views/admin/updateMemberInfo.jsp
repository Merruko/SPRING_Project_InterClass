<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報修正</title>
</head>

<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
    body{
	    margin-top:20px;
	    background-color: #f2f3f8;
	}
	.card {
	    margin-bottom: 1.5rem;
	    box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
	}
	
	.card {
	    position: relative;
	    display: -ms-flexbox;
	    display: flex;
	    -ms-flex-direction: column;
	    flex-direction: column;
	    min-width: 0;
	    word-wrap: break-word;
	    background-color: #fff;
	    background-clip: border-box;
	    border: 1px solid #e5e9f2;
	    border-radius: .2rem;
	}
</style>

<body>
<br>
<br>
	<div class="container text-center" onclick="location.href='<c:url value='/'/>'">
  		<h1>InterClass</h1>
	</div>
<br>
<br>
<hr>
<div class="container h-100">
 	<div class="row h-100">
		<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
			<div class="d-table-cell align-middle">

				<div class="text-center mt-4">
					<h3>会員情報修正</h3>
					<br>
				</div>

	<div class="card">
		<div class="card-body">
			<div class="m-sm-4">
				<form:form action="updateMemberByAdmin" method="post" modelAttribute="memberVO">
					<div class="class-group">
						<label>ID</label>
						<form:input class="form-control form-control-lg" type="text" path="mId" value="${vo.mId}" readonly="true"/>
					</div>
					<div class="form-group">
						<label>パスワード</label>
						<form:input class="form-control form-control-lg" type="password" path="mPwd" value="${vo.mPwd}" />
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mPwd') }" />
						</spring:hasBindErrors>
						<form:errors path="mPwd" style='color:red' />
					</div>
					<div class="form-group">
						<label>氏名</label>
						<form:input class="form-control form-control-lg" type="text" path="mName" value="${vo.mName}"/>
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mName') }" />
						</spring:hasBindErrors>
						<form:errors path="mName" style='color:red' />
					</div>
					<div class="form-group">
						<label>性別</label>
						<form:select class="form-control form-control-lg" path="mGender" id="gender" isChanged="false">
						     <form:option value="男性" selected="${vo.mGender =='男性'? 'selected' : '' }">男性</form:option>
						     <form:option value="女性" selected="${vo.mGender =='女性'? 'selected' : '' }">女性</form:option>
						</form:select>
					</div>
					<div class="form-group">
						<label>生年月日</label>
						<form:input class="form-control form-control-lg" type="text" path="mBirth" value="${vo.mBirth}" placeholder="例) 930329" />
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mBirth') }" />
						</spring:hasBindErrors>
						<form:errors path="mBirth" style='color:red' />
					</div>
					<div class="form-group">
						<label>Email</label>
						<form:input class="form-control form-control-lg" type="email" path="mEmail" value="${vo.mEmail}" placeholder="例) sping@test.com" />
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mEmail') }" />
						</spring:hasBindErrors>
						<form:errors path="mEmail" style='color:red' />
					</div>
					<div class="form-group">
						<label>TEL</label>
						<form:input class="form-control form-control-lg" type="text" path="mPhone" value="${vo.mPhone}" placeholder="例) 01012345678" />
						<spring:hasBindErrors name="memberVO">
							<c:if test="${erros.hasFieldErros('mPhone') }" />
						</spring:hasBindErrors>
						<form:errors path="mPhone" style='color:red' />
					</div>
					<br>
					<div class="text-center mt-3">
						<button type="submit" class="btn btn-lg btn-primary">確認</button>
						<!-- 작성을 취소하면 마이페이지 메인홈으로, 일단 수정전 회원상세페이지로 연동 -->
						<a href="${path}/listMemberAll"><button type="button" class="btn btn-lg btn-primary">キャンセル</button></a>	
					</div>
				</form:form>
			</div>
		</div>
	</div>
					
			</div>
		</div>
	</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

</body>
</html>