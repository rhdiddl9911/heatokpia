<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

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
	<span>
		<form name="search" action="/board/${category}" method="get">
		<input type="hidden" name="page" value="${1}">
		<select name="searchArea">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="name">이름</option>
		</select>
		<input type="text" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit" value="검색">
		</form>
	</span>
	<span>
		<fmf:formatNumber var="start" type="number" pattern="0" value="${Math.floor((param.page-1)/10) * 10 +1}" />
		<fmf:formatNumber var="end" type="number" pattern="0" value="${start+9 < maxPage ? start+9 : maxPage}" />
		
		<c:if test="${start-10>0}">
			<c:if test="${param.search == null}">
				<a href="/board/${category}?page=${start-10}"> 이전페이지 </a>
			</c:if>
			<c:if test="${!(param.search == null)}">
				<a href="/board/${category}?page=${start-10}&searchArea=${param.searchArea}&search=${param.search}"> 이전페이지 </a>
			</c:if>
		</c:if>
		
		<c:forEach var="pageNum" begin="${start}" end="${end}">
			<c:if test="${param.search == null}">
				<a href="/board/${category}?page=${pageNum}"><c:out value="${pageNum}"/></a>
			</c:if>
			<c:if test="${!(param.search == null)}">
				<a href="/board/${category}?page=${pageNum}&searchArea=${param.searchArea}&search=${param.search}"><c:out value="${pageNum}"/></a>
			</c:if>
		</c:forEach>
		
		<c:if test="${end<maxPage}">
			<c:if test="${param.search == null}">
				<a href="/board/${category}?page=${end+1}"> 이후페이지 </a>
			</c:if>
			<c:if test="${!(param.search == null)}">
				<a href="/board/${category}?page=${end+1}&searchArea=${param.searchArea}&search=${param.search}"> 이전페이지 </a>
			</c:if>
			
		</c:if>
		
		<c:forEach var="boardData" items="${boardList}">
		</c:forEach>
	</span>
	</div>
	
</div>



</body>
</html>