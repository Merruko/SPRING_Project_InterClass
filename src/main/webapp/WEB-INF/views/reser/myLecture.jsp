<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("utf8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 강의</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<style type="text/css">
#rNum {
		text-align:center;
　　  }
</style>

<script type="text/javascript">
var msg = '${msg}';
if (msg != '') {
       alert(msg);
}

$(document).ready(function(){
	var formObj = $("form[name='mylist']");
	// 삭제
	$(".cancel_btn").on("click", function(){
		if(confirm('キャンセルしますか？') == true){
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
	<div class="page-header" align="center">
	 	<h2>私の講義</h2>
	</div>
	<br>
	<br>
<div class="container" align="center" style="postion: relative; margin: 0 auto;">
  <table class="table table-hover">
    <thead>
       <tr>
		<th></th>
		<th></th>
		<th class="content">申込日</th>
		<th class="content">開始日</th>
		<th></th>
      </tr>
    </thead>
    <c:forEach items="${myLecture}" var="myLecture">
    <fmt:parseDate value="${myLecture.startDate}" pattern="yyyy-MM-dd" var="startDate"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
    <c:choose >
    	<c:when test="${myLecture.lectureNum == null}">
    	<tbody>
    		<tr>
    		<td colspan="5">講義が中断されました。</td>
    		</tr>
    	</tbody>
    	</c:when>
    	<c:otherwise>
    	<tbody>
	      <tr>
	        <td class="content"> 
	        <form name="mylist" method="post" role="form">
    			<input type="text" name="rNum" id="rNum" value="${myLecture.rNum}" disabled/>
    		</form></td>
	        <td class="content">${myLecture.lectureNum}</td>
	        <td class="content"><fmt:formatDate value="${myLecture.orderDate}" pattern="yyyy-MM-dd"/></td>
	        <td class="content">${myLecture.startDate}</td>
	        <td>
	        	<button type="button" class="btn btn-info" onclick='location.href="${path}/reser/myLectureDetail?n=${myLecture.rNum}"'>申し込み内容</button>
		      	<c:choose>
		      	<c:when test="${now le startDate}">
		      		<button type="button" class="btn btn-default">受講予定</button>
		      	</c:when>
		      	<c:otherwise>
		      		<button type="button" class="btn btn-primary" onclick="location.href='/reser/lectureVideo?n=${myLecture.lectureNum}'">講義再生</button>
		      	</c:otherwise>
		      	</c:choose>
	       			<a href="${path}/reser/cancle?rNum=${myLecture.rNum}"><button type="button" class="btn btn-base" onclick="return confirm('講義をキャンセルしますか？');" >キャンセル</button></a>
	        </td>
	    </tr>
    </tbody>
   	</c:otherwise>
    </c:choose>
    </c:forEach>
  </table>
</div>

</body>
<footer style="position:fixed; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>