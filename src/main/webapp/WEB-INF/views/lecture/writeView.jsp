<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<title>강의 등록</title>
	</head>
	<%@include file="../menu.jsp" %>
	<body>

				
		<div class="container-fluid text-center">
			<div class="page-header">
			  <h1>강의등록 </h1>
			</div>
		</div>
		<div id="root">
		
			 
			
			
			<section id="container" style="margin:100px; width:800px;">
				<form role="form" method="post" action="/lecture/write" enctype="multipart/form-data">
					<div class="form-group">
						<label for="title" class="control-label" style="">제목</label>
						
							<input type="text" id="LectureName" name="LectureName" class="form-control">
						
					</div>
					<div class="form-group">
						<label for="title" class="control-label" >강의 내용</label>
						
							<textarea class="form-control" rows="3" id="lectureListContent" name="lectureListContent"></textarea>
						
					</div>
					<div class="form-group">
						<label for="title" class="control-label">강의 상세내용</label>
						
							<textarea class="form-control" rows="3" id="lectureContent" name="lectureContent" ></textarea>
						
					</div>
					<div class="form-group">
						<label for="lecsImage" class="control-label">강의 이미지</label>
						
							<input type="file"  name="lecsImage" class="btn btn-primary"/>
						
					</div>
					
					
					<div class="form group">
						<button type="submit" class="btn btn-danger">작성</button>
					</div>
				</form>
			</section>
			<hr/>
		</div>
	</body>
</html>