package homepage;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jdbc.pool.DataSource;

/**
 * Servlet implementation class control
 */
@WebServlet("/control")
public class control extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public control() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("homepage/homepage.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		HttpSession session = request.getSession();
		session.setAttribute("homeList", homeList("name"));
		
		request.getRequestDispatcher("homepage/show.jsp").forward(request,response);
	}
	
	private ArrayList<homeBean> homeList(String name){
		ArrayList<homeBean> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String n = name;
		
		try {
			Context initCtl = new InitialContext();
			Context envCtl = (Context)initCtl.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtl.lookup("jdbc/TestDB");
			conn = ds.getConnection();
			list = new ArrayList<>();
			
			String sql = "select * from product where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				homeBean h = new homeBean();
				h.setId(rs.getInt("id"));
				h.setName(rs.getString("name"));
				h.setInfo(rs.getString("info"));
				h.setPrice(rs.getInt("price"));
				list.add(h);
			}
			
		}catch(Exception e) {
			
		}
		
		return list;
	}
}