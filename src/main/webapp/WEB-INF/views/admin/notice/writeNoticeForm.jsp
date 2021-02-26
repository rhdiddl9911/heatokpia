<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.io.*, java.text.*" %>
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
	<table width="400" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td><b>제목</b></td>
			<td><sf:input path="title" size="50" maxlength="50"/><br/>
			<sf:errors path="title" cssClass="error"/></td>
		</tr>
		<tr>
			<td><b>내용</b></td>
			<td><sf:textarea path="content" size="200" cssStyle="width:350px;height:100px;" maxlength="200"/><br/>
				<sf:errors path="content" cssClass="error"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="등록"/>	
			</td>
		</tr>
	</table>
</sf:form>

</body>
</html>