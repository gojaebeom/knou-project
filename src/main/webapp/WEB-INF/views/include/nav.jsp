<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="navbar navbar-expand navbar-dark bg-primary">
	<div class="container d-flex justify-content-start position-relative">
		<div class="btn-group mobile-menu">
		  <button class="btn bmd-btn-fab bmd-btn-fab-sm dropdown-toggle" type="button" id="ex3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    <i class="ri-menu-2-line" style="color:white;"></i>
		  </button>
		  <div class="dropdown-menu  dropdown-menu-left" aria-labelledby="ex3">
		    <button class="dropdown-item" type="button">홈</button>
		    <button class="dropdown-item" type="button">소통의 방</button>
		    <button class="dropdown-item" type="button">학우의 방</button>
		  </div>
		</div>
		
		<a class="navbar-brand p-2 font-jua mt-1" style="font-size:30px;" href="/">
			방송대 QA
		</a>
		<ul class="navbar-nav pc-menu">
			<li class="nav-item active"><a class="nav-link font-weight-bold"
				href="/">홈</a></li>
			<li class="nav-item active"><a class="nav-link font-weight-bold"
				href="/boards">소통마당</a></li>
			<li class="nav-item active"><a class="nav-link font-weight-bold"
				href="/users">학우마당</a></li>
			<li class="nav-item active"><a class="nav-link font-weight-bold"
				href="/tags" style="color:#E6E6E6;">#태그 검색</a></li>
		</ul>
		<div class="container-smal">
			<%@ include file="/WEB-INF/views/include/profile-menu.jsp"%>
		</div>
	</div>
</header>





