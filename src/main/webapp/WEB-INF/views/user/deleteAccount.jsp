<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員脱退</title>
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
			
			var result = confirm("本当に脱退しますか？");
			
	    	if(result == true){
	    		alert("脱退が完了しました。");
	    		return true;
	    	} else {
	    		alert("脱退をキャンセルしました。");
	    		return false
	    	}
			
		} else {
			alert("該当するIDとパスワードを確認してください。");
			return false;
		}

    } else {
    	alert("脱退約款に同意してください。");
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
	
	<div class="col-12 col-lg-auto mb-3" style="width: 210px;">
    <div class="card p-3">
      <div class="e-navlist e-navlist--active-bg">
        <ul class="nav">
          <li class="nav-item"><a class="nav-link px-2 active" href="${path}/memberInfo"><span>｜マイページ</span></a></li>
          <li class="nav-item"><a class="nav-link px-2 active" href="${path}/updateMember?mId=${mId}"><span>｜情報修正</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${path}/modifyPwdForm?mId=${mId}"><span>｜パスワード変更</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${path}/deleteMyAccount"><span>｜会員脱退</span></a></li>
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
		※ 脱退約款 ※<br>
		<br>
		お持ちの予約と受講の内訳など一切が削除となり、<br>
		復旧は出来かねますので、慎重にご決定をお願い致します。<br>
		今まで本サイトをご利用頂き、誠にありがとうございました。
		<br>
		</p>
		</div>
	</div>
</div>
<br>
<input type="checkbox" name="agreement" >　※ 上記の内容を全部確認したうえで、同意します。<br><br>
<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>ID</b></label>
			<input class="form-control mb-2" type="text"  name="deleteId" id="deleteId">
		</div>
	</div>
</div>
<div class="row">
	<div class="col">
		<div class="form-group">
			<label><b>パスワード</b></label>
			<input class="form-control mb-2" type="password"  name="deletePwd" id="deletePwd">
		</div>
	</div>
</div>

<input type="text" name="userId" id="userId" value="${mId}" style="visibility:hidden" >
<input type="text" name="userPwd" id="userPwd" value="${mPwd}" style="visibility:hidden">

<div class="form-row float-right">
	<button type="submit" class="btn btn-primary btn-lg mb-2" onclick="return deleConfirm();">脱退</button>
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