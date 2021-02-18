<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%	String sessionId = (String)session.getAttribute("sessionId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" >
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#startDate").datepicker({
			showOn:"both",
			changeMonth:true,
			dateFormat:"yy-mm-dd",
			minDate:-0,
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
		});
	});
</script>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class="container text-center">
			<h1>수강예약</h1>
		</div>
	</div>
	
	<div class="container">
	<form class="form-horizontal" action="/reser/reservation_submit" method="post">
		<input type="hidden" name="mId" value="${mId}"/>
		<input type="hidden" name="lectureNum" value="${lectureNum}"/>	
    	<div class="form-group">
    		<label class="control-label col-sm-2" for="startDate">강의시작일</label>
    		<div class="col-sm-10">
    			<input type="text" class="form-control" id="startDate" name="startDate">
    		</div>
    	</div>
    	<div class="form-group">        
      		<div class="col-sm-offset-2 col-sm-10">
        		<button type="submit" class="btn btn-primary">등록</button>
        		<button type="reset" class="btn btn-danger">취소</button>
      		</div>
    	</div>
    	
  	</form>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>