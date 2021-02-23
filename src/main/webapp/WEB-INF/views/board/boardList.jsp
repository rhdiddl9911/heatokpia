<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
<button onclick="location.href='/board/${category}/new'">글쓰기</button>
</div>

<div class="board wrap">
	<table class="board">
		<tr>
			<th>제목</th>
			<th>이름</th>
			<th>생성날짜</th>
		</tr>
		
		<c:forEach var="boardData" items="${boardList}">
		<tr onclick="location.href='/board/${category}/${boardData.seq}'">
			<td><c:out value="${boardData.title}"></c:out></td>
			<td><c:out value="${boardData.name}"></c:out></td>
			<td><c:out value="${boardData.createdate}"></c:out></td>
		</tr>
		</c:forEach>
	</table>
	<div>
		<fmf:formatNumber var="start" type="number" pattern="0" value="${Math.floor((param.page-1)/10) * 10 +1}" />
		<fmf:formatNumber var="end" type="number" pattern="0" value="${start+9 < maxPage ? start+9 : maxPage}" />
		
		<c:if test="${start-10>0}">
			<a href="/board/${category}?page=${start-10}"> 이전페이지 </a>
		</c:if>
		
		<c:forEach var="pageNum" begin="${start}" end="${end}">
			<a href="/board/${category}?page=${pageNum}"><c:out value="${pageNum}"/></a>
		</c:forEach>
		
		<c:if test="${end<maxPage}">
			<a href="/board/${category}?page=${end+1}"> 이후페이지 </a>
		</c:if>
		
		<c:forEach var="boardData" items="${boardList}">
		</c:forEach>
	</div>
</div>



</body>
</html>