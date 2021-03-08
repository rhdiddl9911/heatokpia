<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.io.*, java.text.*" %>

<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 - 뉴스 작성</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board_write.css"/>

</head>
<body>
<h2>관리자 뉴스 입력</h2>
<c:url var="insertUrl" value="/admin/notice/write"/>

<div id="writeForm">

<form action="" id="write" method="post">
	<div class="title">
	<input type="text" name="title" placeholder="제목">
	</div>
	<div class="content">
	<textarea name="content" placeholder ="내용"></textarea>
	</div>
	
	<div style="margin-bottom: 1em;">
		
	<input type="text" name="authorship" placeholder="출처" style="width: 40%;">
	<input type="text" name="url" placeholder="url" style="width: 56%;"><br>
	
	</div>
	
	<div id="btn">
	<input type="button" onclick="location.replace('/admin/news')" value="취소">
	<input type="button" onclick="javascript:writeDo()" value="작성" class="primary">
	</div>
</form>

</div>
<%@include file="../../footer.jsp"%>
</body>


<script src="/js/jquery.serializeObject.min.js"></script>
<script>
	function writeDo(){
		sendData = $("#write").serializeObject();
		
		$.ajax({
			url: "/admin/news/new",
			method: "POST",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(sendData)
		}).done(function(){
			location.replace('/admin/news');
		}).fail(function(error){
			var errorMessege ="";

			if(error.responseJSON == null){
				errorMessege += error.responseText;
				alert(errorMessege);
				return;
			}
			
			$.each(error.responseJSON, function(key, value){
				errorMessege += value+"\n";
			});
			alert(errorMessege);
			return;
			
		});
	}
</script>
</html>