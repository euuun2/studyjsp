<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%request.setCharacterEncoding("utf-8"); %>
<title>Insert title here</title>
</head>
<body>
	<%
		String pageName = request.getParameter("pageName");
	%>
	포함하는 페이지 177includeTest.jsp입니다.<br>
	<hr>
	<jsp:include page="<%=pageName %>" flush="false"/>
	177includeTest.jsp의 나머지 내용입니다.
</body>
</html>