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

<div>내 문의</div>

<div>
	<div>${question.title}</div>
	<div>${question.content}</div>
	<form id="write">
	<textarea name="content" disabled="disabled" class="disabled">${anser.content}</textarea>
	</form>
</div>

<div>
	<c:if test="${anser.content == null}">
		<span><input type="button" value="답변" onclick="javascript:writeAreaMake()" id="writebtn"></span>
	</c:if>
</div>

<%@include file="../../footer.jsp" %>
<script src="/js/jquery.serializeObject.min.js"></script>

</body>

<script>
	function writeAreaMake(){
		$(".disabled").removeAttr("disabled")
		$(".disabled").val("")
		$("#writebtn").attr("onclick", "javascript:writeDo(${question.seq}, confirm('정말 등록하시겠습니까?'))")
	}
	
	function writeDo(seq, confirm){
		if(confirm){
			var sendData = $("#write").serializeObject();
			
			$.ajax({
				url: "/admin/support/"+seq,
				method: "POST",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(sendData)
			}).done(function(){

				console.log(sendData)
				location.reload();
			}).fail(function(error){

				console.log(sendData)
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
	}
</script>
</html>