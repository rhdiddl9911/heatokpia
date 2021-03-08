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
		<c:out value="${newsData.title}"/>
	</div>
	<div>
		<c:out value="${newsData.member.name}"/>
	</div>
	<div>
		<c:out value="${newsData.content}"/>
	</div>
	<div>
		<span><c:out value="${newsData.authorship}"/> ::: </span>
		<span><a href="<c:out value="${newsData.url}"/>"><c:out value="${newsData.url}"/></a></span>
	</div>
	
	<input type="button" value="삭제" onclick="javascript:deleteDo(confirm('정말 삭제 하시겠습니까?'),${newsData.seq})">
	
	<%@include file="../../footer.jsp" %>
	
	<script>
	function deleteDo(confirm, seq){
		if (confirm){
			$.ajax({
				url: "/admin/news/"+seq+"/del/do",
				method: "POST",
				data: {
					seq : seq*1
				}
			}).done(function(){
				alert("삭제 되었습니다.");
				location.replace("/admin/news");
			}).fail(function(error){
				alert("삭제 실패");
				return;
			});
		}else{
			
		}
	}
	</script>
</body>
</html>