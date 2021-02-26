<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講義再生</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 

<style type="text/css">
	.video{
		margin : 0 auto;
	}
	
</style>

</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="container">
		<div align="center">
			<h1>講義再生</h1>
		</div>
		<div align="center">
			<h3>${lecture.lectureName}</h3>
		</div>
		<div class="video" align="center">
			<c:choose>
				<c:when test="${videoId == null}">
					<iframe width="640" height="360" src="https://www.youtube.com/embed/lJES5TQTTWE" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen></iframe>
				</c:when>
				<c:otherwise>
					<iframe width="640" height="360" src="${videoId}" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen></iframe>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="direction">
			<p>${lecture.lectureContent}</p>
			<p>${lecture.lectureListContent}</p>
		</div>
	</div>
	
</body>
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>