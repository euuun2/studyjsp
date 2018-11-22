<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>설문조사</h2>
	
	<form method="post" action="researchget.jsp">
		<dl>
			<dd>
				<label for="name">이름</label>
				<input id="name" name="name" type="text" placeholder="김개동" autofocus required>
			</dd>
			<dd>
				<fieldset>
					<legend>성별</legend>
					<input id="gender" name="gender" type="radio" value="m">
					<label for="gender">남자</label>
					<input id="gender" name="gender" type="radio" value="f">
					<label for="gender">여자</label>
				</fieldset>
			</dd>
			<dd>
				<fieldset>
					<legend>좋아하는 계절</legend>
					<input id="season" name="season" type="checkbox" value="spring">
					<label for="season">봄</label>
					<input id="season" name="season" type="checkbox" value="summer">
					<label for="season">여름</label>
					<input id="season" name="season" type="checkbox" value="fall">
					<label for="season">가을</label>
					<input id="season" name="season" type="checkbox" value="winter">
					<label for="season">겨울</label>
				</fieldset>
			</dd>
			<dd>
				<input type="submit" value="전송">
			</dd>
		</dl>
	</form>
</body>
</html>