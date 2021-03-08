<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유/정보게시판</title>

<link rel="stylesheet" type="text/css" href="/css/admin/board.css"/>

</head>
<body>

<div class="board wrap">
		<c:forEach var="boardData" items="${boardList}">
			<div class="board line">
				<div class="board head">
				<span><input type="checkbox" name="chk"></span>
				<span><label>이름:</label><c:out value="${boardData.name}"/></span>
				<span><label>생성날짜:</label><c:out value="${boardData.createdate}"/></span>
				</div>
			<div onclick="location.href='/admin/board/${category}/${boardData.seq}'" class="board item">
				<div><label>제목:</label><c:out value="${boardData.title}"/></div>
				<div><label>내용:</label><c:out value="${boardData.content}"/></div>
			</div>
		</div>
		</c:forEach>

</div>

	<div id="boardfooter">
	<div class="search">
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
	</div>
	<div class="pagingnation">
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
	</div>
	</div>
	

<%@include file="../../footer.jsp" %>
<script src="/js/check_all.js"></script>
</body>
</html>