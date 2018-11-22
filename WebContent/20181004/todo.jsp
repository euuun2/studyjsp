<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wdb20181004.TodoBean, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--1--%>
	<form action="TodoServlet" method="post">
		<input type="text" name="detail" />
		<input type="submit" value="ADD" />
	</form>
	<%--7--%>
	<c:if test = "${todoList == null} ">
		데이터가 없습니다.....
	</c:if>
	<ul>
	<c:if test = "${todoList != null } ">
		<c:forEach var="list" items="${todoList} ">
			<li>${list.detail}</li>
		</c:forEach>
	</c:if>
	</ul>
</body>
</html>