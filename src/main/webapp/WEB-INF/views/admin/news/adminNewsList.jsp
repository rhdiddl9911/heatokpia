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
		<c:if test="${param.searchArea != null}">
			<c:set var="paramSearcharea" value="&searchArea=${param.searchArea}"/>
		</c:if>
		<c:if test="${param.search != null}">
			<c:set var="paramSearch" value="&search=${param.search}"/>
		</c:if>

<div class="board wrap">
	<div class="board">
		<span><input type="checkbox" id="chk_all"></span>
		<div id="">
			<span>제목</span>
			<span>출처</span>
		</div>
		
		<c:forEach var="newsData" items="${newsList}">
			<div>
				<span><input type="checkbox" name="chk"></span>
				<div id="listitem" onclick="location.href='/admin/news/${newsData.seq}'">
					<span><c:out value="${newsData.title}"/></span>
					<span><c:out value="${newsData.authorship}"/>(<a href="<c:out value="${newsData.url}"/>">URL</a>)</span>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div>
	<span>
		<form name="search" action="/admin/news?page=1${paramCategory}" method="get">
		<input type="hidden" name="page" value="${1}">
		<select name="searchArea">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit" value="검색">
		</form>
	</span>
	<span>
		<c:set var="urlparams" value="${paramCategory}${paramSearcharea}${paramSearch}"/>
		
		<fmt:formatNumber var="start" type="number" pattern="0" value="${Math.floor((param.page-1)/10) * 10 +1}" />
		<fmt:formatNumber var="end" type="number" pattern="0" value="${start+9 < maxPage ? start+9 : maxPage}" />
		
		<c:if test="${start-10>0}">
			<a href="/admin/notice?page=${start-10}${urlparams}"> 이전페이지 </a>
		</c:if>
		
		
		<c:forEach var="pageNum" begin="${start}" end="${end}">
			<a href="/admin/notice?page=${pageNum}${urlparams}"><c:out value="${pageNum}"/></a>
		</c:forEach>
		
		<c:if test="${end<maxPage}">
			<a href="/admin/notice?page=${end+1}${urlparams}"> 이전페이지 </a>
		</c:if>
		
	</span>
	</div>
	
	
	<button onclick="location.href='/admin/news/new'">작성</button>
	
</div>
<%@include file="../../footer.jsp" %>
<script src="/js/check_all.js"></script>

</body>
</html>