<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/profile-menu.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/sign-form.css" rel="stylesheet">
	<title>방송인 Q&A - 회원가입</title>
</head>
<body>
	<header class="navbar navbar-expand navbar-dark flex-md-row bd-navbar bg-primary">
		<%@ include file="/WEB-INF/views/include/admin-nav.jsp"%>
	</header>
	<section class="container d-flex justify-content-center">
		<div class="alert alert-primary" role="alert">
		  	해당 계정으로 인증 메일을 보냈습니다. 메일을 확인해주세요. <a href="/">home으로 돌아가기</a>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>