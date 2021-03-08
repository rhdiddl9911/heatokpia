<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 뉴스 상세</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board_detail.css"/>


</head>
<body>
	<div style="border-top: solid 3px #2C3E50;"></div>
	<h2><c:out value="${newsData.title}"/></h2>
	<div id="detailwrap">
	<div id="writeinfo">
		<span class="name"><c:out value="${newsData.member.name}"/></span>
		<span class="authorship">
			<span><c:out value="${newsData.authorship}"/></span>
			<a href="<c:out value="${newsData.url}"/>"><c:out value="${newsData.url}"/></a>
		</span>
	</div>
	
	<div class="content">
		<c:out value="${newsData.content}"/>
	</div>
	</div>
	
	<div id="btn">
	<input type="button" value="삭제" onclick="javascript:deleteDo(confirm('정말 삭제 하시겠습니까?'),${newsData.seq})" class="primary">
	</div>
	
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