<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>

<link rel="stylesheet" type="text/css" href="/css/board/board.css"/>

</head>
<body>
		<c:if test="${param.category != null}">
			<c:set var="paramCategory" value="&category=${param.category}"/>
		</c:if>
		<c:if test="${param.searchArea != null}">
			<c:set var="paramSearcharea" value="&searchArea=${param.searchArea}"/>
		</c:if>
		<c:if test="${param.search != null}">
			<c:set var="paramSearch" value="&search=${param.search}"/>
		</c:if>
<div>
<sec:authorize access="hasRole('ADMIN')">
<button onclick="location.href='admin/notice/write'">작성</button>
</sec:authorize>
</div>

	<div id="categorySelect">
	<a href="javascript:location.replace('/notice?page=1')" class='<c:if test="${param.category==null}">select</c:if>'>전체</a>
	<a href="javascript:location.replace('/notice?page=1&category=공지사항')" class="<c:if test="${param.category=='공지사항'}">select</c:if>">공지사항</a>
	<a href="javascript:location.replace('/notice?page=1&category=이벤트')" class="<c:if test="${param.category=='이벤트'}">select</c:if>">이벤트</a>
	</div>
	
<div class="board wrap">
	<div class="board">
		<div class="board head">
			<span>카테고리</span>
			<span>제목</span>
			<span>생성날짜</span>
		</div>
		
		<c:forEach var="noticeData" items="${noticeList}">
		<div onclick="location.href='/notice/${noticeData.seq}'" class="board item">
			<span><c:out value="${noticeData.category == 0? '공지사항' : '이벤트'}"/></span>
			<span><c:out value="${noticeData.title}"></c:out></span>
			<span><c:out value="${noticeData.createdate}"></c:out></span>
		</div>
		</c:forEach>
</div>

	<div id="boardfooter">
	<div class="search">
		<form name="search" action="/notice?page=1${paramCategory}" method="get">
		<input type="hidden" name="page" value="${1}">
		<select name="searchArea">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="search" placeholder="검색어를 입력해주세요">
		<input type="submit" value="검색">
		</form>
	</div>
	<div class="pagingnation">
		<c:set var="urlparams" value="${paramCategory}${paramSearcharea}${paramSearch}"/>
		
		<fmt:formatNumber var="start" type="number" pattern="0" value="${Math.floor((param.page-1)/10) * 10 +1}" />
		<fmt:formatNumber var="end" type="number" pattern="0" value="${start+9 < maxPage ? start+9 : maxPage}" />
		
		<c:if test="${start-10>0}">
			<a href="/notice?page=${start-10}${urlparams}"> 이전페이지 </a>
		</c:if>
		
		
		<c:forEach var="pageNum" begin="${start}" end="${end}">
			<a href="/notice?page=${pageNum}${urlparams}"><c:out value="${pageNum}"/></a>
		</c:forEach>
		
		<c:if test="${end<maxPage}">
			<a href="/notice?page=${end+1}${urlparams}"> 이전페이지 </a>
		</c:if>
		
		<c:forEach var="boardData" items="${boardList}">
		</c:forEach>
	</div>
	</div>
	
</div>



</body>
</html>