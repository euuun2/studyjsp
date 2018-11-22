package wdb20181010;

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
import javax.sql.DataSource;

//2

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("productList",getList());
		
		request.getRequestDispatcher("20181010/InsertProduct.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("productList",getList());
		
		request.getRequestDispatcher("20181010/productlist.jsp").forward(request,response);
	}
	
	public ArrayList<Product> getList(){
		ArrayList<Product> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Context initCtl = new InitialContext();
			Context envCtl = (Context)initCtl.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtl.lookup("jdbc/TestDB");
			conn = ds.getConnection();
			
			list = new ArrayList<>();
			
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setInfo(rs.getString("info"));
				p.setPrice(rs.getInt("price"));
				list.add(p);
			}
		}catch(Exception e) {
			
		}
		return list;
	}

}
