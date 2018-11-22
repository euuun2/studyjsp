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
				//요청 페이지에 전송할 데이터
				var query={name:"goeun",
						stus:"homebody"};
				//process.jsp페이지에 요청 데이터를 보낸 후 결과를 반환받음
				$.ajax({
					type:"POST",
					url:"process.jsp",
					data:query,
					success:function(data){
						$("#result").html(data);
					}
				});
			});
		});
	</script>
</head>
<body>
	<button id="b1">결과</button>
	<div id="result"></div>
</body>
</html>