package study;

import java.sql.*;

public class dbtest {
	Connection conn;
	Statement stmt;
	ResultSet rs;
	
	public void conn() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("����̹� ���縦 �����߽��ϴ�.");
		}catch(ClassNotFoundException e) {
			System.out.println("����̹� ���翡 �����߽��ϴ�.");
		}
		
		String url="jdbc:mariadb://localhost:3306/test";
		String id="test";
		String passwd="1234";
		
		try {
			this.conn = DriverManager.getConnection(url, id, passwd);
			System.out.println("db���ӿ� �����߽��ϴ�.");
		}catch(SQLException e) {
			System.out.println("db���ӿ� �����߽��ϴ�.");
		}
	}
	
	public void select() {
		try{
			this.stmt = this.conn.createStatement();
			System.out.println("��ü������ �����߽��ϴ�.");
		}catch(SQLException e) {
			System.out.println("��ü������ �����߽��ϴ�.");
		}
		
		String sql = "select * from member";
		
		try {
			this.rs = this.stmt.executeQuery(sql);
			
			while(rs.next()) {
				String userid = rs.getString("userid");
				String username = rs.getString("username");
				String password = rs.getString("password");
				System.out.println(userid);
				System.out.println(username);
				System.out.println(password);
			}
			
		}catch(SQLException e) {
			System.out.println("sql������ ���� ���߽��ϴ�.");
		}
	}
}