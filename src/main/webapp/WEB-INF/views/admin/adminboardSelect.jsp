<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="./admin_header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 게시판 선택</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board.css"/>

</head>
<body>
<h2>게시물 관리</h2>

<h4 class="link" onclick="location.href='/admin/board/free'">자유게시판</h4>
<div class="board wrap">
	<div class="board">
		<div class="board head">
			<span><strong>제목</strong></span>
			<span><strong>이름</strong></span>
			<span><strong>생성날짜</strong></span>
		</div>
		
		<c:forEach var="boardData" items="${freeBoardList}" end="4">
		<div onclick="location.href='/admin/board/free/${boardData.seq}'" class="board item">
			<span><c:out value="${boardData.title}"/></span>
			<span><c:out value="${boardData.name}"/></span>
			<span><c:out value="${boardData.createdate}"/></span>
		</div>
		</c:forEach>
		
		</div>
</div>

<h4 class="link" onclick="location.href='/admin/board/info'">정보게시판</h4>
<div class="board wrap">
	<div class="board">
		<div class="board head">
			<span><strong>제목</strong></span>
			<span><strong>이름</strong></span>
			<span><strong>생성날짜</strong></span>
		</div>
		
		<c:forEach var="boardData" items="${infoBoardList}" end="4">
		<div onclick="location.href='/admin/board/info/${boardData.seq}'" class="board item">
			<span><c:out value="${boardData.title}"/></span>
			<span><c:out value="${boardData.name}"/></span>
			<span><c:out value="${boardData.createdate}"/></span>
		</div>
		</c:forEach>
		
		</div>
</div>

<h4 class="link" onclick="location.href='/admin/news'">뉴스</h4>
<div class="board wrap">
	<div class="board">
		<div class="board head">
			<span><strong>제목</strong></span>
			<span><strong>출처</strong></span>
		</div>
		
		<c:forEach var="boardData" items="${newsBoardList}" end="4">
		<div onclick="location.href='/admin/news/${boardData.seq}'" class="board item">
			<span><c:out value="${boardData.title}"/></span>
			<span><c:out value="${boardData.authorship}"/>(<a href="<c:out value="${boardData.url}"/>">URL</a>)</span>
		</div>
		</c:forEach>
		
		</div>
</div>

<h4 class="link" onclick="location.href='/admin/notice'">공지사항</h4>
<div class="board wrap">
	<div class="board">
		<div class="board head">
			<span><strong>제목</strong></span>
			<span><strong>카테고리</strong></span>
		</div>
		
		<c:forEach var="boardData" items="${noticeBoardList}" end="4">
		<div onclick="location.href='/admin/notice/${boardData.seq}'" class="board item">
			<span><c:out value="${boardData.title}"/></span>
			<span><c:out value="${boardData.category == 0? '공지사항' : '이벤트'}"/></span>
		</div>
		</c:forEach>
		
		</div>
</div>

<h4 class="link" onclick="location.href='/admin/workzone'">베스트게시판</h4>
<h4 class="link" onclick="location.href='/admin/workzone'">댓글</h4>
<h4 class="link" onclick="location.href='/admin/workzone'">주가코멘트</h4>

</body>
</html>