<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><c:out value="${boardData.title}"/></h1>
	<div>
		<span class="name"><c:out value="${boardData.name}"/></span>
		<span class="lastdate">
		<c:if test="${(boardData.updatedate == null)}">
			<c:out value="${boardData.createdate}"/>
		</c:if>
		<c:if test="${!(boardData.updatedate == null)}">
			<c:out value="${boardData.updatedate}"/>
		</c:if>
		</span>
	</div>
	<div class="content">
		<c:out value="${boardData.content}"/>
	</div>
	
	<div>
		<c:out value="${likeCount}"/><button onclick="javascript:likeThis('${category}',${seq})">좋아요</button>
	</div>
	
	<div>
	<form action="/board/${category}/${seq}" method="post" name="passcheck">
		<input type="hidden" name="method" id="method">
		<button onclick="javascript:goPass('up')" type="button">수정</button><button onclick="javascript:goPass('del')" type="button">삭제</button>
	</form>
	</div>
	
	<div>
	<h4>댓글</h4>
	<form name="commentForm" id="commentForm" method="post" action="">
		<input type="text" name="name" placeholder="닉네임">
		<input type="password" name="password" placeholder="비밀번호"><br>
		<input type="text" name="content">
		<input type="button" value="댓글 입력" onclick="javascript:commentWrite('${category}',${seq})">
	</form>
	<hr>
	<c:forEach var="comment" items="${commentList}">
	<div>
		<label><strong><c:out value="${comment.name}"/></strong></label><br>
		<c:out value="${comment.content}"/><input type="button" onclick="javascript:goPass('${comment.seq}')" value="삭제">
		<hr>
	</div>
	</c:forEach>
	</div>
	
	
	<script type="text/javascript">
		function goPass(method){
			document.getElementById('method').value = method;
			document.passcheck.submit();
		}
	</script>
	<script src="/js/jquery-3.5.1.js"></script>
	<script src="/js/jquery.serializeObject.min.js"></script>
	<script type="text/javascript">
		function commentWrite(category, seq){
			sendData = $("#commentForm").serializeObject();
			
			$.ajax({
				url: "/board/"+category+"/"+seq+"/new",
				method: "POST",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(sendData)
			}).done(function(){
				 location.reload();
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
	
	<script type="text/javascript">
		function likeThis(category, seq){
			
			$.ajax({
				url: "/board/"+category+"/"+seq+"/like",
				method: "POST",
				contentType: "application/json; charset=utf-8"
			}).done(function(text){
				alert(text);
				location.reload();
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