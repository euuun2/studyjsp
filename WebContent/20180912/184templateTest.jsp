<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%String contentPage = request.getParameter("contentPage"); %>
	<header>
		<nav><jsp:include page="186top.jsp" flush="flush" /></nav>
	</header>
	<div id="leftMenu">
		<jsp:include page="186left.jsp" flush="false"/>
	</div>
	<section id="content">
		<jsp:include page="<%=contentPage %>" flush="false" />
	</section>
	<footer>
		<jsp:include page="186bottom.jsp" flush="false" />
	</footer>
</body>
</html>