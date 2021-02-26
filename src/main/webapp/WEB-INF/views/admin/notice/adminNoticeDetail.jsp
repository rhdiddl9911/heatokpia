<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<c:out value="${noticeData.title}"/>
	</div>
	<div>
		<c:out value="${noticeData.member.name}"/>
	</div>
	<div>
		<c:out value="${noticeData.content}"/>
	</div>
	
	<input type="button" value="수정">
	<input type="button" value="삭제">
	
	<%@include file="../../footer.jsp" %>
	
</body>
</html>