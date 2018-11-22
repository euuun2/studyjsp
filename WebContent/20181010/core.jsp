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
	<c:set var="country" value="${'Korea'}"/>
	<c:if test="${country!=null}">
		국가명 : <c:out value="${country}" /><br>
	</c:if>
	<c:choose>
		<c:when test="${country == 'Korea' }">
			<c:out value="${country }"/>는 너무 추워요...
		</c:when>
		<c:when test="${country == 'Canada'}">
			<c:out value="${country }"/>는 너무 추워요...
		</c:when>
		<c:otherwise>
			<c:out value="${country }" />몰라요...
		</c:otherwise>
	</c:choose>
</body>
</html>