<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> JSP 테스트 페이지 입니다 ~~~ </h1>

	<sec:authorize access="isAnonymous()">
	<a href="/login">로그인</a>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
	<a href="/logout">로그아웃</a>
	</sec:authorize>
	
	<a href="/admin/adminIndex"> 어드민 접근해보기 </a>
	
</body>
</html>