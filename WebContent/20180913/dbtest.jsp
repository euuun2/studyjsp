<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = null;
		ResultSet set = null;
		try{
			String url = "jdbc:mariadb://localhost:3306/test";
			String id = "root";
			String pw = "1234";
			PreparedStatement stmt = null;
			
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url,id,pw);
			if(conn != null){
				out.println("mariaDB connected<br>");
				stmt = conn.prepareStatement("select * from member");
				set = stmt.executeQuery();
				while(set.next()){
					out.println(set.getString(1) + "   " + set.getString(2) + "   " + set.getString(3) + "   " + "<br>");
				}
				conn.close();
			}
		}catch(Exception e){
			out.println(e);
		}
	%>
</body>
</html>