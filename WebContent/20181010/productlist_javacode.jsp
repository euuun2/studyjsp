<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wdb20181010.Product, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	//4
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("productList");
		if(list!=null){
			out.println("<form>");
			for(Product p:list){
	%>
				<input type="checkbox" name="selected" value="<%=p.getId() %>">
				<%=p.getName() %>
				<%=p.getInfo() %>
				<%=p.getPrice() %>
				<br>
	<% 		}
			out.println("</form>");
		}	
	%>
</body>
</html>