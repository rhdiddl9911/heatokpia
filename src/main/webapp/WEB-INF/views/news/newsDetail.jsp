<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 상세</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board_detail.css"/>

</head>
<body>
	<div style="border-top: solid 3px #2C3E50;"></div>
	<h2><c:out value="${newsData.title}"/></h2>
	<div id="detailwrap">
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
	</div>
	<%@include file="../footer.jsp" %>
	
</body>
</html>