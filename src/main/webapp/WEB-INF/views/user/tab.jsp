<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<body>

<table>
	<tr>
	<td><button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/memberInfo"/>'" >マイページ</button></td>
	<td><button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/modifyPwdForm?mId=${vo.mId }"/>'" >パスワード変更</button></td>
	<td><button type="button" class="btn btn-info btn-link" onclick="location.href='<c:url value="/deleteMyAccount"/>'" >会員脱退</button></td>
	</tr>
</table>

</body>
</html>