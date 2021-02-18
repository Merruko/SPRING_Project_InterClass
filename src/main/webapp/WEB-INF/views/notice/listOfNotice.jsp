<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>InterClass</title>
<style type="text/css">
	#container{width: 100%; margin: 0 auto; text-align: center;}
	form#searchBox>table {text-align:right;}
	table{margin: 0 auto; width: 800px; border-collapse: collapse; text-align: center;}
	#conBox th, #conBox td { border: 1px solid gray; padding: 5px;}
	#conBox th {text-align:center;background-color:#dddddd;}
	h1{padding: 20px 0; font-weight: bold; text-align: center;}
</style>
</head>


<body>
<%@include file="../menu.jsp" %>
	<h1>공지사항</h1>
	<div id="container">
		<!-- 검색 -->
		<form action="getBoardList" method="post" id="searchBox">
			<table>
				<tr>
					<td>
					<select name="searchCondition">
						<c:forEach items="${conditionMap }" var="option">
							<option value="${option.value }">${option.key }
						</c:forEach>							
					</select> 
					<input name="searchKeyword" type="text" /> 
					<input type="submit" value="검색"/>
					</td>
				</tr>
			</table>
		</form><br>
		<!-- 목록 -->
		<table id="conBox" cellpadding="0" cellspacing="0">
			<tr>
				<th width="100" height="50">번호</th>
				<th width="200">제목</th>
				<th width="150">작성자</th>
				<th width="150">등록일</th>
				<th width="100">조회수</th>
			</tr>
			<c:forEach items="${boardList }" var="board">
				<tr>
					<td>${board.seq }</td>
					<td align="left"><a href="getBoard?seq=${board.seq }">
							${board.title }</a></td>
					<td>${board.writer }</td>
					<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
					<td>${board.cnt }</td>
				</tr>
			</c:forEach>
		</table><br>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<button type="button" class="btn btn-info" onclick="location.href='<c:url value="/notice/insertBoard"/>'" >글등록</button>
		</sec:authorize>
		</div>
		
<%@include file="../footer.jsp" %>
</body>
</html>