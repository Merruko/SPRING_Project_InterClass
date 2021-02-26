<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>講義リスト</title>
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
	.thumbnail{
 		height:420px;
 		overflow:auto;
	}
</style>

<%@include file="../menu.jsp" %>
<body>	
<div class="listpage">
	<div class="container-fluid text-center">
		<div class="page-header">
		  <h2>講義リスト</h2>
		</div>
		
		<form role="form" method="post" action="/lecture/write">
			<div class="row text-center slideanim">
				<c:forEach items="${list}" var = "list">
					<div class="col-sm-6 col-md-4">
					
						<div class="thumbnail">
							<a href="/lecture/readView?lectureNum=${list.lectureNum }">
								<img alt="写真" src="../resources/upload/${list.lectureImage}">
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

<footer style="position:fixed; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>