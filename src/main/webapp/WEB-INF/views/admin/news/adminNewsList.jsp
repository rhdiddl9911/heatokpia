<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 뉴스</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board.css"/>

</head>
<body>
		<c:if test="${param.searchArea != null}">
			<c:set var="paramSearcharea" value="&searchArea=${param.searchArea}"/>
		</c:if>
		<c:if test="${param.search != null}">
			<c:set var="paramSearch" value="&search=${param.search}"/>
		</c:if>
<div id="boardinfo">
	<label>뉴스</label>
	<button onclick="location.href='/admin/news/new'" class="primary">작성</button>
</div>
<div class="board wrap">
	<div class="board">
		<div class="board head">
		<span style="width: 3%;"><input type="checkbox" id="chk_all"></span>
		<span style="text-align: left;width:70%;">제목</span>
		<span style="width:20%;">출처</span>
	</div>
		<c:forEach var="newsData" items="${newsList}">
			<div class="board item">
				<span style="width: 3%;"><input type="checkbox" name="chk"></span>
				<div style="display: inline-block;width: 95%;" onclick="location.href='/admin/news/${newsData.seq}'">
					<span style="width:70%;"><c:out value="${newsData.title}"/></span>
					<span style="width:20%;"><c:out value="${newsData.authorship}"/>(<a href="<c:out value="${newsData.url}"/>">URL</a>)</span>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div id="boardfooter">
	<div class="search">
		<form name="search" action="/admin/news?page=1" method="get">
		<input type="hidden" name="page" value="${1}">
		<select name="searchArea">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="authorship">출처</option>
		</select>
		<input type="text" name="search" placeholder="검색어를 입력해주세요" value="${param.search}">
		<input type="submit" value="검색">
		</form>
	</div>
	<div class="pagingnation">
		<c:set var="urlparams" value="${paramSearcharea}${paramSearch}"/>
		
		<fmt:formatNumber var="start" type="number" pattern="0" value="${Math.floor((param.page-1)/10) * 10 +1}" />
		<fmt:formatNumber var="end" type="number" pattern="0" value="${start+9 < maxPage ? start+9 : maxPage}" />
		
		<div class="prenav">
		<c:if test="${start-10>0}">
			<a href="/admin/news?page=${start-10}${urlparams}"> 이전페이지 </a>
		</c:if>
		</div>
		
		<c:forEach var="pageNum" begin="${start}" end="${end}">
			<div class="page <c:if test='${pageNum==param.page}'>on</c:if>">
			<a href="/admin/news?page=${pageNum}${urlparams}"><c:out value="${pageNum}"/></a>
			</div>
		</c:forEach>
		
		<div class="postnav">
		<c:if test="${end<maxPage}">
			<a href="/admin/news?page=${end+1}${urlparams}"> 이전페이지 </a>
		</c:if>
		</div>
	</div>
	</div>
	
	
</div>
<%@include file="../../footer.jsp" %>
<script src="/js/check_all.js"></script>

</body>
</html>