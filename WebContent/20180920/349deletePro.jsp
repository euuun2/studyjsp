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
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String dburl = "jdbc:mariadb://localhost:3306/test";
			String dbid = "root";
			String dbpw = "1234";
			
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dburl,dbid,dbpw);
			
			String sql = "select userid,password from member where userid=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String rId = rs.getString("userid");
				String rPasswd = rs.getString("password");
				
				if(id.equals(rId)&&passwd.equals(rPasswd)){
					sql = "delete from member where userid=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,id);
					pstmt.executeUpdate();
					out.println("member테이블의 레코드를 삭제했습니다.");
				}
				else
					out.println("패스워드가 틀렸습니다.");
			}
			else
				out.println("아이디가 틀렸습니다.");
		}catch(Exception e){
			out.println("삭제에 실패했습니다.");
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