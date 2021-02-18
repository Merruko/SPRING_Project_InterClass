<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<body>
<table>
	<tr>
	<td><button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/memberInfo"/>'" >내정보</button></td>
	<td><button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/modifyPwdForm?mId=${vo.mId }"/>'" >비밀번호 변경</button></td>
	<td><button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/deleteMyAccount"/>'" >회원 탈퇴</button></td>
	</tr>
</table>
</body>
</html>