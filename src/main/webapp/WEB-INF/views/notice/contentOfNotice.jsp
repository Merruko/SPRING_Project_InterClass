<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>スレッド詳細</title>
</head>
<body>
<%@include file="../menu.jsp" %>

<style type="text/css">
	.title{height: 130px; width: 100%; font-size: 20px; background: red; line-height: 130px; color: black;}
	table{margin: 0 auto; width: 700px; border-collapse: collapse; text-align: center;}
	tr, td{border: 1px solid #222; padding: 10px;}
	h2{padding: 20px 0; text-align: center;}
	input[type="text"]{width: 100%; height: 20px;}
	textarea{width: 100%; height: 350px;}
	a{text-decoration: none; color: black;}
</style>

		<h2>スレッド詳細</h2>
		<form action="updateBoard" method="post">
			<input name="seq" type="hidden" value="${board.seq}" />
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td width="70">件名</td>
					<td align="left"><input name="title" type="text"
						value="${board.title }" /></td>
				</tr>
				<tr>
					<td>名前</td>
					<td align="left">${board.writer }</td>
				</tr>
				<tr>
					<td>内容</td>
					<td align="left"><textarea name="content" cols="40" rows="10">${board.content }</textarea></td>
				</tr>
				<tr>
					<td>登録日</td>
					<td align="left">${board.regDate }</td>
				</tr>
				<tr>
					<td>ヒット</td>
					<td align="left">${board.cnt }</td>
				</tr>
				<td style="border-bottom: hidden; border-left: hidden; border-right: hidden;"></td>
				<tr>
					<td style="border-bottom: hidden; border-left: hidden; border-right: hidden;" colspan="2" align="center"  >
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<input type="submit" value="修正" >
					<input type="button" value="削除" onclick="location.href='deleteBoard?seq=${board.seq }'">
					<input type="button" value="リストへ" onclick="location.href='getBoardList'">
					</sec:authorize>
					</td>
				</tr>
			</table>
		</form>
		
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</body>
</html>