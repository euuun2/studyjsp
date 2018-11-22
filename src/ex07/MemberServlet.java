package ex07;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
			request.setCharacterEncoding("UTF-8");
			String userid=request.getParameter("userid");
			String password=request.getParameter("password");
			
			response.getWriter().print(login(userid,password));
		
		
	}
	//1=성공, 0=비번틀림,-1=아이디 없음
			private int login(String userid,String password) {
				int result=0;
				//DBCP를 이용해 사용자의 id를 이용해서 검색
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					Context initCtx = new InitialContext();
					Context envCtx = (Context)initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource)envCtx.lookup("jdbc/TestDB");
					conn = ds.getConnection();
					
					String sql = "select * from member where userid=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,userid);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						String dbPassword=rs.getString("password");
						if(dbPassword.equals(password))
							result=1;
						else
							result=0;
					}else {
						result=-1;
					}
					
				}catch (Exception e) {
					e.printStackTrace();
				}

				return result;
			}
			

}
