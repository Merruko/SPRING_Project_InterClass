<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>スレッド作成</title>
</head>
<body>
<%@include file="../menu.jsp" %>

<style type="text/css">
	#container{width: 100%; margin: 0 auto; text-align: center;}
	table{margin: 0 auto; width: 800px; border-collapse: collapse; text-align: center;}
	tr, td{border: 1px solid gray; padding: 10px;}
	h2{padding: 20px 0; text-align: center;}
	input[type="text"]{width: 100%; height: 20px;}
	textarea{width: 100%; height: 300px;}
</style>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<h2>スレッド作成</h2>
	<div id="container">
		<form action="insertBoard" method="post">
			<table>
				<tr>
					<td><input type="text" name="title" placeholder="件名"></td>
				</tr>
				<tr>
					<td><input type="text" name="writer" value="管理者" readonly></td>
				</tr>
				<tr>
					<td><textarea name="content" placeholder="内容"></textarea></td>
				</tr>

				<tr>
					<td>
					<input type="submit" value="作成">
					<input type="button" value="戻る" onclick="location.href='getBoardList'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_USER')">
<p>使用できないページです。
</sec:authorize>
<sec:authorize access="isAnonymous()">
<p>使用できないページです。
</sec:authorize>

</body>
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>