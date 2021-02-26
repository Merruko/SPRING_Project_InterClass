<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>会員管理リスト</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<style type="text/css">
	body{
	    background: #edf1f5;
	    margin-top:20px;
	}
	.card {
	    position: relative;
	    display: flex;
	    flex-direction: column;
	    min-width: 0;
	    word-wrap: break-word;
	    background-color: #fff;
	    background-clip: border-box;
	    border: 0 solid transparent;
	    border-radius: 0;
	}
	.btn-circle.btn-lg, .btn-group-lg>.btn-circle.btn {
	    width: 35px;
	    height: 35px;
	    padding: 8px 9px;
	    font-size: 18px;
	    line-height: 18px;
	}
	[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
	    cursor: pointer;
	}
	.btn-circle {
	    border-radius: 80%;
	    width: 40px;
	    height: 40px;
	    padding: 10px;
	}
	.user-table tbody tr .category-select {
	    max-width: 150px;
	    border-radius: 20px;
	}
	
	tr td {vertical-align:middle; }
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize, searchType, keyword) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	var url = "${pageContext.request.contextPath}/listMemberAll";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	url = url + "&searchType=" + $('#searchType').val();
	url = url + "&keyword=" + keyword;
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/listMemberAll";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	location.href = url;	
}

//다음 버튼 이벤트
function fn_next(page, range, rangeSize, searchType, keyword) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	var url = "${pageContext.request.contextPath}/listMemberAll";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	url = url + "&searchType=" + $('#searchType').val();
	url = url + "&keyword=" + keyword;
	location.href = url;
}

//검색기능
$(document).on('click', '#btnSearch', function(e){
	e.preventDefault();
	var url = "${pageContext.request.contextPath}/listMemberAll";
	url = url + "?searchType=" + $('#searchType').val();
	url = url + "&keyword=" + $('#keyword').val();
	location.href = url;
	console.log(url);
});	
</script>

<body>
<%@include file="../menu.jsp" %>
<br>
<br>
<br>
<div class="container">
<div class="row">
	<div class="col-lg-5 card-margin" style="float:right">
	    <div class="card search-form">
	        <div class="card-body p-0">
	            <form id="search-form">
	                    <div class="col-10">
	                        <div class="row no-gutters">
	                            <div class="col-lg-4 col-md-3 col-sm-12 p-0">
	                                <select class="form-control" name="searchType" id="searchType">
	                                    <option value="memId">ID</option>
										<option value="name">氏名</option>
										<option value="birth">生年月日</option>
	                                </select>
	                            </div>
	                            <div>
	                            <div class="col-lg-6 col-md-6 col-sm-12">
	                                <input type="text" placeholder="Search..." class="form-control" name="keyword" id="keyword" value="${pagination.keyword}">
	                            </div>
	                            <div class="col-lg-1 col-md-3 col-sm-12 input-group-append">
	                               <button class="btn btn-primary" name="btnSearch" id="btnSearch">検索</button>
	                            </div>
	                            <div class="col-lg-1 col-md-3 col-sm-12">
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body" onclick="location.href='<c:url value='/listMemberAll'/>'">
                <h3 class="card-title text-uppercase mb-0">会員管理リスト</h3>
				<br>            
            </div>
            <div class="table-responsive">
                <table class="table no-wrap user-table mb-0">
                  <thead>
                    <tr>
                      <th scope="col" class="border-1 text-uppercase font-medium">No.</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">ID</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">パスワード</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">氏名</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">性別</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">生年月日</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">Email</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">TEL</th>
                      <th scope="col" class="border-1 text-uppercase font-medium"></th>
                    </tr>
                  </thead>
                  <tbody>
					<c:forEach var="user" items="${viewAll}">                  
                    <tr>
                      <td>
                          <h5 class="font-medium mb-0">${user.mNum}</h5>
                      </td>
                      <td>
                          <h5 class="font-medium mb-0">${user.mId}</h5>
                      </td>
                      <td>
                          <h5 class="font-medium mb-0">${user.mPwd}</h5>
                      </td>
                      <td>
                          <h5 class="font-medium mb-0">${user.mName}</h5>
                      </td>
                      <td>
                          <h5 class="font-medium mb-0">${user.mGender}</h5>
                      </td>
                      <td>
                          <h5 class="font-medium mb-0">${user.mBirth}</h5>
                      </td>
                      <td>
                          <h5 class="font-medium mb-0">${user.mEmail}</h5>
                      </td>
                      <td>
                          <h5 class="font-medium mb-0">${user.mPhone}</h5>
                      </td>
                      <td>
                      	<a href="${path}/updateMemberByAdmin?mId=${user.mId}"><button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2" ><i class="fa fa-edit"></i> </button></a>
                        <a href="${path}/deleteMemberByAdmin?mId=${user.mId}"><button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2" onclick="return confirm('本当に削除しますか？');" ><i class="fa fa-trash"></i></button></a>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
            </div>
        </div>
    </div>
    <br>
</div>




<div id="paginationBox" class="col-sm-12 col-sm-push-5">
	<ul class="pagination">
		<c:if test="${pagination.prev}">
			<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword}')">이전</a></li>
		</c:if>
		<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
			<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword}')"> ${idx} </a></li>
		</c:forEach>
		<c:if test="${pagination.next}">
			<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}','${pagination.range}', '${pagination.rangeSize}', '${search.searchType}', '${search.keyword}')" >다음</a></li>
		</c:if>
	</ul>
</div>
<footer style="position:relative; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>

</div>
</body>
</html>