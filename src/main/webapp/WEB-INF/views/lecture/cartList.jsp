<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
	 <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
	<style>
		.container{
		font-family: 'Gothic A1', sans-serif;

	</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
	<style type="text/css">
		
		.orderInfo{
			display:none;
		}
	</style>
	</head>
	
	<body>
		<jsp:include page="../menu.jsp"/>
		<div class="container">
			<div class="page-header" align=center>
				<h1>내가찜한강의</h1>
			</div>
		
		<table class="table table-hover" id="cart">
 		
 	<thead>
 		
 		<tr>
 		
 			<th class="content">아이디</th>
 			<th class="content">카트넘버</th>
 			<th class="content">강의번호</th>
 			<th></th>		
 		</tr>
 	</thead>
 	<tbody>
 	  <c:forEach items="${cartList}" var="cartList">
  		<tr>
  		
  			<td class="content">${cartList.mID}</td>
  			
 				<td class="content" id="${cartList.cartNum}">${cartList.cartNum}</td>
 				<td class="content" id="${cartList.lectureNum}">${cartList.lectureNum}</td>
 				
 				<td class="content">
 			
 				
 					<div class="order">
 						<button type="button" class="btn btn-info">예약</button>
 							<script>
     					
     					 $(".btn-info").click(function(){
     					  $(".orderInfo").slideDown();
     					  $(".btn-info").slideUp();
     					 });      
     					</script>
 					</div>
     				<div class="delete">
 					<button type="button" class="delete_${cartList.cartNum}_btn btn btn-danger" data-cartNum="${cartList.cartNum}">삭제</button>
 
					 <script>
					  $(".delete_${cartList.cartNum}_btn").click(function(){
					   var confirm_val = confirm("정말 삭제하시겠습니까?");
					   
					   if(confirm_val) {
					    var checkArr = new Array();
					    
					    checkArr.push($(this).attr("data-cartNum"));
					               
					    $.ajax({
					     url : "/lecture/deleteCart",
					     type : "post",
					     data : { chbox : checkArr },
					     success : function(result){
					      if(result == 1) {     
					       location.href = "/lecture/list";
					       location.reload();
					      } else {
					       alert("삭제 실패");
					      }
					     }
					    });
					   } 
					  });
					 </script>
				</div>
     				
     				
     				
    		
    			<div class="orderInfo">
    				<form role="form" name="orderForm" action="${path}/reser/reservation" method="post" autocomlete="off">
    					<input type="hidden" name="cartNum" value="${cartList.cartNum}"/>
    					<input type="hidden" name="lectureNum" value="${cartList.lectureNum}"/>
    					<div class="inputArea">
    						<label for="srartDate">수강 시작일</label>
    						<input type="text" name="startDate" id="startDate"/>
    					</div>
    					<div class="inputArea">
    						<button type="submit" class="order" onclick="check()">예약</button>
    						<button type="button" class="order_cancel">취소</button>
    						<script>
    						$(".order_cancel").click(function(){
    							 $(".orderInfo").slideUp();
    							 $(".btn-infot").slideDown();
    							}); 
    						function check() {
    					        if (document.getElementById("startDate").value == "") {
    					            alert("강의를 수강시작할 날을 입력해주세요");
    					            return false;
    					  }else
    					   document.orderForm.submit();
    						}
    							
    						</script>
    					</div>
    				</form>
    			</div>
 			</td>			
  		</tr>
  		</c:forEach>
  		</tbody>
  		
  	</table>	
  
  
  		
	</div>
	</body>
	
	<footer>
	<%@include file="../footer.jsp" %>
	</footer>
</html>
		
		