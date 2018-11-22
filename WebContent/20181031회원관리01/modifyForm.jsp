<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ch11.LogonDBBean" %>
    <%@ page import="ch11.LogonDataBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="modify.js"></script>
</head>
<body>
	<%
		String id=(String)session.getAttribute("id");
		String passwd=request.getParameter("passwd");
		
		LogonDBBean manager = LogonDBBean.getInstance();
		LogonDataBean m =manager.getMembers(id, passwd);
		
		try{
	%>
	<div id="regForm" class="box">
		<ul>
			<li><p class="center">회원정보수정
			<li><label>아이디</label>
				<input id="id" name="id" type="email" size="20" maxlength="50" value="<%=id %>" readonly disabled>
			<li><label>비밀번호</label>
				<input id="passwd" name="passwd" type="password" size="20" placeholder="6~16자 숫자/문자" maxlength="16">
			<li><label>이름</label>
				<input id="name" name="name" type="text" size="20" value="<%=m.getName() %>" maxlength="10">
			<li><label>주소</label>
				<input id="address" name="address" type="text" size="30" value="<%=m.getAddress() %>" maxlength="50">
			<li><label>전화번호</label>
				<input id="tel" name="tel" type="tel" size="20" value="<%=m.getTel() %>" maxlength="20">
				<li class="label2"><button id="modifyProcess">수정</button>
									<button id="cancle">취소</button>
		</ul>
	</div>
	<%
		}catch(Exception e){}
	%>
</body>
</html>