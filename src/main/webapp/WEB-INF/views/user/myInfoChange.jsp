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
	input[type="reset"],[type="submit"], button {border: 1px solid #333; border-radius: 5px; padding: 5px 25px; background: orange; text-decoration: none; color: black; font-size: 0.9em; font-weight: bold;}
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
    
    <jsp:include page="./tab.jsp" />
    <form action="updateMember" name="memInfoChangeForm" method="post">
      <div class="tab-content no-border padding-24">
        <div id="myinfo" class="tab-pane in active">
          <section id="content1">
		       <table>
		       		<tr>
						<td>아이디</td>
						<td><input type="text" name="mId" value="${vo.mId}" readonly="readonly" ></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="mPwd"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="mName" value="${vo.mName}" ></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<select id="gender" name="mGender" >
								<option value="남성" <c:if test="${vo.mGender == '남성'}">selected</c:if>>남성</option>
								<option value="여성" <c:if test="${vo.mGender == '여성'}">selected</c:if>>여성</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" name="mBirth" value="${vo.mBirth}" ></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" name="mEmail" value="${vo.mEmail}" ></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" name="mPhone" value="${vo.mPhone}" ></td>
					</tr>
		       </table>
		       <div>
		       <button type="submit" >저장</button>
		       <button type="button" onclick="location.href='${path}/memberInfo?mId=${vo.mId}'" >취소</button>
		       </div>
      	 </section>
        </div>
      </div> 
     </form>
    </div>  
   
<jsp:include page="../footer.jsp" />
</body>
</html>