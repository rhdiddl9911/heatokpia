<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번확인</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board_write.css"/>

</head>
<body>
	<div id="passForm">
		<h1>비밀번호를 입력하세요 </h1>
	<form action="" method="post" id="passcheck">
		<input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요">
		
		<div id="passbtn">
			<input type="button" onclick="javascript:passCheck('${method}')" value="확인" class="primary">
			<input type="button" onclick="javascript:location.reload();" value="취소">
		</div>
		
	</form>
	</div>
	
<%@include file="../footer.jsp" %>
<script src="/static/js/jquery.serializeObject.min.js"></script>
	<script>
	var category = "<c:out value='${category}'/>";
	var seq = "<c:out value='${seq}'/>";
	</script>
	<script>
		function passCheck(method){
			var password = $("#password").val();
			
			$.ajax({
				url: "/board/"+category+"/"+seq+"/"+method,
				method: "POST",
				data: {
					"password":password
				}
			}).done(function(result){
				if(method == "del"){
					location.replace("/board/"+category);
					return;
				}
				
				if(method == "up"){
					if(result == null || result == ""){
						alert("맞지 않습니다");
						location.replace("/board/"+category+"/"+seq);
						//history.back();
					}else{
						$("body").html(result);
					}
					return;
				}
				
				if(typeof(method*1) == 'number'){
					alert(result);
					location.replace("/board/"+category+"/"+seq);
					//history.back();
					return;
				}
				
			}).fail(function(error){
				var errorMessege ="";
				console.log(error);
				errorMessege += error.responseText;
				alert(errorMessege);
				//location.replace("/board/"+category+"/"+seq);
				//history.back();
				location.reload();
			});
		}
	</script>
</body>
</html>