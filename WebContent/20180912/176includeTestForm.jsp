<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="177includeTest.jsp">
		<dl>
			<dd>
				<label for="name">이름</label>
				<input id="name" name="name" type="text">
			</dd>
			<dd>
				<label for="pagename">포함할 페이지</label>
				<input id="pagename" name="pageName" type="text" value="177includedTest.jsp">
			</dd>
			<dd>
				<input type="submit" value="전송">
			</dd>
		</dl>
	</form>
</body>
</html>