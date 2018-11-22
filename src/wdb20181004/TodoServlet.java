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
		HttpSession session = request.getSession();	//세션을 만들어준다.
		session.setAttribute("todoList",getList());	//db에서 가져온 list를 todolist라는 세션에 저장한다.
		
		//2
		//response.sendRedirect("todo.jsp");	//폴더 생성이 아닌 webcontent에서 jsp파일 바로 만들었으면 이것으로
		request.getRequestDispatcher("20181004/todo.jsp").forward(request,response);	//폴더를 만들면 이걸로
		
		//6 확인하기 위해 db에서 insert into todo(detail) values("job1") 실행하기
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
		//response.sendRedirect("todo.jsp");	//폴더 생성이 아닌 webcontent에서 jsp파일 바로 만들었으면 이것으로
		request.getRequestDispatcher("20181004/todo.jsp").forward(request,response);	//폴더를 만들면 이걸로
	}
	
	//4
	private ArrayList<TodoBean> getList(){	//리스트를 db에서 불러와서 저장
		ArrayList<TodoBean> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/TestDB");
			conn = ds.getConnection();
			
			list = new ArrayList<>();	//여기까지 왔다는 것은 연결이 되었다는 것이기 때문에 list생성
			
			//데이터 조회 후 list에 저장
			String sql = "select * from todo";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TodoBean t = new TodoBean();	//list가 TodoBean타입이니까 저장하기 위해서 만든다.
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
