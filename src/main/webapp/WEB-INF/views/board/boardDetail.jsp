<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><c:out value="${boardData.title}"/></h1>
	<div>
		<span class="name"><c:out value="${boardData.name}"/></span>
		<span class="lastdate">
		<c:if test="${(boardData.updatedate == null)}">
			<c:out value="${boardData.createdate}"/>
		</c:if>
		<c:if test="${!(boardData.updatedate == null)}">
			<c:out value="${boardData.updatedate}"/>
		</c:if>
		</span>
	</div>
	<div class="content">
		<c:out value="${boardData.content}"/>
	</div>
</body>
</html>