<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="login.js"></script>
</head>
<body>
	<%
		String id="";
		
		try{
			id=(String)session.getAttribute("id");
		
	%>
	<%if(id==null||id.equals("")){//인증되지 않은 사용자 영역%> 
		<div id="status">
			<ul>
				<li><label>아이디</label>
					<input id="id" name="id" type="email" size="20" maxlength="50" placeholder="example@naver.com">
				<li><label>비밀번호</label>
					<input id="passwd" name="passwd" type="password" size="20" placeholder="6~16자 숫자/문자" maxlength="16">
				<li class="label2">
					<button id="login">로그인</button>
					<button id="register">회원가입</button>
			</ul>
		</div>
		<%}else{ //인증된 사용자 영역%>
			<div id="status">
				<ul>
					<li><b><%=id %></b>님이 로그인 하셨습니다.
					<li class="label2"><button id="logout">로그아웃</button>
						<button id="update">회원 정보 변경</button>
				</ul>
			</div>
	<%}}catch(Exception e){e.printStackTrace();} %>
</body>
</html>