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
	<div>
		<c:out value="${newsData.title}"/>
	</div>
	<div>
		<c:out value="${newsData.member.name}"/>
	</div>
	<div>
		<c:out value="${newsData.content}"/>
	</div>
	<div>
		<span><c:out value="${newsData.authorship}"/> ::: </span>
		<span><a href="<c:out value="${newsData.url}"/>"><c:out value="${newsData.url}"/></a></span>
	</div>
	
	<%@include file="../footer.jsp" %>
	
</body>
</html>