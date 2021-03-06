<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../admin_header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>

<link rel="stylesheet" type="text/css" href="/static/css/board/board_detail.css"/>

</head>
<body>
	<div id="detailwrap">
	
	<h1><c:out value="${boardData.title}"/></h1>
	<div id="writeinfo">
		<span class="name"><c:out value="${boardData.name}"/></span>
		<span class="lastdate">
			생성일 <c:out value="${boardData.createdate}"/>
		<c:if test="${boardData.updatedate != null}">
			수정일 <c:out value="${boardData.updatedate}"/>
		</c:if>
		</span>
	</div>
	
	<div class="content">
		<c:out value="${boardData.content}"/>
	</div>
	
	<div id="countinfo">
	<div>
		<label>조회수: </label><c:out value="${boardData.hit}"/>
	</div>
	<div>
		<c:out value="${likeCount}"/>
	</div>
	</div>
	
	</div>
	
	<div id="btn">
		<button type="button" onclick="javascript:goUp()">수정</button>
		<button type="button" onclick="javascript:goDel(confirm('삭제 하시겠습니까?'))">삭제</button>
	</div>
	
	<h4 style="clear: both;">댓글</h4>
	<hr>
	
		<div id="comment">
		<c:forEach var="comment" items="${commentList}">
		<div class="item">
			<label><strong><c:out value="${comment.name}"/></strong></label>
			<div class="content">
			<c:out value="${comment.content}"/></div>
			<input type="button" value="삭제" onclick="javascript:goCommentDel(confirm('삭제하시겠습니까?'), ${comment.seq})">
		</div>
		</c:forEach>
		</div>
	
	<%@include file="../../footer.jsp" %>
	
	<script>
	var category = "<c:out value='${category}'/>";
	var seq = "<c:out value='${seq}'/>";
	</script>
	
	<script>
		function goUp(){
			$.ajax({
				url: "/admin/board/"+category+"/"+seq+"/up",
				method: "GET"
			}).done(function(page){
				$("body").html(page);
			}).fail(function(){
				alert('화면을 불러오는데 실패하였습니다.');
			});
		}
	</script>
	
	<script>
		function goDel(confirm){
			if(confirm){
				$.ajax({
					url: "/admin/board/"+category+"/"+seq+"/del/do",
					method: "POST"
				}).done(function(){
					alert('삭제되었습니다.');
					location.replace("/admin/board/"+category)
				}).fail(function(){
					alert('오류');
				});
			}
			
		}
	</script>
	
	<script>
		function goCommentDel(confirm, commentseq){
			if(confirm){
				$.ajax({
					url: "/admin/board/"+category+"/"+seq+"/"+commentseq+"/del/do",
					method: "POST"
				}).done(function(){
					alert('삭제되었습니다.');
					location.replace("/admin/board/"+category+"/"+seq)
				}).fail(function(){
					alert('오류');
				});
			}
			
		}
	</script>
	
</body>
</html>