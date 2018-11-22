<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>주석 예제</h2>
	<%
		//자바 주석입니다.
		//문자열 변수 선언 및 초기값 할당
		String str1 = "소스보기를 하면 화면에 표시됩니다.";
		String str2 = "소스보기를 해도 화면에 표시되지 않습니다.";
	%>
	
	<!--  html 주석입니다.<%=str1%> -->
	<%-- Jsp주석입니다.<%=str2%> --%>
</body>
</html>