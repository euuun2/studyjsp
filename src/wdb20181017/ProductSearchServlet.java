package wdb20181017;

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

/**
 * Servlet implementation class ProductSearchServlet
 */
@WebServlet("/ProductSearch")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("20181017/productSearch.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		
		HttpSession session = request.getSession();
		session.setAttribute("productList", getList(name));
		
		request.getRequestDispatcher("20181017/product.jsp").forward(request,response);
	}

	private ArrayList<Product> getList(String postname){
		ArrayList<Product> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String name = postname;
		int count = 0;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/TestDB");
			conn = ds.getConnection();
			
			list = new ArrayList<Product>();
			
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(name.equals(rs.getString("name"))) {
					Product p = new Product();
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setInfo(rs.getString("info"));
					p.setPrice(rs.getInt("price"));
					list.add(p);
					count++;
				}
			}
			
		}catch(Exception e) {
			
		}
		if(count == 0)
			list = null;
		return list;
	}
}
