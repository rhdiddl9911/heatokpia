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
	<div>빠른답변을 기다리는 문의</div>
	<div>
		<span>문의 제목</span>
		<span>문의 내용</span>
		<span>문의 일시</span>
	</div>
	<c:forEach var="qData" items="${QListNoAnser}">
		<div onclick="location.href='/admin/support/${qData.seq}'">
			<span><c:out value="${qData.title}"/></span>
			<span><c:out value="${qData.content}"/></span>
			<span><c:out value="${qData.createdate}"/></span>
		</div>
	</c:forEach>
	
	<div>문의 목록</div>
	<div>
		<span>답변</span>
		<span>문의 제목</span>
		<span>내용미리보기</span>
		<span>email</span>
	</div>
	<c:forEach var="qData" items="${QList}">
		<div onclick="location.href='/admin/support/${qData.seq}'">
			<span><c:if test="${qData.anser == true}"><c:out value="완"/></c:if></span>
			<span><c:out value="${qData.title}"/></span>
			<span><c:out value="${qData.content}"/></span>
		</div>
	</c:forEach>
<%@include file="../../footer.jsp" %>

</body>
</html>