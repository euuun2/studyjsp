<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ch11.LogonDBBean" %>

	<%
		String id=request.getParameter("id");
	
		LogonDBBean manager = LogonDBBean.getInstance();
		
		int check=manager.confirmId(id);
		
		out.println(check);
	%>
