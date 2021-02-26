<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>講義修正</title>
</head>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 		
<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/lecture/list";
		})
		
	})
</script>

<body>
	<div id="root">
	
		<div>
			<%@include file="../menu.jsp" %>
		</div>
		
		<div class="container" style="margin:30px;">
		<section id="container">
			<form name="updateForm" role="form" method="post" action="/lecture/update" enctype="multipart/form-data">
				<input type="hidden" name="lectureNum" value="${update.lectureNum}" readonly="readonly" />
			
			<div class="tb1">
			<div class="form-group">
					<label for="title" class="control-label" style="">タイトル</label>
					<input type="text" id="LectureName" name="LectureName" class="form-control" value="${update.lectureName}" style="width:300px">
				</div>
				
				<div class="form-group">
					<label for="title" class="control-label" >コンテンツ</label>
					<textarea class="form-control" rows="3" id="lectureListContent" name="lectureListContent"><c:out value="${update.lectureListContent}" /></textarea>
				</div>
				
				<div class="form-group">
					<label for="title" class="control-label">詳細</label>
					<textarea class="form-control" rows="3" id="lectureContent" name="lectureContent" ><c:out value="${update.lectureContent}" /></textarea>
				</div>
				
				<div class="form-group">
					<label for="title" class="control-label">イメージ</label>
					<p>既存のイメージ : ${update.lectureImage }</p>
					<input type="hidden" id="lectureImage" name="lectureImage" value="${update.lectureImage }">
					<input type="file" id="lecsImage" name="lecsImage" class="btn btn-primary"/>
				</div>
				
		    </div>
			
				<div class="form group col">
					<button type="submit" class="update_btn btn btn-warning btn-xs">確認</button>
					<button type="submit" class="cancel_btn btn btn-danger btn-xs">キャンセル</button>
				</div>
				
			</form>
		</section>
		<hr/>
		</div>
	</div>
</body>

<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>