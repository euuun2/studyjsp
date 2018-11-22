<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String str = "안녕하세요";
	int globalNum = 5;
	public int square(int n)
	{
		return n*n;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int localNum = 5;
		globalNum++;
		localNum++;
		out.print(str + "<br>" + globalNum + "<br>" + localNum + "<br>");
		out.print(localNum + "의 제곱 = " + square(localNum));
	%>
</body>
</html>