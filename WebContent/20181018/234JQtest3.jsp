<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("p").mouseenter(function(){
			$(this).text("왔냐??");
		});
		
		$("p").mouseleave(function(){
			$(this).text("돌아와라 =.=")
		});
		
		$("button").dblclick(function(){
			$(this).css("background-color","#c84646");
		});
	});
</script>
</head>
<body>
	<p>마우스 포인터 여기 놔라</p>
	<button>클릭해라</button>
</body>
</html>