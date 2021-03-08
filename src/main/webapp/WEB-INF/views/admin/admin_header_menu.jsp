<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="/css/header_menu.css"/>
<link rel="stylesheet" type="text/css" href="/css/common.css"/>

<div id="wrap">
	<div id="inner">
	
<header>
	<div>
		<img src="/img/logo_heatok.png" onclick="location.href='/'" style="cursor:pointer;">
		<span>
			<sec:authorize access="hasRole('ADMIN')">
			<span><a href="/logout">로그아웃</a></span> <span>관리자</span>
			</sec:authorize>
			
		</span>
	</div>
	<nav>
	<ul id="menulist">
		<li><a href="/admin/workzone">회원관리</a></li>
		<li><a href="/admin/manage">게시물관리</a></li>
		<li><a href="/admin/notice">공지사항</a></li>
		<li><a href="/admin/support">문의</a></li>
	</ul>
	</nav>
	
</header>
