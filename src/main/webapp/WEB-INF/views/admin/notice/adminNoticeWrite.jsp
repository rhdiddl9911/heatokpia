<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.io.*, java.text.*" %>

<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p><font size="4" color="black">관리자 공지 쓰기</font></p>
<c:url var="insertUrl" value="/admin/notice/write"/>

<sf:form modelAttribute="memobean" method="post" action="${insertUrl}">
	<sf:select path="category">
		<sf:option value="0">공지사항</sf:option>
		<sf:option value="1">이벤트</sf:option>
	</sf:select>
	<b>제목</b><sf:input path="title" size="50" maxlength="50"/>
			<sf:errors path="title" cssClass="error"/>

	<hr>
	<h3>내용</h3>
	<sf:textarea path="content" size="200" cssStyle="width:350px;height:100px;" maxlength="200"/><br/>
	<sf:errors path="content" cssClass="error"/>
	<hr>
	<input type="submit" value="등록"/>	
</sf:form>

</body>
</html>