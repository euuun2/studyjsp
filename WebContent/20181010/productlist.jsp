<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wdb20181010.Product, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3</title>
</head>
<body>
	<c:if test="${productList == null }">
		등록된 상품이 없습니다.
	</c:if>
	<c:if test="${productList != null }">
		<form>
			<c:forEach var="p" items="${productList }">
				<input type="checkbox" name="selected" value="${p.id }">
				${p.name},${p.info},${p.price}
				</br>
			</c:forEach>
		</form>
	</c:if>
</body>
</html>