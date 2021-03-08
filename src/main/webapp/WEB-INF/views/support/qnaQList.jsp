<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 공지 목록</title>

<link rel="stylesheet" type="text/css" href="/css/board/board.css"/>

</head>
<body>

	<h4>진행중인 문의</h4>
	<div class="board wrap">
		<div class="board">
		<div class="board head">
			<span>문의 제목</span>
			<span>문의 일시</span>
		</div>
		<c:if test="${nonfinishQList == null || nonfinishQList.size() == 0}">
			<div class="board item">
				진행 사항이 없습니다.
			</div>
		</c:if>
		<c:forEach var="qData" items="${nonfinishQList}">
			<div class="board item">
				<span><c:out value="${qData.title}"/></span>
				<span><c:out value="${qData.createdate}"/></span>
			</div>
		</c:forEach>
		</div>
	</div>
	
	<br>
	<button onclick="location.href='/support/my/new'" class="primary" style="float: right;">질문 하러 가기</button>
	<br>
	
	<h4>종료된 문의</h4>
	<div class="board wrap">
		<div class="board">
		<div class="board head">
			<span>문의 제목</span>
			<span>문의 일시</span>
		</div>
	<c:forEach var="qData" items="${finishQList}">
		<div onclick="location.href='/support/my/${qData.seq}'" class="board item">
			<span><c:out value="${qData.title}"/></span>
			<span><c:out value="${qData.createdate}"/></span>
		</div>
	</c:forEach>
		</div>
	</div>
	
	
<%@include file="../footer.jsp" %>

</body>
</html>