<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>

<style>
<!--
	#qnabtn {
		margin: 0 auto;
		text-align: center;
		
		vertical-align: middle;
	}
	#qnabtn button{
		display: inline-block;
		width: 40%;
		height: 4em;
		margin: 2em;
		border: solid 2px #2C3E50;
		border-radius: 0.75em;
		font-size: 1.2em;
	}
	#qnabtn button:hover{
		background: #aaa;
	}
-->
</style>

<html>
<head>
<meta charset="UTF-8">
<title>고객 지원</title>
</head>
<body>
	<div>
		자주 묻는 질문 영역
	</div>

	<div id="qnabtn">
		<button onclick="location.href='/support/my'" class="primary">내 질문 내역 보기</button>
		<button onclick="location.href='/support/my/new'" class="primary">질문 하러 가기</button>
	</div>
	
<%@include file="../footer.jsp" %>

</body>
</html>