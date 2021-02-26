<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" id="write" method="post">
	<div><span class=".v_name"></span><span></span></div>
	<input type="text" name="name" placeholder="NAME" value="${boardData.name}">
	<input type="password" name="password" placeholder="PW"><br>
	<input type="text" name="title" placeholder="제목" value="${boardData.title}"><br>
	<input type="text" name="content" placeholder="내용" value="${boardData.content}"><br>
	<input type="button" onclick="javascript:location.reload()" value="취소">
	<input type="button" onclick="javascript:writeDo('${category}', ${seq})" value="글쓰기">
	</form>
	
<%@include file="../footer.jsp" %>
<script src="/js/jquery.serializeObject.min.js"></script>
<script>
	function writeDo(category, seq){
		sendData = $("#write").serializeObject();
		
		$.ajax({
			url: "/board/"+category+"/"+seq+"/up/do",
			method: "POST",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(sendData)
		}).done(function(){
			location.replace('/board/'+category);
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