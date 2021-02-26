<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講義予約</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" >
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="page-header" align="center">
	 	<h2>講義予約</h2>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container" style="width: 500px; pistion: relative; margin: 0 auto;">
	<form class="form-horizontal" name="reser" action="${path}/reser/reservation_submit" method="post">
		<input type="hidden" name="mId" value="${mId}"/>
		<div class="form-group">
		  <label for="lectureName">講義チョイス</label>
		  <select class="form-control" id="lectureNum" name="lectureNum">
		  <c:forEach items="${lecture}" var="lecture">
		    <option value="${lecture.lectureNum}">${lecture.lectureName}</option>
		    </c:forEach>
		  </select>
		</div>	
    	<div class="form-group">
    		<label class="control-label col-sm-2" for="startDate">講義開始日</label>
    		<div class="col-sm-10">
    			<input type="date" id="startDate" name="startDate" value="<%=format.format(nowTime)%>" min="<%=format.format(nowTime) %>"/>
    		</div>
    	</div>
    	<div class="form-group">        
      		<div class="col-sm-offset-2 col-sm-10">
        		<button type="button" class="btn btn-primary" onclick="check()">登録</button>
        		<button type="reset" class="btn btn-danger">キャンセル</button>
      		</div>
    	</div>
    	
    	<script>
    		function check() {
    			var startDate =  document.getElementById("startDate").value;

    			if(confirm('開始日 : '+startDate+' 講義を申し込みますか？') == true){
    					document.reser.submit();
    			} else {
    					 return;
    				   }
    		}
    	</script>
    	
  	</form>
</div>

</body>
<footer style="position:fixed; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>