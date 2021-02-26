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
<div>
<button onclick="location.href='/admin/notice/write'">작성</button>
</div>

<div class="board wrap">
	<table class="board">
		<tr>
			<th><input type="checkbox" id="chk_all"></th>
			<th>카테고리</th>
			<th>제목</th>
			<th>생성날짜</th>
		</tr>
		
		<c:forEach var="noticeData" items="${noticeList}">
		<tr onclick="location.href='#'">
			<td><input type="checkbox" name="chk"></td>
			<td><c:out value="${noticeData.category == 0? '공지사항' : '이벤트'}"/></td>
			<td><c:out value="${noticeData.title}"></c:out></td>
			<td><c:out value="${noticeData.createdate}"></c:out></td>
		</tr>
		</c:forEach>
	</table>
	
</div>
<%@include file="../../footer.jsp" %>
<script src="/js/check_all.js"></script>
</body>
</html>