<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="345updatePro.jsp">
		<table>
			<tr>
				<td class="label"><label for="id">아이디</label></td>
				<td class="content"><input id="id" name="id" type="text" size="20"></td>
			</tr>
			<tr>
				<td class="label"><label for="passwd">비밀번호</label></td>
				<td class="content"><input id="passwd" name="passwd" type="password" size="20"></td>
			</tr>
			<tr>
				<td class="label"><label for="name">이름</label></td>
				<td class="content"><input id="name" name="name" type="text" size="20"></td>
			</tr>
			<tr>
			<td class="label2" colspan="2"><input type="submit" value="수정완료">
				<input type="reset" value="다시 작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>