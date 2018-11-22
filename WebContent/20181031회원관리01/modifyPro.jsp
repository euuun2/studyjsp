<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ch11.LogonDBBean" %>

<%
	request.setCharacterEncoding("utf-8");
%>

	<jsp:useBean id="members" class="ch11.LogonDataBean">
		<jsp:setProperty name="members" property="*"/>
	</jsp:useBean>

<%
	LogonDBBean manager = LogonDBBean.getInstance();

	int check=manager.updateMembers(members);
	
	out.println(check);
%>