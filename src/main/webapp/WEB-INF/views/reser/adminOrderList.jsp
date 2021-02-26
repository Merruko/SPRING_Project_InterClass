<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>予約管理</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<style type="text/css">
	.cancelInfo{
		display:none;
	}
</style>

<script>
$(document).ready(function(){
	var form = $("form[name='order']");
	// 삭제
	$(".cancel_btn").on("click", function(){
		if(confirm('予約をキャンセルしますか？') == true){
		form.attr("action", "/reser/delete");
		form.attr("method", "post");
		form.submit();
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
	 	<h2>予約管理</h2>
	</div>
<br>
<br>
<div class="container" align="center" style="postion: relative; margin: 0 auto;">

            
  <table class="table table-hover">
    <thead>
       <tr>
		<th class="content">予約ナンバー</th>
		<th class="content">講義ナンバー</th>
		<th class="content">予約日</th>
		<th class="content">会員ID</th>
		<th class="content">開始日</th>
		<th></th>    
    </thead>
    <c:forEach items="${list}" var="list">
    	<form role="form" name="order" method="post">
    		<input type="hidden" name="rNum" id="rNum" value="${list.rNum}"/>
    	</form>
    <c:choose>
    	<c:when test="${list.onValue == 1}">
    	<tbody>
    		<tr>
    			<td class="content">${list.rNum}</td>
    			<td class="content" colspan="4">予約をキャンセルしました。</td>
    			<td><button type="button" class="cancelcheck_btn btn btn-danger">詳細</button>
    				<button type="button" class="delete_btn btn btn-danger">削除</button>
    			</td>			
			</tr>	
			</tbody>
				
				<script>	
     					 $(".cancelcheck_btn").click(function(){
     					  $(".cancelInfo").slideDown();
     					  $(".cancelcheck_btn").slideUp();
     					 });      
     			</script>
			
			
			<div class="cancelInfo">
				<h3 align="center">キャンセルされた予約情報</h3>
				<ul class="list-group">					
				  <li class="list-group-item">予約ナンバー : ${list.rNum}</li>
				  <li class="list-group-item">講義ナンバー : ${list.lectureNum}</li>
				  <li class="list-group-item">会員ID : ${list.mId}</li>
				  <li class="list-group-item">予約日 : <fmt:formatDate value="${list.orderDate}" pattern="yyyy-MM-dd"/></li>
				  <li class="list-group-item">
				  <button type="button" class="check_btn btn-default">確認</button>
				</ul>
				<script>
    				$(".check_btn").click(function(){
    					$(".cancelInfo").slideUp();
    					$(".cancelcheck_btn").slideDown();
    					}); 
    							
    			</script>
			</div>
		
    	</c:when>
    	<c:when test="${list.lectureNum == null}">
    	</tbody>
    		<tr>
    			<td class="content">${list.rNum}</td>
    			<td class="content" colspan="3">削除された講義です。</td>
    			<td class="content">${list.mId}</td> 
    			<td><button type="button" class="btn btn-danger" onclick="${path}/reser/adminUserView?n=${list.mId}">会員情報</button>
    				<button type="button" class="delete_btn btn btn-danger">予約キャンセル</button>
    			</td>
			</tr>
		</tbody>	
    	</c:when>
    	<c:when test="${list.mId == null}">
    	</tbody>
    		<tr>
    			<td class="content">${list.rNum}</td>
    			<td class="content">${list.lectureNum}</td>
    			<td class="content">${list.orderDate}</td>
    			<td colspan="2">脱退した会員です。</td>
    			<td><button type="button" class="btn btn-danger" onclick="${path}/reser/adminUserView?n=${list.mId}">予約キャンセル</button>
    				<button type="button" class="delete_btn btn btn-danger" onclick='locaiton.href="${path}/reser/delete?n=${list.rNum}"'>予約キャンセル</button>
    			</td>
			</tr>
		</tbody>	
    	</c:when>
    	<c:otherwise>
    		   <tbody>
			      <tr>
			        <td class="content">${list.rNum}</td>
			        <td class="content">${list.lectureNum}</td>
			        <td class="content"><fmt:formatDate value="${list.orderDate}" pattern="yyyy-MM-dd"/></td>
			        <td class="content"><a href="${path}/reser/adminUserView?n=${list.mId}">${list.mId}</a></td>
			        <td class="content">${list.startDate}</td>
			        <td>
			        	<button type="button" class="btn btn-primary">詳細</button>
			        	<button type="button" class="btn btn-default">キャンセル</button>
			        </td>
			    </tr>
			    </tbody>
    	</c:otherwise>
    </c:choose>
    </c:forEach>
  </table>
  
  
</div>
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</body>
</html>