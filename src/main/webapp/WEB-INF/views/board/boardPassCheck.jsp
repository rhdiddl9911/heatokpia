<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/board/${category}/${seq}/${method}" method="post">
		<input type="password" name="password" placeholder="비밀번호를 입력해주세요">
		<input type="submit">
	</form>
</body>
</html>