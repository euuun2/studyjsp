<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="ch11.LogonDBBean" %>

	<%
		//사용자가 입력한 아이디와 비밀번호
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		
		LogonDBBean manager=LogonDBBean.getInstance();
		int check=manager.userCheck(id,passwd);
		
		if(check==1)//사용자 인증에 성공 시 세션 속성을 설정
			session.setAttribute("id",id);
		
		out.println(check);//처리결과 반환
	%>