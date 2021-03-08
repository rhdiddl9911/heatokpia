<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스</title>

<link rel="stylesheet" type="text/css" href="/css/board/board.css"/>
</head>

<body>
		<c:if test="${param.searchArea != null}">
			<c:set var="paramSearcharea" value="&searchArea=${param.searchArea}"/>
		</c:if>
		<c:if test="${param.search != null}">
			<c:set var="paramSearch" value="&search=${param.search}"/>
		</c:if>

<h2>뉴스</h2>
<div class="board wrap">
	<div class="board">
		<div class="board head">
			<span><strong>제목</strong></span>
			<span><strong>출처</strong></span>
		</div>
		
		<c:forEach var="newsData" items="${newsList}">
			<div onclick="location.href='news/${newsData.seq}'" class="board item">
				<span><c:out value="${newsData.title}"/></span>
				<span><c:out value="${newsData.authorship}"/>(<a href="<c:out value="${newsData.url}"/>">URL</a>)</span>
			</div>
		</c:forEach>
	</div>
	
	<div id="boardfooter">
	<div class="search">
		<form name="search" action="/news?page=1" method="get">
		<input type="hidden" name="page" value="${1}">
		<select name="searchArea">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="authorship">출처</option>
		</select>
		<input type="text" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit" value="검색">
		</form>
	</div>
	<div class="pagingnation">
		<c:set var="urlparams" value="${paramSearcharea}${paramSearch}"/>
		
		<fmt:formatNumber var="start" type="number" pattern="0" value="${Math.floor((param.page-1)/10) * 10 +1}" />
		<fmt:formatNumber var="end" type="number" pattern="0" value="${start+9 < maxPage ? start+9 : maxPage}" />
		
		<c:if test="${start-10>0}">
			<a href="/news?page=${start-10}${urlparams}"> 이전페이지 </a>
		</c:if>
		
		
		<c:forEach var="pageNum" begin="${start}" end="${end}">
			<a href="/news?page=${pageNum}${urlparams}"><c:out value="${pageNum}"/></a>
		</c:forEach>
		
		<c:if test="${end<maxPage}">
			<a href="/news?page=${end+1}${urlparams}"> 이전페이지 </a>
		</c:if>
		
	</div>
	</div>
	
</div>
<%@include file="../footer.jsp" %>
<script src="/js/check_all.js"></script>

</body>
</html>