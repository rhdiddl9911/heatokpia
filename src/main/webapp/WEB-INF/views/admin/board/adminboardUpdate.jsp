<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 글 수정</title>

<link rel="stylesheet" type="text/css" href="/css/board/board_write.css"/>

</head>
<body>
<div id="writeForm">
		<form action="" id="write" method="post">
		<input type="text" name="name" placeholder="NAME" value="${boardData.name}">
		<input type="password" name="password" placeholder="PW">
		<div class="title">
			<input type="text" name="title" placeholder="제목" value="${boardData.title}">
		</div>
		<div class="content">
			<textarea name="content"  placeholder="내용">${boardData.content}</textarea>
		</div>
		<div id="btn">
			<input type="button" onclick="javascript:location.reload()" value="취소">
			<input type="button" onclick="javascript:writeDo('${category}', ${seq})" value="수정" class="primary">
		</div>
		</form>
</div>
	
<%@include file="../../footer.jsp" %>
<script src="/js/jquery.serializeObject.min.js"></script>
<script>
	function writeDo(category, seq){
		sendData = $("#write").serializeObject();
		
		$.ajax({
			url: "/admin/board/"+category+"/"+seq+"/up/do",
			method: "POST",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(sendData)
		}).done(function(){
			location.replace('/admin/board/'+category);
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
</body>
</html>