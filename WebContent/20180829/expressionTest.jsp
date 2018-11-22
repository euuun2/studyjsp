<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>표현식 예제 - 배열원소 출력</h2>
	<%
		String[] str = {"JSP","JAVA","Android","HTML5"};
	%>
	<%
		for(int i =0; i<str.length; i++){
			out.print(i + " : ");
			out.print(str[i]+"<br>");
		}
	%>
	<h2>표현식 예제 - 기본데이터타입 및 레퍼런스타입출력</h2>
	<%
		int x =10;
		int y = (x>10) ? 20:x;
		out.println("y변수의 내용 : " + y + "<br>");
		
		StringBuffer sf = new StringBuffer("Unicron");
		sf.reverse();
		out.println("객체의 내용 : " + sf.toString());
	%>
</body>
</html>