<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<script type="text/javascript" charset="utf-8" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style type="text/css">
	.jumbotron .guide{
		font-family: '@MS Mincho', cursive;
		font-size:40px;
	}
	.title{
		font-family: '@MS Mincho', cursive;
		text-align:center;
		font-size:30px;
	}
	#table{
		width:300px;
		margin:0 auto;
	}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
<body>
<%@include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container text-center">
  			<h1>InterClass</h1>
  			<p class="guide">お家で学ぶIT</p>
  		</div>
	</div>
	<div class="containter">
		<div class="row marketing">
			<div class="col-lg-6">
				<h3 class="title">人気の講義</h3>
				<table class="table table-hover" id="table">
    				<tbody>
    					<c:forEach items="${newLecture}" var="newLecture">
    					<tr>
    						<td><c:out value="${newLecture.lectureName}"/>
    					</tr>
      					</c:forEach>
					<tbody>
  				</table>
			</div>
			<div class="col-lg-6">
				<h3 class="title">ニュース</h3>
				<table class="table table-hover" id="table">
    				<tbody>
      					<tbody>
    					<c:forEach items="${newNotice}" var="newNotice">
    					<tr>
    						<td><c:out value="${newNotice.title}"/>
    					</tr>
      					</c:forEach>
					<tbody>
    				</tbody>
  				</table>
			</div>
		</div>
	</div>
<%@include file="footer.jsp" %>
</body>
</html>