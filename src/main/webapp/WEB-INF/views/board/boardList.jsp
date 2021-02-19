<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="board wrap">

	<table class="board">
		<tr>
			<th>제목</th>
			<th>이름</th>
			<th>생성날짜</th>
		</tr>
		
		<c:forEach var="boardData" items="${boardList}">
		<tr>
			<td><c:out value="${boardData.title}"></c:out></td>
			<td><c:out value="${boardData.name}"></c:out></td>
			<td><c:out value="${boardData.createdate}"></c:out></td>
		</tr>
		</c:forEach>
	</table>
	
	<br>
	<button onclick="location.href='/board/${category}/new'">글쓰기</button>
</div>



</body>
</html>