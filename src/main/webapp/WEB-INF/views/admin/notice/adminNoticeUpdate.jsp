<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 공지 수정</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board_write.css"/>

</head>
<body>

<div id="writeForm">
<form action="" id="write" method="post">
	<input type="hidden" name="seq" value="${noticeData.seq}">
	<select name="category">
		<option value="0" <c:if test="${noticeData.category == 0}">selected</c:if>>공지사항</option> 
		<option value="1" <c:if test="${noticeData.category == 1}">selected</c:if>>이벤트 </option>
	</select>
	<div class="title">
	<input type="text" name="title" placeholder="제목" value="${noticeData.title}">
	</div>
	
	<div class="content">
		<textarea name="content" placeholder="내용">${noticeData.content}</textarea>
	</div>
	
	<div id="btn">
	<input type="button" onclick="javascript:location.reload()" value="취소">
	<input type="button" onclick="javascript:writeDo(confirm('정말 수정하시겠습니까?'))" value="수정" class="primary">
	</div>
	</form>
</div>
<%@include file="../../footer.jsp" %>
<script src="/js/jquery.serializeObject.min.js"></script>
<script>
	function writeDo(confirm){
		if (confirm){
			sendData = $("#write").serializeObject();
			$.ajax({
				url: "/admin/notice/up/do",
				method: "POST",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(sendData)
			}).done(function(){
				alert("수정 되었습니다.");
				location.reload();
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
		
	}
</script>
</body>
</html>