<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>강의 상세 페이지</title>
	 	<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	
	 	
	</head>
 
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/lecture/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/lecture/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/lecture/list";
			})
			//카트 담기
			$(".cart_btn").on("click",function(){
				formObj.attr("action","/lecture/addCart");
				formObj.attr("method", "post");
				
				formObj.submit();
				alert("카트 담기 성공");
			})
		})
	</script>
	
	<body>
			<div>
				<%@include file="../menu.jsp"%>
			</div>
			
			<div class="form-group" style="width:200px; height:auto; float: left;">
					<img alt="사진" src="../resources/upload/${read.lectureImage}" style="float: left;">
				
				</div>
		<div id="container" style="position: absolute; right:150px; width:700px">
			
			
			
			<section id="container" style="margin:100px;">
				
				
				<form name="readForm" role="form" method="post" >
					<input type="hidden" id="lectureNum" name="lectureNum" value="${read.lectureNum}" />
				</form>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">아이디</label>
					<input type="text" id="mId" name="mId" class="form-control" value="<%=user%>" readonly="readonly" />
				</div>
				
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label" >제목</label>
					<input type="text" id="lectureName" name="lectureName" class="form-control"  value="${read.lectureName}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="lectureContent" name="lectureContent" class="form-control" readonly="readonly"><c:out value="${read.lectureContent}" /></textarea>
				</div>
				<sec:authorize access="hasRole('ROLE_USER')">
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">이미지 파일</label>
					<input type="text" id="lectureImage" name="lectureImage" class="form-control" value="${read.lectureImage}"  readonly="readonly"/>
				</div>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
				<h5>로그인을 잊어버리셨습니까? </h5>
	  			  <h5><a href='<c:url value="/login"/>'><button type="button" class="btn btn-info btn-sm" >로그인</button></a> </h5>
	   			 <h5><a href='<c:url value="/signUp"/>'><button type="button" class="btn btn-info btn-sm" >회원가입 하러가기</button></a> </h5>
				</sec:authorize>
							
							
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				
				
	      		<div>
					<button type="button" class="update_btn btn btn-warning">수정</button>
					<button type="button" class="delete_btn btn btn-danger">삭제</button>
					<button type="button" class="list_btn btn btn-primary">목록</button>	
				</div>
				</sec:authorize>	
				
				<sec:authorize access="hasRole('ROLE_USER')">
					
	   			 <button type="button" class="cart_btn btn btn-warning" >강의 등록하기</button>
			</sec:authorize>
				
				
			</section>
			<hr />
		</div>
		
		
	</body>
</html>