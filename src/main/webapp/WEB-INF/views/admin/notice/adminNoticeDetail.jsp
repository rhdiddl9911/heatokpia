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
	<input type="button" value="삭제" onclick="javascript:deleteDo(confirm('정말 삭제 하시겠습니까?'),${noticeData.seq})">
	
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
	
	<script>
	function deleteDo(confirm, seq){
		if (confirm){
			$.ajax({
				url: "/admin/notice/del/do",
				method: "POST",
				data: {
					seq : seq*1
				}
			}).done(function(){
				alert("삭제 되었습니다.");
				location.replace("/admin/notice");
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