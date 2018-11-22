<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<% request.setCharacterEncoding("utf-8"); %>

<title>Insert title here</title>
</head>
<body>
	<h2>request 예제 - 요청 메소드</h2>
	<%
		//request객체에서 파라메터값을 얻어냄
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] season = request.getParameterValues("season");
		
		//성별값 처리
		if(gender.equals("m"))
			gender="남자";
		else
			gender="여자";
	%>
		
	<%-- DB연동을 위한 작업 --%>
	<%-- 화면 출력 --%>
	<%=name %>님의 정보는 다음과 같습니다.<br>
	성별 : <%=gender %><br>
	계절 : <%
		if(season == null)
			out.print("선택한 계절이 없습니다.");
		else{
			for(int i=0; i<season.length; i++){
				if(season[i].equals("spring"))
					out.print("봄 ");
				if(season[i].equals("summer"))
					out.print("여름 ");
				if(season[i].equals("fall"))
					out.print("가을 ");
				if(season[i].equals("winter"))
					out.print("겨울 ");
			}
		}
		%><br>
</body>
</html>