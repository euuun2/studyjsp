<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div#displayArea{
		width : 200px;
		height : 200px;
		border : 5px double #6699FF;
	}
</style>
<script src="../js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("button").click(function(){
			$("#displayArea").html("<img src='1.png' border='0'/>");
		});
	});
</script>
</head>
<body>
	<div id="displayArea">이곳의 내용이 변경</div>
	<button>표시</button>
</body>
</html>