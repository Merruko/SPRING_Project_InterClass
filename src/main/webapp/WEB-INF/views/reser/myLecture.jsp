<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='mylist']");
	// 삭제
	$(".cancel_btn").on("click", function(){
		if(confirm('취소하시겠습니까?') == true){
		formObj.attr("action", "/reser/cancel");
		formObj.attr("method", "post");
		formObj.submit();
		}else{
			return;
		}
	})

})
</script>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="container"align="center">
	<div class="page-header" align="center">
	 	<h2>나의 강의</h2>
	</div>
            
  <table class="table table-hover">
    <thead>
       <tr>
		<th></th>
		<th></th>
		<th class="content">수강신청날짜</th>
		<th class="content">수강시작날짜</th>
		<th></th>
      </tr>
    </thead>
    
    <c:forEach items="${myLecture}" var="myLecture">
    <form name="mylist" method="post" role="form">
    	<input type="hidden" name="rNum" id="rNum" value="${myLecture.rNum}"/>
    </form>
    <tbody>
      <tr>
        <td class="content">${myLecture.rNum}</td>
        <td class="content">${myLecture.lectureNum}</td>
        <td class="content"><fmt:formatDate value="${myLecture.orderDate}" pattern="yyyy-MM-dd"/></td>
        <td class="content"><fmt:formatNumber pattern="####-##-##" value="${myLecture.startDate}" /></td>
        <td>
        	<button type="button" class="btn btn-info" onclick='location.href="${path}/reser/myLectureDetail?n=${myLecture.rNum}"'>신청내용</button>
        	<button type="button" class="btn btn-primary">강의시청</button>
        	<button type="button" class="cancel_btn btn-default">삭제</button>
        </td>
    </tr>
    </tbody>
    </c:forEach>
  </table>
  
  
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>