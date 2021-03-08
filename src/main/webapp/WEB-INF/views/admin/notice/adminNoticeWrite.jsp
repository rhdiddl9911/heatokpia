<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.io.*, java.text.*" %>

<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 - 공지 작성</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board_write.css"/>

</head>
<body>
<p><font size="4" color="black">관리자 공지 쓰기</font></p>
<c:url var="insertUrl" value="/admin/notice/write"/>

<div id="writeForm">
<form action="${insertUrl}" id="write" method="post">
	<select name="category">
		<option value="0">공지사항</option> 
		<option value="1">이벤트 </option>
	</select>
	<div class="title">
	<input type="text" name="title" placeholder="제목">
	</div>
	
	<div class="content">
		<textarea name="content" placeholder="내용"></textarea>
	</div>
	
	<div id="btn">
	<input type="button" onclick="javascript:location.replace('/admin/notice')" value="취소">
	<input type="submit" value="등록" class="primary">
	</div>
	</form>
</div>

</body>
</html>