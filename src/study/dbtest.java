package study;

import java.sql.*;

public class dbtest {
	Connection conn;
	Statement stmt;
	ResultSet rs;
	
	public void conn() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("드라이버 적재를 성공했습니다.");
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버 적재에 실패했습니다.");
		}
		
		String url="jdbc:mariadb://localhost:3306/test";
		String id="test";
		String passwd="1234";
		
		try {
			this.conn = DriverManager.getConnection(url, id, passwd);
			System.out.println("db접속에 성공했습니다.");
		}catch(SQLException e) {
			System.out.println("db접속에 실패했습니다.");
		}
	}
	
	public void select() {
		try{
			this.stmt = this.conn.createStatement();
			System.out.println("객체생성에 성공했습니다.");
		}catch(SQLException e) {
			System.out.println("객체생성에 실패했습니다.");
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
			System.out.println("sql실행을 하지 못했습니다.");
		}
	}
}