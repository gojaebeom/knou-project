<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<a class="navbar-brand p-2" href="/admin"><i
	class="ri-home-smile-fill" style="font-size: 30px;"></i></a>
<ul class="navbar-nav pc-menu">
	<li class="nav-item active"><a class="nav-link font-weight-bold"
		href="/admin">관리자 홈</a></li>
	<li class="nav-item"><a class="nav-link font-weight-bold"
		href="/admin/boards">게시글 정보</a></li>
	<li class="nav-item"><a class="nav-link font-weight-bold"
		href="/admin/users">사용자 정보</a></li>
	<li class="nav-item"><a class="nav-link font-weight-bold"
		href="/admin/comments">코맨트 정보</a></li>
</ul>
<%@ include file="/WEB-INF/layout/profile-menu.jsp"%>




