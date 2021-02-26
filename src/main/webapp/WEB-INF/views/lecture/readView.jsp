<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講義詳細</title>
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			
			// 카트 담기
			/*
		　　	$(".cart_btn").on("click",function(){
				formObj.attr("action","/lecture/addCart");
				formObj.attr("method", "post");
				formObj.submit();
				alert("チェックしました。"); })
			*/
			
			$(".cart_btn").click(function(){
				 
				 var mId = $("#mId").val();
				 var lectureNum = $("#lectureNum").val();
				 $.ajax({
				  url : "/lecture/cartCheck",
				  type : "post",
				  data : {mId ,lectureNum},
				  success : function(data) {
				  
				   if(data == 1) {
				    alert("申し込みはダブりにできません。");   
				   } else {
					   formObj.attr("action","/lecture/addCart");
						formObj.attr("method", "post");
						
						formObj.submit();
						alert("チェックしました。");
				   }
				  }
				 });  // ajax 끝
				});
		})
	</script>
	
<body>
	<div>
		<%@include file="../menu.jsp"%>
	</div>
		
	<div class="form-group" style=" padding-top: 60px; width:200px; height:auto; float: left;">
		<img alt="写真" src="../resources/upload/${read.lectureImage}" style="float: left;">
	</div>
	
	<div id="container" style=" position: absolute; right:150px; width:750px">
		<section id="container" style="margin:100px;">
			
			<form name="readForm" role="form" method="post" >
				<input type="hidden" id="lectureNum" name="lectureNum" value="${read.lectureNum}" />
			</form>
			
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">ID</label>
				<input type="text" id="mId" name="mId" class="form-control" value="<%=user%>" readonly="readonly" />
			</div>
			
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label" >タイトル</label>
				<input type="text" id="lectureName" name="lectureName" class="form-control"  value="${read.lectureName}" readonly="readonly" />
			</div>
			
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">内容</label>
				<textarea id="lectureContent" name="lectureContent" class="form-control" readonly="readonly"><c:out value="${read.lectureContent}" /></textarea>
			</div>
			
			<sec:authorize access="hasRole('ROLE_USER')">
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">イメージ</label>
				<input type="text" id="lectureImage" name="lectureImage" class="form-control" value="${read.lectureImage}"  readonly="readonly"/>
			</div>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
			<h5>ログインしますか？</h5>
					 <h5><a href='<c:url value="/login"/>'><button type="button" class="btn btn-info btn-sm" >ログイン</button></a></h5>
		 			 <h5><a href='<c:url value="/signUp"/>'><button type="button" class="btn btn-info btn-sm" >会員登録</button></a></h5>
			</sec:authorize>
						
			<sec:authorize access="hasRole('ROLE_ADMIN')">
    		<div>
				<button type="button" class="update_btn btn btn-warning">修正</button>
				<button type="button" class="delete_btn btn btn-danger">削除</button>
				<button type="button" class="list_btn btn btn-primary">リストへ</button>	
			</div>
			</sec:authorize>	
			
			<sec:authorize access="hasRole('ROLE_USER')">
				<button type="button" class="cart_btn btn btn-warning" >チェック</button>
			</sec:authorize>
			
		</section>
		<hr/>
	</div>
	
</body>
<footer style="position:fixed; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>