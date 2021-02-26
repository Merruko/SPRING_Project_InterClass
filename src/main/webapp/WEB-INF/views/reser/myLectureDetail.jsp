<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>予約した講義</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />
	<jsp:include page="../menu.jsp"/>
	<div class="container"align="center">
	<div class="page-header" align="center">
	 	<h2>予約した講義</h2>
	</div>
    <div class="container-fluid bg-grey">
    	<c:forEach items="${detail}" var="detail" varStatus="status">
  		<div class="row">
    		<div class="col-sm-4">
      		<img alt="写真" src="../resources/upload/${detail.lectureImage}">
    		</div>
    	<div class="col-sm-8">
      		<h2>${detail.lectureName}</h2>
      		  <form name="mylist" method="post" role="form">
    			<input type="hidden" name="rNum" id="rNum" value="${detail.rNum}"/>
   			 </form>
      		<h4><strong>講義詳細 :</strong> ${detail.lectureContent }</h4>
      		<p><strong>開始日 : </strong>${detail.startDate}</p>
      		<p><strong>申込日 : </strong><fmt:formatDate value="${detail.orderDate}" pattern="yyyy-MM-dd"/></p>
    
      		<fmt:parseDate value="${detail.startDate}" pattern="yyyy-MM-dd" var="startDate"/>
      		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
      		
      		<c:choose>
      		<c:when test="${now le startDate}">
      			<p><button type="button" class="btn btn-default btn-lg">受講予定</button></p>
      			<p>開始日 : ${detail.startDate}</p>
      		</c:when>
      		<c:otherwise>
      			<p><button type="button" class="btn btn-default btn-lg" onclick="location.href='/reser/lectureVideo?n=${detail.lectureNum}'">講義再生</button></p>
      		</c:otherwise>
      		</c:choose>
      		<input type="button" onclick="history.back()" value="戻る">			
    	</div>
  		</div>
  		</c:forEach>
	</div>        
</div>

</body>
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>