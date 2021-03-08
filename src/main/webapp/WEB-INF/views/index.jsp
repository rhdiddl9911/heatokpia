<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>

<link rel="stylesheet" type="text/css" href="/css/board/board.css"/>

</head>
<body>

<h4>공지사항</h4>
<div class="board wrap">
	<div class="board">
		<div class="board head">
			<span><strong>제목</strong></span>
			<span><strong>카테고리</strong></span>
		</div>
		
		<c:forEach var="boardData" items="${noticeBoardList}" end="4">
		<div onclick="location.href='/notice/${boardData.seq}'" class="board item">
			<span><c:out value="${boardData.title}"/></span>
			<span><c:out value="${boardData.category == 0? '공지사항' : '이벤트'}"/></span>
		</div>
		</c:forEach>
		
		</div>
</div>

<h4>자유게시판</h4>
<div class="board wrap">
	<div class="board">
		<div class="board head">
			<span><strong>제목</strong></span>
			<span><strong>이름</strong></span>
			<span><strong>생성날짜</strong></span>
		</div>
		
		<c:forEach var="boardData" items="${freeBoardList}" end="4">
		<div onclick="location.href='/board/free/${boardData.seq}'" class="board item">
			<span><c:out value="${boardData.title}"/></span>
			<span><c:out value="${boardData.name}"/></span>
			<span><c:out value="${boardData.createdate}"/></span>
		</div>
		</c:forEach>
		
		</div>
</div>

<h4>정보게시판</h4>
<div class="board wrap">
	<div class="board">
		<div class="board head">
			<span><strong>제목</strong></span>
			<span><strong>이름</strong></span>
			<span><strong>생성날짜</strong></span>
		</div>
		
		<c:forEach var="boardData" items="${infoBoardList}" end="4">
		<div onclick="location.href='/board/info/${boardData.seq}'" class="board item">
			<span><c:out value="${boardData.title}"/></span>
			<span><c:out value="${boardData.name}"/></span>
			<span><c:out value="${boardData.createdate}"/></span>
		</div>
		</c:forEach>
		
		</div>
</div>

<h4>뉴스</h4>
<div class="board wrap">
	<div class="board">
		<div class="board head">
			<span><strong>제목</strong></span>
			<span><strong>출처</strong></span>
		</div>
		
		<c:forEach var="boardData" items="${newsBoardList}" end="4">
		<div onclick="location.href='/news/${boardData.seq}'" class="board item">
			<span><c:out value="${boardData.title}"/></span>
			<span><c:out value="${boardData.authorship}"/>(<a href="<c:out value="${boardData.url}"/>">URL</a>)</span>
		</div>
		</c:forEach>
		
		</div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>