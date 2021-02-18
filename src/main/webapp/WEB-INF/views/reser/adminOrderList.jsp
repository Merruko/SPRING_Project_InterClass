<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<style type="text/css">

</style>

</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="container"align="center">
	<div class="page-header" align="center">
	 	<h2>예약목록</h2>
	</div>
            
  <table class="table table-hover">
    <thead>
       <tr>
		<th class="content">예약번호</th>
		<th class="content">강의번호</th>
		<th class="content">예약날짜</th>
		<th class="content">회원아이디</th>
		<th class="content">수강시작</th>
		<th></th>
      </tr>
    </thead>
    <c:forEach items="${list}" var="list">
    <tbody>
      <tr>
        <td class="content">${list.rNum}</td>
        <td class="content">${list.lectureNum}</td>
        <td class="content"><fmt:formatDate value="${list.orderDate}" pattern="yyyy-MM-dd"/></td>
        <td class="content"><fmt:formatNumber pattern="####-##-##" value="${list.startDate}" /></td>
        <td>
        	<button type="button" class="btn btn-primary"></button>
        	<button type="button" class="btn btn-default"></button>
        </td>
    </tr>
    </tbody>
    </c:forEach>
  </table>
  
  
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>