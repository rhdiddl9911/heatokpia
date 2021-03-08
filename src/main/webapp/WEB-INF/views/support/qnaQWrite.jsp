<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 등록</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board_write.css"/>

</head>
<body>

	<div><strong>문의 등록</strong></div>
	<div id="writeForm">
		<form id="write">
			<div class="title">
				<input type="text" name="title" placeholder="제목을 입력해주세요">
			</div>
			<div class="content">
				<textarea name="content" placeholder="문의 내용을 입력해주세요"></textarea>
			</div>
			<div id="btn">
			<input type="button" onclick="javascript:location.href='/support/my'" value="취소">
			<input type="button" onclick="javascript:writeDo()" value="작성" class="primary">
			</div>
		</form>
	</div>
	
<%@include file="../footer.jsp" %>
<script src="/static/js/jquery.serializeObject.min.js"></script>
<script>
	function writeDo(){
		var sendData = $("#write").serializeObject();
		
		$.ajax({
			url: "/support/my/new",
			method: "POST",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(sendData)
		}).done(function(){
			location.replace('/support/my');
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
		});
	}
</script>
</body>
</html>