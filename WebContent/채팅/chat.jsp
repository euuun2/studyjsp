<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%	
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
/* 			System.out.println("유저:"+userID);
 */			
		}
		
		String talkers = request.getParameter("talkers");
		System.out.print("chat:"+talkers);
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width= device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>SNS 채팅</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src = "js/script.js"></script>
	<script type="text/javascript">
		
		var talkers = '<%= talkers %>';
		var userID = '<%= userID %>';
		var lastTime = 0;
		
		function autoClosingAlert(selector, delay){
			var alert = $(selector).alert();
			alert.show();
			window.setTimeout(function(){ alert.hide()}, delay);
		}
		
		
	</script>
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
				<li class="dropdown">
				<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-jaspopup="true"
				aria-expanded="false" onclick="allFriendViewChat();">친구초대<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<table border="1px" border-collapse="collapse" id="allFriend" style="overflow-y" auto; width:auto; height:300px;">
					
							<tr><center>아이디</center></tr>
					
					</table>
				</ul>
				</li>
				<li><a href="viewChatRoom.jsp">메시지함</a>			
					
				</li>
			</ul>
	
		</div>
	</nav>
	<div class="container bootstrap snippet" style="width: 585px;">
		<div class="row" style="width:440px;">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-white">실시간 채팅창</i></h4>
						</div>	
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: 400px; height: 450px;"></div>
					</div>
					<div class="portlet-footer">

						<div class="row" style="height: 90px;">
							<div class="form-group col-xs-10">
								<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요" maxlength="100"
								onkeypress="if(event.keyCode==10){ submitFunction(); this.value=''; return false; } "></textarea>
							</div>
							<div class="form-group col-xs-2">
								<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="alert alert-success" id="successMessage" style="display: none;">  <!-- 아예 사라지게 함 -->
		<Strong>메시지 전송 성공했습니다</Strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage" style="display: none;">
		<Strong>이름과 내용을 모두 입력하세요</Strong>
	</div>
	<div class="alert alert-warning" id="warningMessage" style="display: none;">
		<Strong>데이터베이스 오류가 발생했습니다</Strong>
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
		
	
		$(document).ready(function(){
	//		 chatListFunction("ten");		// 최신 10개 가져오기, 화면 새로고침하면 다시 최신 10개 가져옴
			chatListFunction("all");
			getInfiniteChat();				// 이후 새 메시지 추가해줌 
		});
	</script>
</body>
</html>