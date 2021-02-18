<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>수정 뷰</title>
	 	<meta name="viewport" content="width=device-width, initial-scale=1">

  	  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		
	 		
	</head>
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
						<label for="title" class="control-label" style="">제목</label>
						
							<input type="text" id="LectureName" name="LectureName" class="form-control" value="${update.lectureName}" style="width:300px">
						
					</div>
					<div class="form-group">
						<label for="title" class="control-label" >강의 내용</label>
						
							<textarea class="form-control" rows="3" id="lectureListContent" name="lectureListContent"><c:out value="${update.lectureListContent}" /></textarea>
						
					</div>
					<div class="form-group">
						<label for="title" class="control-label">강의 상세내용</label>
						
							<textarea class="form-control" rows="3" id="lectureContent" name="lectureContent" ><c:out value="${update.lectureContent}" /></textarea>
						
					</div>
					
					    
						  <div class="form-group">
								<label for="title" class="control-label">강의 이미지</label>
								<p>기존 이미지 :${update.lectureImage }</p>
								<input type="hidden" id="lectureImage" name="lectureImage" value="${update.lectureImage }">
								
								
								  <input type="file" id="lecsImage" name="lecsImage" class="btn btn-primary"/>
						</div>
						  
						
					
				  </div>
					
				
					
					
					<div class="form group col">
						<button type="submit" class="update_btn btn btn-warning btn-xs">저장</button>
						<button type="submit" class="cancel_btn btn btn-danger btn-xs">취소</button>
					</div>
					</form>
					<!--  
					<table class="table tale-hover">
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="lectureName" name="lectureName" value="${update.lectureName}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">상세내용</label><textarea id="lectureContent" name="lectureContent"><c:out value="${update.lectureContent}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="content">간단내용</label><textarea id="lectureListContent" name="lectureListContent"><c:out value="${update.lectureListContent}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">이미지</label><input type=file id="lectureImage" name="lectureImage" value="${update.lectureImage}"/>
								</td>
							</tr>
								
						</tbody>			
					</table>
					
					
					-->
					
			</section>
			
			<hr />
		</div>
		</div>
	</body>
</html>