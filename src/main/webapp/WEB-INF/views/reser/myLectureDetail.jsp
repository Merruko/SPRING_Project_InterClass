<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="container"align="center">
	<div class="page-header" align="center">
	 	<h2>나의 강의</h2>
	</div>
    <div class="container-fluid bg-grey">
    	<c:forEach items="${detail}" var="detail" varStatus="status">
  		<div class="row">
    		<div class="col-sm-4">
      		<img alt="사진" src="../resources/upload/${detail.lectureImage}">
    		</div>
    	<div class="col-sm-8">
      		<h2>${detail.lectureName}</h2>
      		<h4><strong>강의내용 :</strong> ${detail.lectureContent }</h4>
      		<p><strong>시작일 :</strong> <fmt:formatNumber pattern="####.####" value="${detail.startDate}" /></p>
      		<p><strong>신청일 :</strong><fmt:formatDate value="${detail.orderDate}" pattern="yyyy-MM-dd"/></p>
      		<p><button type="button" class="btn btn-default btn-lg">강의시청</button></p>
      		<p><button type="button" class="btn btn-default">신청취소</button></p>
    	</div>
  		</div>
  		</c:forEach>
	</div>        
  
  

</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>