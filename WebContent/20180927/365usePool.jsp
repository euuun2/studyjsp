<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr class="label">
			<td>아이디</td>
			<td>이름</td>
			<td>비밀번호</td>
		</tr>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/TestDB");
			conn = ds.getConnection();
			
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();	
			
			while(rs.next()){
				String id = rs.getString("userid");
				String passwd = rs.getString("password");
				String name = rs.getString("username");
	%>
	<tr>
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=passwd %></td>
	</tr>
	<% }
		
		}catch(Exception e){
			
		}finally{
			if(rs!=null){
				try{
					rs.close();
				}catch(SQLException e){
					
				}
			}
			if(pstmt!=null){
				try{
					pstmt.close();
				}catch(SQLException e){
					
				}
			}
			if(conn!=null){
				try{
					conn.close();
				}catch(SQLException e){
					
				}
			}
		}
	%>
</body>
</html>