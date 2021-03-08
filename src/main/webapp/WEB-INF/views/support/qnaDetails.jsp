<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<div>내 문의</div>

<div>
	<div>${question.title}</div>
	<div>${question.content}</div>
	<div><span><label>답변자:</label>${anser.amember.name}</span></div>
	<div>${anser.content}</div>
</div>

<%@include file="../footer.jsp" %>


</body>
</html>