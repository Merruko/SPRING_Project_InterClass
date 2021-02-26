<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報照会</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="container"align="center">
	<div class="page-header" align="center">
	 	<h2>会員情報照会</h2>
	</div>
    <div class="container-fluid bg-grey">
    	
  		<form class="form-horizontal" action="">
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="mId">ID</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mId" name="mId" placeholder="${member.mId}" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="mName">氏名</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mName" name="mName" placeholder="${member.mName}" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="mGender">性別</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mGender" name="mGender" placeholder="${member.mGender}" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="mBirth">生年月日</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mBirth" name="mBirth" placeholder="${member.mBirth}" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="mEmail">Email</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mEmail" name="mEmail" placeholder="${member.mEmail}" disabled>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="mPhone">TEL</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mPhone" name="mPhone" placeholder="${member.mPhone}" disabled>
		    </div>
		  </div>
		  <input type="button" onclick="history.back()" value="戻る">
		</form>
	</div>

</div>
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</body>
</html>