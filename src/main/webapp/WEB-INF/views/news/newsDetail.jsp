<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 상세</title>

<link rel="stylesheet" type="text/css" href="/css/board/board_detail.css"/>

</head>
<body>
	<div id="detailwrap"></div>
	<h1><c:out value="${newsData.title}"/></h1>
	
	<div id="writeinfo">
		<span class="name"><c:out value="${newsData.member.name}"/></span>
		<span class="authorship">
			<span><c:out value="${newsData.authorship}"/></span>
			<a href="<c:out value="${newsData.url}"/>"><c:out value="${newsData.url}"/></a>
		</span>
	</div>
	
	<div class="content">
		<c:out value="${newsData.content}"/>
	</div>
	
	<%@include file="../footer.jsp" %>
	
</body>
</html>