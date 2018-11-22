<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%	
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		System.out.print(userID);
		/* if(userID == null){
			session.setAttribute("messageType", "오류 메시지");
			session.setAttribute("messageContent", "현재 로그인이 되어있지 않습니다");
			response.sendRedirect("index.jsp");
			return;
			
		} */
	
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
	
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>	
			</button>
			<a class="navbar-brand" href="index.jsp">SNS 채팅</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="makeChatRoom3.jsp?talkers=<%=userID %>">셀프채팅</a>
				<li><a href="viewChatRoom.jsp">메시지함</a>		
				</li>
				
			</ul>
			
		</div>
	</nav>
	<div class="container bootstrap snippet" style="width:600px;">
		<div class="row" style="width:440px;">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-white">채팅방 리스트</i></h4>
						</div>	
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 500px;" ></div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
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
							<span aria-hidden="true">&times</span>
							<span class="sr-only">Close</span>
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
		$('#messageModal').modal("show");
		
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
		if(userID == null){
	%>
	<script>
		alert("로그인이 되어 있지 않습니다");
		window.close();
	</script>
	<% 
		}
	%>
	<script type="text/javascript">
		var userID = '<%= userID %>';
		$(document).ready(function(){
			viewRoomFunction(userID);
		});
	</script>
</body>
</html>