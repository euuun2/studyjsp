<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="277registerPro.jsp">
		<table>
			<tr>
				<td class="label"><label for="id">아이디</label>
				<td class="content"><input id="id" name="id" type="text" size="20" maxlength="30">
			<tr>
				<td class="label"><label for="passwd">비밀번호</label>
				<td class="content"><input id="passwd" name="passwd" type="password" size="20" maxlength="12">
			<tr>
				<td class="label"><label for="name">이름</label>
				<td class="content"><input id="name" name="name" type="text" size="20" maxlength="10">
			<tr>
				<td class="label2" colspan="2"><input type="submit" value="회원가입">
					<input type="reset" value="다시작성">
		</table>
	</form>
</body>
</html>