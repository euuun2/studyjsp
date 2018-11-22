package ch12.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDBBean{
	
	private static BoardDBBean instance = new BoardDBBean();
	
		public static BoardDBBean getInstance() {
			return instance;
		}
		private BoardDBBean() {}
		
		private Connection getConnection() throws Exception{
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/TestDB");
			return ds.getConnection();
		}
		public int insertArticle(BoardDataBean article) {
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int x=0;
			int number=0;//테이블에 들어갈 글 번호
			String sql="";
			
			int num=article.getNum();
			int ref=article.getRef();
			int re_step=article.getRe_step();
			int re_level=article.getRe_level();
			try {
				conn=getConnection();
				//42~49라인은 현재 board 테이블에 레코드의 유무 판단과 글번호 결정
				pstmt=conn.prepareStatement("select max(num) from board");
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					number=rs.getInt(1)+1;
				}else {
					number=1;
				}
				
				if(num!=0) {
					sql="update board set re_step+1 where ref=? and re_step>?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, ref);
					pstmt.setInt(2, re_step);
					pstmt.executeUpdate();
					re_step=re_step+1;
					re_level=re_level+1;
					
				}else {
					ref=number;
					re_step=0;
					re_level=0;
				}
				//쿼리를 작성:board 테이블에 새로운 레코드 추가
				sql="insert into board(writer,subject,content,passwd,reg_date, ip,ref,re_step,re_level values(?,?,?,?,?,?,?,?,?)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, article.getWriter());
				pstmt.setString(2, article.getSubject());
				pstmt.setString(3, article.getContent());
				pstmt.setString(4, article.getPasswd());
				pstmt.setTimestamp(5, article.getReg_date());
				pstmt.setString(6, article.getIp());
				pstmt.setInt(7, ref);
				pstmt.setInt(8, re_step);
				pstmt.setInt(9, re_level);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
				if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
				if(conn!=null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
			}
			return x;
		}
		
		public int getArticleCount() {
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int x=0;
			
			try {
				conn=getConnection();
				
				pstmt=conn.prepareStatement("select count(*) from board");
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					x=rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
				if(pstmt!=null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
				if(conn!=null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
			}
			return x;
		}
		
		//글의 목록을 가져옴←list.jsp
		public List<BoardDataBean> getArticles(int start,int end){
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<BoardDataBean> articleList=null;//글목록을 저장하는 객체
			try {
				conn=getConnection();
				
				pstmt=conn.prepareStatement("select * from board order by ref desc,re_step asc limit ?,?");
				pstmt.setInt(1,start-1);
				pstmt.setInt(2,end);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {//ResultSet이 레코드를 가짐
					articleList=new ArrayList<BoardDataBean>(end);
					 do {
						 BoardDataBean article=new BoardDataBean();
						 
						 article.setNum(rs.getString("num"));
						 article.setWriter(rs.getString("writer"));
						 article.setSubject(rs.getString("subject"));
						 article.setContent(rs.getString("content"));
						 article.setPasswd(rs.getString("passwd"));
						 article.setReg_date(rs.getTimestamp("reg_date"));
						 article.setReadcount(rs.getString("readcount"));
						 article.setRef(rs.getInt("ref"));
						 article.setRe_step(rs.getInt("re_step"));
						 article.setRe_level(rs.getInt("re_level"));
						 article.setContent(rs.String("content"));
						 article.setIp(rs.getString("ip"));
					 }
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}