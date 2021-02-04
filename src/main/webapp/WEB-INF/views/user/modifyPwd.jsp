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
    <jsp:include page="./tab.jsp" />
      <div class="tab-content no-border padding-24">
        <div id="myinfo" class="tab-pane in active">
          

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
	  		  </section>
        </div>
        
        
	</div>
</div>
</div>
        
<jsp:include page="../footer.jsp" />
</body>
</html>