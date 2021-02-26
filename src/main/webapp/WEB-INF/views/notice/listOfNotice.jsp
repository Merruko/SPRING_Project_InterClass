<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ニュース</title>

<style type="text/css">
	#container{width: 100%; margin: 10 auto; text-align: center;}
	form#searchBox>table {text-align:right;}
	table{margin: 0 auto; width: 800px; border-collapse: collapse; text-align: center;}
	#conBox th, #conBox td { border: 1px solid gray; padding: 5px;}
	#conBox th {text-align:center; background-color:#dddddd;}
	.searchBox{
	   width: 50%;
	   margin-left: 27%;
	}
	.category {
	    float: left;
	    width: 150px;
	}
	
	.searchContent{
	    float: left;
	    margin-left: 1%;
	    width: 500px;
	}
	
	.searchBtn{
		margin-left: 1%;
	    float: left;
	}
</style>
</head>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/notice/getBoardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

  	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/notice/getBoardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/notice/getBoardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	
	//검색 기능
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/notice/getBoardList";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	
</script>

<body>
<%@include file="../menu.jsp" %>
<br>
	<center><h2>ニュース</h2></center>
<br>
<br>

	<div class="searchBox">
	<div class="category">
		<select class="form-control" name="searchType" id="searchType">
			<option value="title">件名</option>
			<option value="content">内容</option>
		</select>
	</div>
	<div class="searchContent">
		<input type="text" placeholder="Search..." class="form-control" name="keyword" id="keyword" value="${pagination.keyword}">
		</div>
		<div class="searchBtn">
			<button class="btn btn-base" name="btnSearch" id="btnSearch">検索</button>
		</div>
		<br>
		<br>
		<br>
	</div>

	<div id="container">
		<table id="conBox" cellpadding="0" cellspacing="0">
			<tr>
				<th width="100" height="50">No.</th>
				<th width="200">件名</th>
				<th width="150">名前</th>
				<th width="150">登録日</th>
				<th width="100">ヒット</th>
			</tr>
			<c:forEach items="${boardList }" var="board">
				<tr>
					<td>${board.seq }</td>
					<td align="left"><a href="getBoard?seq=${board.seq }">
							${board.title }</a></td>
					<td>${board.writer }</td>
					<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
					<td>${board.cnt }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="postBtn">
				<button type="button" class="btn btn-info" onclick="location.href='<c:url value="/notice/insertBoard"/>'" >作成</button>
			</div>
		</sec:authorize>
		<div id="paginationBox">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword}')">戻る</a></li>
				</c:if>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword}')"> ${idx} </a></li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}','${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword}')" >次へ</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	
</body>
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>
</html>