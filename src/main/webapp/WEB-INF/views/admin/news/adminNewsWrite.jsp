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
<p><font size="4" color="black">관리자 뉴스 입력</font></p>
<c:url var="insertUrl" value="/admin/notice/write"/>

<form action="" id="write" method="post">
	<input type="text" name="title" placeholder="제목"><br>
	<textarea name="content" placeholder ="내용"></textarea><br>
	<input type="text" name="url" placeholder="url"><br>
	<input type="text" name="authorship" placeholder="출처"><br>
	<input type="button" onclick="location.replace('/admin/news')" value="취소">
	<input type="button" onclick="javascript:writeDo()" value="작성">
</form>

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