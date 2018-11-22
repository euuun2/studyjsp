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
		String age = request.getParameter("age");
		int a = Integer.parseInt(age);
	
		if(a>=20)
			out.print("성인입니다.");
		else
			out.print("성인이 아닙니다.");
	%>
</body>
</html>