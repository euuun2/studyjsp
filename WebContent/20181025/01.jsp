<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#result{
			width : 200px;
			height : 200px;
			border : 5px double #6699FF;
		}
	</style>
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script>
	$(document).ready(function(){
		$("#b1").click(function(){
			var query = {userid:$("#userid").val(),
					password:$("#password").val()};
			
			$.ajax({
				type:"POST",
				url:"/studyjsp/MemberServlet",
				data:query,
				success:function(data){
					if(data==1)
						$("#result").text("로그인 성공");
					else if(data==0){
						$("#result").text("비번틀림");
					}else if(data==-1){
						$("#result").text("비회원");
					}
				}
			});
		});
	});
		
	</script>
</head>
<body>
		아이디<input type="text" name="userid" id="userid">
		비밀번호<input type="password" name="password" id="userid">
		<button id="b1">결과</button>
		<div id="result"></div>

</body>
</html>