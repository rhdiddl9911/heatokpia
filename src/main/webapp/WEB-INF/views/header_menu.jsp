<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="/css/header_menu.css"/>

<div id="wrap">
	<div id="inner">

<header>
	<div>
		<img src="/img/logo_heatok.png">
		<span>
			<sec:authorize access="isAuthenticated()">
			<a>내정보</a> | <a href="/logout">로그아웃</a>
				<sec:authorize access="hasRole('ADMIN')">
				<span><a href="/admin">관리자</a></span>
				</sec:authorize>
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
			<a href="/login">로그인</a> | <a>회원가입</a>
			</sec:authorize>
		</span>
	</div>
	<nav>
	<ul id="menulist">
		<li><a href="/workzone">BEST</a></li>
		<li><a href="/board/free">자유게시판</a></li>
		<li><a href="/board/info">정보게시판</a></li>
		<li><a href="/news">뉴스</a></li>
		<li><a href="/workzone">주가정보</a></li>
		<li><a href="/notice">공지사항</a></li>
		<li><a href="/support">고객지원</a></li>
	</ul>
	</nav>
	
</header>
