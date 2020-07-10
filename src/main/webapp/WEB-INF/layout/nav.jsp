<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="navbar navbar-expand navbar-dark bg-primary">
	<div class="container d-flex justify-content-start position-relative">
		<div class="btn-group mobile-menu" >
		  <button class="btn bmd-btn-fab bmd-btn-fab-sm dropdown-toggle d-flex justify-content-center align-items-center" 
		  type="button" 
		  id="mobile-nav" 
		  data-toggle="dropdown" 
		  aria-haspopup="true" 
		  aria-expanded="false">
		    <i class="ri-menu-2-line" style="color:white;"></i>
		  </button>
		  <div class="dropdown-menu  dropdown-menu-left" aria-labelledby="mobile-nav">
		    <button class="dropdown-item" type="button" onclick="location.href='/boards'">소통마당</button>
		    <button class="dropdown-item" type="button" onclick="location.href='/users'">학우마당</button>
		    <button class="dropdown-item" type="button" onclick="location.href='/tags'">#태그 검색</button>
		    <button class="dropdown-item" type="button" 
		    	data-toggle="tooltip" 
				data-placement="bottom" 
				title="관리자 메일로 불편한점이나 오류 발견시 문의해주시면 감사하겠습니다   (⊙_⊙;)" 
		    onclick="location.href='mailto:const.gjb@gmail.com'">관리자 문의</button>
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
			<li class="nav-item active"><a class="nav-link font-weight-bold" 
				data-toggle="tooltip" 
				data-placement="bottom" 
				title="관리자 메일로 불편한점이나 오류 발견시 문의해주시면 감사하겠습니다 (⊙_⊙;) " 
				href="mailto:const.gjb@gmail.com">관리자 문의</a></li>
			
		</ul>
		<div class="container-smal">
			<%@ include file="/WEB-INF/layout/profile-menu.jsp"%>
		</div>
	</div>
	
</header>
<%@ include file="/WEB-INF/layout/modal/feedback-modal.jsp"%>




