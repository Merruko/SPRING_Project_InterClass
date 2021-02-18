<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 관리 목록</title>
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
<body>
<%@include file="../menu.jsp" %>
<div class="container">
<br>
<br>
<br>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title text-uppercase mb-0">회원 관리 목록</h5>
            </div>
            <div class="table-responsive">
                <table class="table no-wrap user-table mb-0">
                  <thead>
                    <tr>
                      <th scope="col" class="border-1 text-uppercase font-medium">no.</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">아이디</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">비밀번호</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">이름</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">성별</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">생일</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">이메일</th>
                      <th scope="col" class="border-1 text-uppercase font-medium">전화번호</th>
                      <th scope="col" class="border-1 text-uppercase font-medium"></th>
                    </tr>
                  </thead>
                  <tbody>
					<c:forEach var="user" items="${list}">                  
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
                        <a href="${path}/deleteMemberByAdmin?mId=${user.mId}"><button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2" onclick="return confirm('정말로 삭제하시겠습니까?');" ><i class="fa fa-trash"></i> </button></a>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>