<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="index.jsp" %>
	<% Date nowDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		String formatDate = dateFormat.format(nowDate);
	%>
	<p>현재 날짜는 <%= formatDate%> 입니다. </p>
</body>
</html>