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
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String dbid = null;
		String dbpasswd = null;
	%>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/TestDB");
			conn = ds.getConnection();
			
			String sql = "select userid,password from member where userid=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbid = rs.getString("userid");
				dbpasswd = rs.getString("password");
			
				if(id.equals(dbid)&&passwd.equals(dbpasswd)){
					out.println("welcome");
				}else{
					out.println("패스워드가 틀렸습니다.");
				}
			}else{
				out.println("아이디가 틀렸습니다.");
			}
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