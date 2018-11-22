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
	<jsp:useBean id="testBean260" class="wdb20180913.TestBean260">
		<jsp:setProperty name="testBean260" property="id" />
	</jsp:useBean>
	
	입력된 아이디:<jsp:getProperty name="testBean260" property="id" />
</body>
</html>