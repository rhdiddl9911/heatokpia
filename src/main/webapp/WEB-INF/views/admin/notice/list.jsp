<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<button onclick="location.href='/admin/notice/write'">글쓰기</button>
</div>

<div class="board wrap">
	<table class="board">
		<tr>
			<th>제목</th>
			<th>생성날짜</th>
		</tr>
		
		<c:forEach var="noticeData" items="${noticeList}">
		<tr onclick="location.href='#'">
			<td><c:out value="${noticeData.title}"></c:out></td>
			<td><c:out value="${noticeData.createdate}"></c:out></td>
		</tr>
		</c:forEach>
	</table>
	
</div>
</body>
</html>