package ch11;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

public class LogonDBBean {
	
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	private LogonDBBean() {}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/TestDB");
		return ds.getConnection();
	}
	
	public void insertMembers(LogonDataBean members) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
			
			String orgPass=members.getPasswd();
			
			pstmt=conn.prepareStatement("insert into members values(?,?,?,?,?,?)");
			pstmt.setString(1,members.getId());
			pstmt.setString(2,orgPass);
			pstmt.setString(3,members.getName());
			pstmt.setTimestamp(4,members.getReg_date());
			pstmt.setString(5,members.getAddress());
			pstmt.setString(6,members.getTel());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
	}
	
	public int userCheck(String id, String passwd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int x=-1;
		
		try {
			conn = getConnection();
			
			String orgPass=passwd;
			
			pstmt=conn.prepareStatement("select passwd from members where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String dbpasswd=rs.getString("passwd");
				if(dbpasswd.equals(orgPass))
					x=1;
				else
					x=0;
			}else
				x=-1;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return x;
	}
	
	public int confirmId(String id) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int x=-1;
		
		try {
			conn = getConnection();
			
			pstmt=conn.prepareStatement("select id from members where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				x=1;
			else
				x=-1;
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return x;
	}
	
	public LogonDataBean getMembers(String id,String passwd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		LogonDataBean members=null;
		
		try {
			conn = getConnection();
			
			String orgPass=passwd;
			
			pstmt=conn.prepareStatement("select * from members where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String dbpasswd=rs.getString("passwd");
				if(dbpasswd.equals(orgPass)) {
					members=new LogonDataBean();
					members.setId("id");
					members.setName(rs.getString("name"));
					members.setReg_date(rs.getTimestamp("reg_date"));
					members.setAddress(rs.getString("address"));
					members.setTel(rs.getString("tel"));
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return members;
	}
	
	public int updateMembers(LogonDataBean members) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int x=-1;
		
		try {
			conn = getConnection();
			
			String orgPass=members.getPasswd();
			
			pstmt=conn.prepareStatement("select passwd from members where id=?");
			pstmt.setString(1, members.getId());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String dbpasswd=rs.getString("passwd");
				if(dbpasswd.equals(orgPass)) {
					pstmt=conn.prepareStatement("update members set name=?,address=?,tel=? where id=?");
					pstmt.setString(1,members.getName() );
					pstmt.setString(2,members.getAddress() );
					pstmt.setString(3,members.getTel() );
					pstmt.setString(4,members.getId() );
					pstmt.executeUpdate();
					x=1;
				}else
					x=0;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return x;
	}
	
	public int deleteMembers(String id,String passwd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int x=-1;
		
		try {
			conn = getConnection();
			
			String orgPass=passwd;
			
			pstmt=conn.prepareStatement("select passwd from members where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String dbpasswd=rs.getString("passwd");
				if(orgPass.equals(dbpasswd)) {
					pstmt=conn.prepareStatement("delete from members where id=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x=1;
				}else
					x=0;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return x;
	}
	
}
