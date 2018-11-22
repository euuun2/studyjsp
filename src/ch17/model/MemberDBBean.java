package ch17.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDBBean {
	
	private static MemberDBBean instance = new MemberDBBean();
	
	public static MemberDBBean getInstance() {
		return instance;
	}
	private MemberDBBean() {}
	
	public ArrayList<Member> getList(){
		ArrayList<Member> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Context initCtl = new InitialContext();
			Context envCtl = (Context)initCtl.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtl.lookup("jdbc/TestDB");
			conn = ds.getConnection();
			
			list = new ArrayList<>();
			
			String sql = "select * from members";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member m= new Member();
				m.setId(rs.getString("id"));
				m.setPasswd(rs.getString("passwd"));
				m.setName(rs.getString("name"));
				m.setReg_date(rs.getTimestamp("reg_date"));
				m.setAddress(rs.getString("address"));
				m.setTel(rs.getString("tel"));
				
				list.add(m);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return list;
	}
}
