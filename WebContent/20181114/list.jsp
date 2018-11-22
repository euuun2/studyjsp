<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>List</h1>
	<c:forEach var="m" items="${members}">
		아이디 : ${m.id }
		비밀번호 : ${m.passwd }
		이름 : ${m.name }
		날짜 : ${m.reg_date }
		주소 : ${m.address }
		전화번호 : ${m.tel }
		<br>
	</c:forEach>
</body>
</html>