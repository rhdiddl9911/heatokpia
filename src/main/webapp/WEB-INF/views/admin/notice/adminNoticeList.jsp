<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<select onchange="javascript:location.replace(value)" id="category">
	<option value="/admin/notice?page=1" <c:if test="${param.category == null}"><c:out value="selected"/></c:if>>전체</option>
	<option value="/admin/notice?page=1&category=공지사항" <c:if test="${param.category == '공지사항'}"><c:out value="selected"/></c:if>>공지사항</option>
	<option value="/admin/notice?page=1&category=이벤트" <c:if test="${param.category == '이벤트'}"><c:out value="selected"/></c:if>>이벤트</option>
</select>

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
	
	<div>
	<span>
		<form name="search" action="/admin/notice?page=1${paramCategory}" method="get">
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
		
		<c:forEach var="boardData" items="${boardList}">
		</c:forEach>
	</span>
	</div>
	
</div>
<%@include file="../../footer.jsp" %>
<script src="/js/check_all.js"></script>
</body>
</html>