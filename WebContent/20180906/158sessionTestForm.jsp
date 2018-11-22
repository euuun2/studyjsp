<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(session.getAttribute("id") == null){ %>
		<form method="post" action="159sessionTest.jsp">
			<label for="id">아이디</label>
			<input id="id" name="id" type="text" required>
			<label for="password">비밀번호</label>
			<input id="password" name="password" type="password" required>
			<input	type="submit" value="로그인">
		</form>
	<%}else{ %>
		<form method="post" action="160logout.jsp">
			<%=session.getAttribute("id") %>님 오셨습니까?
			<input type="submit" value="로그아웃">
		</form>
	<%} %>
</body>
</html>