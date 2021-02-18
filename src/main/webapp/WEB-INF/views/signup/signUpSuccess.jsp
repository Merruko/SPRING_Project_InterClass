<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
	

	.jumbotron .guide{
		font-family: 'Nanum Brush Script', cursive;
		font-size:40px;
	}
	.title{
		font-family: 'Nanum Brush Script', cursive;
		text-align:center;
		font-size:30px;
	}
	#table{
		width:300px;
		margin:0 auto;
		
	}
	
</style>
<script type="text/javascript">
alert("${joined_mId }님 회원가입을 축하합니다.");
location.href="/";
</script>
<body>
	<%@include file="../menu.jsp" %>
	<div class="jumbotron">
		<div class="container text-center">
  			<h1>InterClass</h1>
  			<p class="guide">집에서 배우는 IT</p>
  		</div>
	</div>
	<div class="containter">
		<div class="row marketing">
			<div class="col-lg-6">
				<h3 class="title">인기강의</h3>
				<table class="table table-hover" id="table">
    				<tbody>
      					<tr>
      						<td>강의1</td>
						</tr>
      					<tr>
      						<td>강의2</td>
						</tr>
      					<tr>
      						<td>강의3</td>
						</tr>
    				</tbody>
  				</table>
			</div>
			<div class="col-lg-6">
				<h3 class="title">공지사항</h3>
				<table class="table table-hover" id="table">
    				<tbody>
      					<tr>
      						<td>공지1</td>
						</tr>
						<tr>
      						<td>공지2</td>
						</tr>
						<tr>
      						<td>공지3</td>
						</tr>
						<tr>
      						<td>공지4</td>
						</tr>
    				</tbody>
  				</table>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>