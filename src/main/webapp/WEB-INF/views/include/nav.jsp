<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container d-flex justify-content-start position-relative">
	<div class="btn-group mobile-menu">
	  <button class="btn bmd-btn-fab bmd-btn-fab-sm dropdown-toggle" type="button" id="ex3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    <i class="material-icons">more_vert</i>
	  </button>
	  <div class="dropdown-menu  dropdown-menu-left" aria-labelledby="ex3">
	    <button class="dropdown-item" type="button">게시글 정보</button>
	    <button class="dropdown-item" type="button">사용자 정보</button>
	    <button class="dropdown-item" type="button">코맨트 정보</button>
	  </div>
	</div>
	
	<a class="navbar-brand p-2" href="/">
		<i class="ri-home-smile-fill" style="font-size: 30px;"></i>
	</a>
	<ul class="navbar-nav pc-menu">
		<li class="nav-item active"><a class="nav-link font-weight-bold"
			href="/">홈</a></li>
		<li class="nav-item"><a class="nav-link font-weight-bold"
			href="/boards?page=1&field=title&query">소통의 방</a></li>
		<li class="nav-item"><a class="nav-link font-weight-bold"
			href="/users">학우의 방</a></li>
	</ul>
	<div class="container-smal">
		<%@ include file="/WEB-INF/views/include/profile-menu.jsp"%>
	</div>
</div>





