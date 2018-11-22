<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String age = request.getParameter("age");
	int a = Integer.parseInt(age);
	String result;
	String[] test = {"a","b","c"};	//배열타입으로 테스트

	if(a>=20)
		result="성인";
		//out.print("성인입니다.");
	else
		result="미성년";
		//out.print("성인이 아닙니다.");
		
	request.setAttribute("result",result);	
	//setAttribute 두번째 자리는 자바 object타입이기에 모든 데이터타입을 다 보낼 수 있다.
	request.setAttribute("test",test);
	//배열타입으로 테스트
	RequestDispatcher dispatcher = request.getRequestDispatcher("test.jsp");
	dispatcher.forward(request,response);
	%>
</body>
</html>