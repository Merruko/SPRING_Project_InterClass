<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
	 <meta name="viewport" content="width=device-width, initial-scale=1">	
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<style type="text/css">
		 body {
	
	
		  	}
		 .thumbnail{
		 	height:420px;
		 	overflow:auto;
		 }
		.caption{
			
		}
	</style>
	</head>
	<%@include file="../menu.jsp" %>
	<body>
		<div class="listpage">
		<div class="container-fluid text-center">
			<div class="page-header">
			  <h1>강의목록 </h1>
			</div>
			
			<form role="form" method="post" action="/lecture/write">
				<div class="row text-center slideanim">
				   <c:forEach items="${list}" var = "list">
				  <div class="col-sm-6 col-md-4">
				 
				    <div class="thumbnail">
				    	<a href="/lecture/readView?lectureNum=${list.lectureNum }">
				      	<img alt="사진" src="../resources/upload/${list.lectureImage}">
				      	</a>
				    	<div class="caption">
				        	<h3><a href="/lecture/readView?lectureNum=${list.lectureNum }"><c:out value="${list.lectureName}" /></a></h3>
				        	<p><a href="/lecture/readView?lectureNum=${list.lectureNum }"><c:out value="${list.lectureListContent}" /></a></p>
				    
				      	</div>
				    
				    </div>
				  
				  </div>
				  </c:forEach>
				</div>	
			</form><hr/>
			</div>
			
		</div>
	</body>
	<footer>
	<%@include file="../footer.jsp" %>
	</footer>
</html>
		