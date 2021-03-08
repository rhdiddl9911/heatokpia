<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 문의 답변</title>

<link rel="stylesheet" type="text/css" href="/css/board/board.css"/>

</head>
<body>
	<h4>빠른 답변을 기다리는 문의</h4>
	<div class="board wrap">
		<div class="board head">
		<span style="width: 50%;">문의 제목</span>
		<span>문의 내용</span>
		<span>문의 일시</span>
	</div>
	<c:if test="${QListNoAnser == null || QListNoAnser.size() == 0}">
		<div class="board item">
			문의가 없습니다.
		</div>
	</c:if>
	<c:forEach var="qData" items="${QListNoAnser}">
		<div onclick="location.href='/admin/support/${qData.seq}'" class="board item">
			<span style="width: 50%;"><c:out value="${qData.title}"/></span>
			<span><c:out value="${qData.content}"/></span>
			<span><c:out value="${qData.createdate}"/></span>
		</div>
	</c:forEach>
	</div>
	
	<br><br>
	
	<h4>문의 목록</h4>
	<div class="board wrap">
		<div class="board head">
		<span style="width: 50%;">문의 제목</span>
		<span>내용미리보기</span>
		<span>답변</span>
		<span>email</span>
		</div>
	<c:forEach var="qData" items="${QList}">
		<div onclick="location.href='/admin/support/${qData.seq}'" class="board item">
			<span style="width: 50%;"><c:out value="${qData.title}"/></span>
			<span><c:out value="${qData.content}"/></span>
			<span><c:if test="${qData.anser == true}"><c:out value="완"/></c:if></span>
			<span><c:out value="${qData.qmember.email}"/></span>
		</div>
	</c:forEach>
	</div>
<%@include file="../../footer.jsp" %>

</body>
</html>