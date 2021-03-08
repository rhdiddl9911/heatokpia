<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 상세</title>

<link rel="stylesheet" type="text/css" href="/css/board/board_detail.css"/>

</head>
<body>
	
<div>내 문의</div>

<div id="detailwrap">
	<h2>${question.title}</h2>
	<div id="writeinfo">
		<span class="name">${question.qmember.name}</span>
		<span class="lastdate">${question.createdate}</span>
	</div>
	<div class="content">${question.content}</div>
	<div id="writeinfo">
		<span class="name"><label>답변자:</label>${anser.amember.name}</span>
		<span class="lastdate">${anser.createdate}</span>
	</div>
	<div class="content">${anser.content}</div>
</div>

<%@include file="../footer.jsp" %>


</body>
</html>