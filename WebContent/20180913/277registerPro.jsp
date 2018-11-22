<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%request.setCharacterEncoding("utf-8"); %>
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="registerBean" class="wdb20180913.RegisterBean274">
		<jsp:setProperty name="registerBean" property="*" />
	</jsp:useBean>
	<%registerBean.setReg_date(new Timestamp(System.currentTimeMillis())); %>
	<table class="content">
		<tr>
			<td>아이디
			<td><jsp:getProperty name="registerBean" property="id" />
		<tr>
			<td>비밀번호
			<td><jsp:getProperty name="registerBean" property="passwd" />
		<tr>	
			<td>이름
			<td><jsp:getProperty name="registerBean" property="name" />
		<tr>	
			<td>가입일
			<td><jsp:getProperty name="registerBean" property="reg_date" />
	</table>
</body>
</html>