<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<style type="text/css">
	body{margin: auto;}
	table{width: 500px; border-collapse: collapse;}
	tr, td{border: 1px solid white; padding: 10px;}
	input[type="text"],[type="password"] {width: 200px; height: 20px;}
	input[type="reset"],[type="submit"] {border: 1px solid #333; border-radius: 5px; padding: 5px 25px; background: orange; text-decoration: none; color: black; font-size: 0.9em; font-weight: bold;}
	input[type="radio"] {display: none;}
	p{margin: 0 0 20px; line-height: 1.5;}
    h1{padding: 20px 0; font-weight: bold; text-align: center;}
	section{display: none; padding: 20px 0 0; border-top: 1px solid #ddd;}
	label{display: inline-block; margin: 0 0 -1px; padding: 15px 25px; font-weight: 600; text-align: center; border: 1px solid transparent;}
    .main{min-width: 320px; max-width: 800px; margin: 0 auto; background: #ffffff;}
	.button{border: 1px solid #333; border-radius: 5px; padding: 5px 25px; background: orange; text-decoration: none; color: black; font-size: 0.9em; font-weight: bold;}
	.notice{text-align: center; border: 1px solid; height: 200px; font-size: 15px; line-height: 140px; padding: 50px;}
	label:hover{color: #2e9cdf; cursor: pointer;}
	input:checked + label{border: 1px solid #ddd; border-top: 2px solid #2e9cdf; border-bottom: 1px solid #ffffff;}
	#tab1:checked ~ #content1,
	#tab2:checked ~ #content2,
	#tab3:checked ~ #content3,
	#tab4:checked ~ #content4 {display: block;}     
</style>

</head>
<body>
	<jsp:include page="../menu.jsp" />
	
	<div class="main">
	
    <h1>My Page</h1>
    
      <ul class="nav nav-tabs padding-18">
        <li class="active">
          <a data-toggle="tab" href="#myinfo">
            내정보
          </a>
        </li>

        <li>
          <a data-toggle="tab" href="#info_modify">
            정보수정
          </a>
        </li>

        <li>
          <a data-toggle="tab" href="#password_modify">
            비밀번호변경
          </a>
        </li>

        <li>
          <a data-toggle="tab" href="#info_delete">
            회원 탈퇴
          </a>
        </li>
      </ul>
	
	
      <div class="tab-content no-border padding-24">
        <div id="myinfo" class="tab-pane in active">
          <section id="content1">
		       <table>
		       		<tr>
						<td>아이디</td>
						<td>${vo.mId }</td>
					</tr>
					<tr><td>　</td></tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="mPwd" value="${vo.mPwd }" disabled></td>
						<td><a href="#" class="button">비밀번호 변경</a></td>
					<tr><td>　</td></tr>
					</tr>
					<tr>
						<td>이름</td>
						<td>${vo.mName }</td>
					<tr><td>　</td></tr>
					</tr>
					<tr>
						<td>성별</td>
						<td>${vo.mGender }</td>
					<tr><td>　</td></tr>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>${vo.mBirth }</td>
					<tr><td>　</td></tr>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${vo.mEmail }</td>
					<tr><td>　</td></tr>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${vo.mPhone }</td>
					<tr><td>　</td></tr>
					</tr>
		       </table>
      	 </section>
        </div>
        
        
        <div id="info_modify" class="tab-pane">
          <section id="content2">
			    <form action="updateMember" method="post">
					<table>
						<tr>
							<td>아이디</td>
							<td>${vo.mId }</td>
						</tr>
						<tr><td>　</td></tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="mPwd3" value="${vo.mPwd }" disabled></td>
							<td><a href="#" class="button">비밀번호 변경</a></td>
						</tr>
						<tr><td>　</td></tr>
						<tr>
							<td>생년월일</td>
							<td><input type="text" name="mBirth" value="${vo.mBirth }"></td>
						</tr>
						<tr><td>　</td></tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="mEmail" value="${vo.mEmail }"></td>
						</tr>
						<tr><td>　</td></tr>
						<tr>
							<td>연락처</td>
							<td><input type="text" name="mPhone" value="${vo.mPhone }"></td>
						</tr>
					</table><br>
					<input type="reset" value="취소">
					<input type="submit" value="변경">
			    </form>
			</section>
        </div>


        <div id="password_modify" class="tab-pane">
	          <section id="content3">
				<table>
					<tr>
						<td>현재 비밀번호</td>
						<td><input type="password" name="mPwd2" value="${vo.mPwd }"></td>
					</tr>
					<tr><td>　</td></tr>
					<tr>
						<td>새 비밀번호</td>
						<td><input type="password" name="nPwd"></td>
					</tr>
					<tr><td>　</td></tr>
					<tr>
						<td>비밀번호 재확인</td>
						<td><input type="password" name="nPwd_c"></td>
					</tr>
				</table><br>
				<input type="reset" value="취소">
				<input type="submit" value="변경" onClick="if(confirm('정말로 비밀번호를 변경하시겠습니까?')){location.href='#.do';}">		
	  		  	<table>	
	  		  		<tr><td>　</td></tr>
					<tr><td>　</td></tr>
					<tr><td>　</td></tr>
					<tr><td>　</td></tr>
				</table>
	  		  </section>
        </div>
        
        
        <div id="info_delete" class="tab-pane">
          <section id="content4">
		    	<div class="notice">
					<p>
					※ 회원탈퇴 시 주의사항 안내문 ※<br><br>
					회원을 탈퇴 하시면 해당 아이디로는 재가입 할 수 없습니다.<br>
					탈퇴 시 보유하고 계신 예약 강의와 수강 내역 등 모두 삭제되어,<br>
					복구가 불가능 하니 신중하게 결정 부탁 드립니다.<br>
					</p>
				</div>
		        <br>
		        <div>
			        <input type="checkbox"> ※ 위 내용을 모두 확인하였으며, 이에 동의합니다.<br><br>
					<input type="reset" value="취소">
					<input type="submit" value="탈퇴" onClick="if(confirm('정말로 탈퇴하시겠습니까?')){location.href='#.do';}">		
				</div>
		    </section>
        </div>
	</div>
</div>
        
<jsp:include page="../footer.jsp" />
</body>
</html>