<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세</title>

<link rel="stylesheet" type="text/css" href="/css/board/board_detail.css"/>

</head>
<body>

	<div id="detailwrap">
	<h1><c:out value="${noticeData.title}"/></h1>
	<div id="writeinfo">
	<span class="name"><c:out value="${noticeData.member.name}"/></span>
		<span class="lastdate">
		<c:if test="${(noticeData.updatedate == null)}">
			<c:out value="${noticeData.createdate}"/>
		</c:if>
		<c:if test="${!(noticeData.updatedate == null)}">
			<c:out value="${noticeData.updatedate}"/>
		</c:if>
		</span>
	</div>
	<div class="content">
		<c:out value="${noticeData.content}"/>
	</div>
	</div>
	
	<%@include file="../footer.jsp" %>
	
</body>
</html>