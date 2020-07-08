<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="i" value="0"/>
<c:if test="${!empty ACCOUNT}">
<div class="profile-menu">
	<ul class="main-menu">
		<li id="content-li" class="content-li">
			<a class="nickname-wrap">${ACCOUNT.nickname}</a>
			<a class="img-wrap">
				<img id="accountImage" class="primary "class="" src="/images/${(ACCOUNT.image != null)?ACCOUNT.image:'default.png'}"/>		
			</a>
			<ul id="sub-menu" class="sub-menu">
				<li><a href="/boards/form">💬 글쓰기 </a></li>
				<li><a href="/users/${ACCOUNT.id}">😀 내 정보</a></li>
				<li><a href="/users/sign-out">👋 로그아웃</a></li>		
			</ul>
		</li>
	</ul>
</div>
</c:if>
<c:if test="${empty ACCOUNT}">
	<div class="login-menu">
		<button type="button" class="btn btn-raised btn-success" onclick="location.href='/users/sign-in'">로그인   </button>
	</div>
</c:if>

