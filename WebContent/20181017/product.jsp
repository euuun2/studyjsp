<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wdb20181017.Product , java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${productList == null}">
		등록된 상품이 없습니다.
	</c:if>
	<%--
	<c:if test="${productList != null}">
		<c:forEach var="p" items="${productList}">
			제품 아이디 : ${p.id}
			제품명 : ${p.name}
			제품정보 : ${p.info}
			제품 가격 : ${p.price}
		</c:forEach>
	</c:if>
	--%>
	<c:if test = "${productList != null}">
		<c:forEach var="p" items="${productList}">
			<c:out value="${p.name}"/>
		</c:forEach>
	</c:if>
</body>
</html>