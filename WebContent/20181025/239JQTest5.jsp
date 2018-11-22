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
			//[결과]버튼을 클릭하면 xhrTest3.txt가 <div id="result"> 엘리먼트에 로드
			$("#b1").click(function(){
				$("#result").load("xhrTest3.txt",function(response,stu,xhr){
					if(stu=="success")
						alert("로드성공!");
					if(stu=="error")
						alert("에러:"+xhr.status+":"+xhr.stu);
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