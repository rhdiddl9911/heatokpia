<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../header_menu.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>진행중인 문의</div>
	<div>
		<span>문의 제목</span>
		<span>문의 일시</span>
	</div>
	<c:forEach var="qData" items="${nonfinishQList}">
		<div>
			<span><c:out value="${qData.title}"/></span>
			<span><c:out value="${qData.createdate}"/></span>
		</div>
	</c:forEach>
	
	<div>종료된 문의</div>
	<div>
		<span>문의 제목</span>
		<span>문의 일시</span>
		<span>답변자</span>
	</div>
	<c:forEach var="qData" items="${finishQList}">
		<div onclick="location.href='/support/my/${qData.seq}'">
			<span><c:out value=""/></span>
			<span><c:out value=""/></span>
			<span><c:out value=""/></span>
		</div>
	</c:forEach>
<%@include file="../footer.jsp" %>

</body>
</html>