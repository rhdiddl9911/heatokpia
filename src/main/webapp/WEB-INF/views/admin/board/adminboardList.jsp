<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../admin_header_menu.jsp" %>

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
			<th><input type="checkbox" id="chk_all"></th>
			<th>제목</th>
			<th>내용</th>
			<th>이름</th>
			<th>생성날짜</th>
		</tr>
		
		<c:forEach var="boardData" items="${boardList}">
		<tr onclick="location.href='/admin/board/${category}/${boardData.seq}'">
			<td><input type="checkbox" name="chk"></td>
			<td><c:out value="${boardData.title}"></c:out></td>
			<td><c:out value="${boardData.content}"></c:out></td>
			<td><c:out value="${boardData.name}"></c:out></td>
			<td><c:out value="${boardData.createdate}"></c:out></td>
		</tr>
		</c:forEach>
	</table>
	<div>
	<span>
		<form name="search" action="/admin/board/${category}" method="get">
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
		<fmt:formatNumber var="start" type="number" pattern="0" value="${Math.floor((param.page-1)/10) * 10 +1}" />
		<fmt:formatNumber var="end" type="number" pattern="0" value="${start+9 < maxPage ? start+9 : maxPage}" />
		
		<c:if test="${param.searchArea != null}">
			<c:set var="paramSearcharea" value="&searchArea=${param.searchArea}"/>
		</c:if>
		<c:if test="${param.search != null}">
			<c:set var="paramSearch" value="&search=${param.search}"/>
		</c:if>
		
		<c:set var="urlparams" value="${paramSearcharea}${paramSearch}"/>
		
		
		<c:if test="${start-10>0}">
			<a href="/admin/board/${category}?page=${start-10}${urlparams}"> 이전페이지 </a>
		</c:if>
		
		<c:forEach var="pageNum" begin="${start}" end="${end}">
			<a href="/admin/board/${category}?page=${pageNum}${urlparams}"><c:out value="${pageNum}"/></a>
		</c:forEach>
		
		<c:if test="${end<maxPage}">
			<a href="/admin/board/${category}?page=${end+1}${urlparams}"> 이후페이지 </a>
		</c:if>
		
	</span>
	</div>
	
</div>

<%@include file="../../footer.jsp" %>
<script src="/js/check_all.js"></script>
</body>
</html>