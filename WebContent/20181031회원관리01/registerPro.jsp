<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="ch11.LogonDBBean" %>
	<%@ page import="java.sql.Timestamp" %>
	
	<jsp:useBean id="members" class="ch11.LogonDataBean">
		<jsp:setProperty name="members" property="*"/>
	</jsp:useBean>
	
	<%
		//폼으로 부터 넘어오지 않는 데이터인 가입 날짜를 직접 데이터 저장빈에 세팅
		members.setReg_date(new Timestamp(System.currentTimeMillis()));
	
		LogonDBBean manager=LogonDBBean.getInstance();
		
		manager.insertMembers(members);
	%>