<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講義作成</title>
</head>

<%@include file="../menu.jsp" %>
<body>
	<div class="container-fluid text-center">
		<div class="page-header">
		  <h2>講義作成</h2>
		</div>
	</div>
	<div id="root">
		<section id="container" style="margin:100px; width:800px; margin:0 auto;">
			<form role="form" method="post" action="/lecture/write" enctype="multipart/form-data">
				<div class="form-group">
					<label for="title" class="control-label" style="">タイトル</label>
					<input type="text" id="LectureName" name="LectureName" class="form-control">
				</div>
				<div class="form-group">
					<label for="title" class="control-label" >コンテンツ</label>
					<textarea class="form-control" rows="3" id="lectureListContent" name="lectureListContent"></textarea>
				</div>
				<div class="form-group">
					<label for="title" class="control-label">詳細</label>
					<textarea class="form-control" rows="3" id="lectureContent" name="lectureContent" ></textarea>
				</div>
				<div class="form-group">
					<label for="lecsImage" class="control-label">イメージ</label>
					<input type="file"  name="lecsImage" class="btn btn-primary"/>
				</div>
				<div class="form group">
					<button type="submit" class="btn btn-danger">作成</button>
				</div>
			</form>
		</section>
		<hr/>
	</div>
</body>

<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>