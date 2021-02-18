<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	body{
    margin-top:20px;
    background:#f8f8f8;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function deleConfirm(){
	if ($("input:checkbox[name=agreement]").is(":checked")) {
		
		if($("#userId").val() == $("#deleteId").val() &&
				$("#userPwd").val() == $("#deletePwd").val()){
			
			var result = confirm("정말 탈퇴하시겠습니까?");
			
	    	if(result == true){
	    		alert("탈퇴가 완료되었습니다.");
	    		return true;
	    	} else {
	    		alert("탈퇴를 취소하셨습니다.");
	    		return false
	    	}
			
		} else {
			alert("탈퇴하는 아이디와 비밀번호를 다시 확인해주세요.");
			return false;
		}

    } else {
    	alert("탈퇴약관에 동의해주십시오.");
    	return false;
    }
}
</script>
<body>
<br>
	<div class="container text-center" onclick="location.href='<c:url value='/'/>'">
  			<h1>InterClass</h1>
	</div>
<br>
<hr>

<div class="container" style="width: 800px;">
	<div class="row flex-lg-nowrap">
	
	<div class="col-12 col-lg-auto mb-3" style="width: 200px;">
    <div class="card p-3">
      <div class="e-navlist e-navlist--active-bg">
        <ul class="nav">
          <li class="nav-item"><a class="nav-link px-2 active" href="${path}/memberInfo"><span>｜My Page</span></a></li>
          <li class="nav-item"><a class="nav-link px-2 active" href="${path}/updateMember?mId=${mId}"><span>｜내정보 수정</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${path}/modifyPwdForm?mId=${mId}"><span>｜비밀번호 변경</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${path}/deleteMyAccount"><span>｜회원탈퇴</span></a></li>
         </ul>
       </div>
     </div>
   </div>
   
   <div class="col">
    <div class="row">
      <div class="col mb-3">
        <div class="card">
          <div class="card-body">
            <div class="e-profile">
              <div class="tab-content pt-3">
              
<form action=deleteMyAccount method="post">  

<div class="row">
<div class="col">
<div class="row">
<div class="col">

<div class="row">
	<div class="col">
		<div style="border: 1px solid grey; padding: 20px 20px 20px 20px">
		<p>
		※ 회원탈퇴 시 주의사항 안내문 ※<br><br>
		회원을 탈퇴 하시면 해당 아이디로는 재가입 할 수 없습니다.<br>
		탈퇴 시 보유하고 계신 예약 강의와 수강 내역 등 모두 삭제되어,<br>
		복구가 불가능 하니 신중하게 결정 부탁 드립니다.<br>
		</p>
		</div>
	</div>
</div>
<br>
<input type="checkbox" name="agreement" > ※ 위 내용을 모두 확인하였으며, 이에 동의합니다.<br><br>
<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>아이디</b></label>
			<input class="form-control mb-2" type="text"  name="deleteId" id="deleteId">
		</div>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>비밀번호</b></label>
			<input class="form-control mb-2" type="password"  name="deletePwd" id="deletePwd">
		</div>
	</div>
</div>

<input type="text" name="userId" id="userId" value="${mId}" style="visibility:hidden" >
<input type="text" name="userPwd" id="userPwd" value="${mPwd}" style="visibility:hidden">

<div class="form-row float-right">
	<button type="submit" class="btn btn-primary btn-lg mb-2" onclick="return deleConfirm();">탈퇴</button>
</div>

</div>
</div>
</div>
</div>
                    
</form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	
	</div>
</div>

</body>
</html>