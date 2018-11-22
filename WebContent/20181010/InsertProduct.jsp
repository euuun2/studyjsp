<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="product" method="post">
		<label for="id">id</label>
		<input id="id" name="id" type="text">
		<br/>
		<label for="name">이름</label>
		<input id="name" name="name" type="text">
		<br/>
		<label for="info">정보</label>
		<input id="info" name="info" type="text">
		<br/>
		<label for="price">가격</label>
		<input id="price" name="price" type="text">
		<br/>
		<input type="submit" value="입력">
	</form>
</body>
</html>