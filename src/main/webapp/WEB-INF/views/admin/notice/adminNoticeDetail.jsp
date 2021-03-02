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
	
	<input type="button" value="수정" onclick="javascript:goUpdate(${noticeData.seq})">
	<input type="button" value="삭제" onclick="">
	
	<%@include file="../../footer.jsp" %>
	
	
	<script>
	function goUpdate(seq){
		$.ajax({
			url: "/admin/notice/up",
			method: "GET",
			data: {
				"seq": seq
			}
		}).done(function(page){
			$("body").html(page);
		}).fail(function(){
			alert('화면을 불러오는데 실패하였습니다.');
		});
	}
	</script>
</body>
</html>