<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie cookie = new Cookie("id","goeun");
		cookie.setMaxAge(60*2);
		response.addCookie(cookie);
		
		out.println("쿠키가 생성되었습니다.");
	%>
	<form method="post" action="useCookie.jsp">
		<input type="submit" value="생성된 쿠키 확인">
	</form>
</body>
</html>