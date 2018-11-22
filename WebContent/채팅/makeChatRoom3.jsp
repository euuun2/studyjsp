<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%
		String userID = null;
		
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
			System.out.println("유저:"+userID);
		}else{
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "현재 로그인이 되어있지 않습니다");
			response.sendRedirect("index.jsp");
			return;
		}
		
		String talkers = request.getParameter("talkers");
	%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width= device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>SNS 채팅</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/script.js"></script>
	<script type="text/javascript">
		var talkers = '<%= talkers %>';	
		var userID = '<%= userID %>';
		
		$(document).ready(function(){
			makeRoomFunction3(talkers,userID);
		});
	</script>
	
</body>
</html>