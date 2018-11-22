package wdb20181004;

import java.io.IOException;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TodoServlet
 */
@WebServlet("/TodoServlet")
public class TodoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//5
		HttpSession session = request.getSession();	//������ ������ش�.
		session.setAttribute("todoList",getList());	//db���� ������ list�� todolist��� ���ǿ� �����Ѵ�.
		
		//2
		//response.sendRedirect("todo.jsp");	//���� ������ �ƴ� webcontent���� jsp���� �ٷ� ��������� �̰�����
		request.getRequestDispatcher("20181004/todo.jsp").forward(request,response);	//������ ����� �̰ɷ�
		
		//6 Ȯ���ϱ� ���� db���� insert into todo(detail) values("job1") �����ϱ�
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//9
		request.setCharacterEncoding("UTF-8");
		String detail = request.getParameter("detail");
		add(detail);
		HttpSession session = request.getSession();
		session.setAttribute("todoList",getList());
		
		//2
		//response.sendRedirect("todo.jsp");	//���� ������ �ƴ� webcontent���� jsp���� �ٷ� ��������� �̰�����
		request.getRequestDispatcher("20181004/todo.jsp").forward(request,response);	//������ ����� �̰ɷ�
	}
	
	//4
	private ArrayList<TodoBean> getList(){	//����Ʈ�� db���� �ҷ��ͼ� ����
		ArrayList<TodoBean> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/TestDB");
			conn = ds.getConnection();
			
			list = new ArrayList<>();	//������� �Դٴ� ���� ������ �Ǿ��ٴ� ���̱� ������ list����
			
			//������ ��ȸ �� list�� ����
			String sql = "select * from todo";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TodoBean t = new TodoBean();	//list�� TodoBeanŸ���̴ϱ� �����ϱ� ���ؼ� �����.
				t.setId(rs.getInt("_id"));
				t.setDetail(rs.getString("detail"));
				t.setDone(rs.getBoolean("done"));
				list.add(t);
			}
		}catch(Exception e) {
			
		}
		
		return list;
	}
	
	//8
	private int add(String detail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try{
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/TestDB");
			conn = ds.getConnection();
			
			String sql = "insert into todo (detail) values(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,detail);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
