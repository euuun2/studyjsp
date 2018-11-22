<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<% 
		
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		
		session.setAttribute("newTalkers", null);

	%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width= device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="./custom.css">
	<title>SNS 채팅</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/script.js"></script>	
	<script type="text/javascript">
		
		function openWindow(location){  
		    window.open( location , "채팅방 목록", 
		    		"width=450, height=700, left=450, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );  
		}  
		
		
	</script>
</head>
<body>
	
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"		    
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">   											<!-- collapse는 내용 숨길때   -->
				<span class="icon-bar"></span>										<!--  aria-expanded 의미????????????? -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>	
			</button>
			<a class="navbar-brand" href="index.jsp">SNS 채팅</a>
		</div>
			<%
				if(userID == null){
			%>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a>
				<li><a href="find.jsp">친구찾기</a>
				<li><a href="viewChatRoom.jsp">메시지함</a>				
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span>		<!--  caret 은 화살표 -->
					</a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>			
					</ul>
				</li>
			</ul>
		</div>
			<%
				}else {
			%>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a>
				<li><a href="find.jsp">친구찾기</a>
				<li><a href="#" onClick="javascript:openWindow('viewChatRoom.jsp');">메시지함</a>	
				<li class="dropdown">
 				<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-jaspopup="true"
				aria-expanded="false" onclick="allFriendViewIndex('<%=userID %>');">친구초대<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<table border="1px" border-collapse= "collapse" id="allFriend" style="overflow-y" auto; width:auto; height:300px;">
					
							<tr><center>아이디</center></tr>
					
					</table>
				</ul>
				</li>			
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
						
					</ul>
				</li>
			</ul>
		</div>
			<%
				}
			%>
	</nav>
	
	<%
		String messageContent = null;
		if(session.getAttribute("messageContent") != null){
			messageContent = (String)session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") != null){
			messageType = (String)session.getAttribute("messageType");
		}
		if(messageContent != null){
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times</span>					<!-- $times 는 x를 나타냄 -->
							<span class="sr-only">Close</span>					<!--  확실히 모르겠음?????????????? -->
						</button>
						<h4 class="modal-title">
							<%= messageType %>
						</h4>
					</div>
					<div class="modal-body">
						<%= messageContent %>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");			/* 모달: 새 모달 창이 열렸을 때 기존 창을 사용 못하는 것, ex)에러메시지 창 */
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
</body>
</html>