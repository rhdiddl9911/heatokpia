<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주가 검색</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board_write.css"/>

</head>
<body>
	<div id="financeSearch">
		<h1>검색할 이름을 입력하세요</h1>
	<form action="/finance" method="post" id="financeSearch">
		<input type="text" name="name" id="name" placeholder="주가 이름을 입력해주세요">
		
		<div id="passbtn">
			<input type="button" onclick="javascript:searchDo()" value="확인" class="primary">
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
		function searchDo(){
			var name = $("#name").val();
			
			$.ajax({
				url: "/finance",
				method: "POST",
				data: {
					"name": name
				}
			}).done(function(result){
				alert("검색하신 " +name+ " 현재 주가 : "+result +"$")
			}).fail(function(error){
				alert("가져오지 못했습니다. 이름을 확인해주세요");
			});
		}
	</script>
</body>
</html>