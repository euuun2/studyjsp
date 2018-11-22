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
				$.post("process.jsp",{name:"goeun",stus:"homebody"},
				function(data,status){
					if(status="success")
						$("#result").html(data);
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