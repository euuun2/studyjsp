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
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		if(id.equals("kingdora") && password.equals("1234"))
			session.setAttribute("id",id);
		
		response.sendRedirect("158sessionTestForm.jsp");
	%>
</body>
</html>