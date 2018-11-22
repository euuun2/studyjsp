<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.sql.* , javax.sql.*, javax.naming.InitialContext, javax.naming.Context"  %>
</head>
<body>
	<%
		InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myOracle");
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from v$version");
		while(rset.next()){
			System.out.println("SQL version:"+rset.getString(1));
		}
		rset.close();
		stmt.close();
		conn.close();
		ctx.close();
	%>
</body>
</html>