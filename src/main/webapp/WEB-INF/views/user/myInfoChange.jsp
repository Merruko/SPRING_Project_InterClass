<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
    body{
	    margin-top:20px;
	    background-color: #f2f3f8;
	}
	.card {
	    margin-bottom: 1.5rem;
	    box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
	}
	
	.card {
	    position: relative;
	    display: -ms-flexbox;
	    display: flex;
	    -ms-flex-direction: column;
	    flex-direction: column;
	    min-width: 0;
	    word-wrap: break-word;
	    background-color: #fff;
	    background-clip: border-box;
	    border: 1px solid #e5e9f2;
	    border-radius: .2rem;
	}
</style>
</head>
<body>
<%@include file="../menu.jsp" %>
<div class="container h-100">
    		<div class="row h-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							<h1 class="h2">회원정보수정</h1>
							<p class="lead">
							</p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<form action="updateMember" name="memInfoChangeForm" method="post">
										<div class="form-group">
											<label>아이디</label>
											<input class="form-control form-control-lg" type="text" name="mId" value="${vo.mId}" readonly="readonly" >
										</div>
										<div class="form-group">
											<label>비밀번호</label>
											<input class="form-control form-control-lg" type="password" name="mPwd">
										</div>
										<div class="form-group">
											<label>이름</label>
											<input class="form-control form-control-lg" type="text" name="mName" value="${vo.mName}" >
										</div>
										<div class="form-group">
											<label>성별</label>
											<select class="form-control form-control-lg" id="gender" name="mGender" >
												<option value="남성" <c:if test="${vo.mGender == '남성'}">selected</c:if>>남성</option>
												<option value="여성" <c:if test="${vo.mGender == '여성'}">selected</c:if>>여성</option>
											</select>
										</div>
										<div class="form-group">
											<label>생일</label>
											<input class="form-control form-control-lg" type="text" name="mBirth" value="${vo.mBirth}" >
										</div>
										<div class="form-group">
											<label>이메일</label>
											<input class="form-control form-control-lg" type="email" name="mEmail" value="${vo.mEmail}" >
										</div>
										<div class="form-group">
											<label>전화번호</label>
											<input class="form-control form-control-lg" type="text" name="mPhone" value="${vo.mPhone}" >
										</div>
										<div class="text-center mt-3">
											<button type="submit" class="btn btn-lg btn-primary">저장</button>
											<!-- 작성을 취소하면 마이페이지 메인홈으로, 일단 수정전 회원상세페이지로 연동 -->
											<a href="${path}/memberInfo?mId=${vo.mId}"><button type="button" class="btn btn-lg btn-primary">취소</button></a>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>