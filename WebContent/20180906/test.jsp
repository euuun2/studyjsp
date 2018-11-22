<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String result = (String)request.getAttribute("result");
		/*setAttribute에서 모든 것을 다 보낼 수 있기 때문에 받을때 
		  타입을 지정을 해줘야합니다.
		*/
		String[] test=(String[])request.getAttribute("test");
		//배열부분 테스트 배열로 받았으니 배열타입 지정
	%>
	<%= request.getParameter("age") %>
	<%=result %>
	<%=test[0] %>
</body>
</html>