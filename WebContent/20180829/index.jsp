<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>hello world!</h1>
	<% 
		int a = 0;
		int b = 1;
		int c = a + b;
		out.println(c);
		
		out.println("<ol>");
		for(int i = 0; i< 5; i++){
			out.println("<li> " + i + "</li>");
		}
		out.println("</ol>");
	%>
</body>
</html>