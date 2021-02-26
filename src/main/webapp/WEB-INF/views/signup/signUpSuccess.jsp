<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録</title>
</head>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

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

<script type="text/javascript">
alert("${joined_mId } 様、ようこそ。");
location.href="/";
</script>

<body>
	<%@include file="../menu.jsp" %>
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
      					<tr>
      						<td>講義１</td>
						</tr>
      					<tr>
      						<td>講義２</td>
						</tr>
      					<tr>
      						<td>講義３</td>
						</tr>
    				</tbody>
  				</table>
			</div>
			<div class="col-lg-6">
				<h3 class="title">ニュース</h3>
				<table class="table table-hover" id="table">
    				<tbody>
      					<tr>
      						<td>ニュース１</td>
						</tr>
						<tr>
      						<td>ニュース２</td>
						</tr>
						<tr>
      						<td>ニュース３</td>
						</tr>
						<tr>
      						<td>ニュース４</td>
						</tr>
    				</tbody>
  				</table>
			</div>
		</div>
	</div>
	
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</body>
</html>