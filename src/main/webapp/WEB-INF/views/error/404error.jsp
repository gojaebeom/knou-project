<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/profile-menu.css" rel="stylesheet">
	<title>방송대 커뮤니티 - 404</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<section class="container">
		<div class="alert alert-success" role="alert">
		  <h4 class="alert-heading">요청하신 페이지를 찾을 수 없습니다!</h4>
		  <p>요청하신 주소에 맞는 페이지가 없습니다. </p>
		  <hr>
		  <p class="mb-0">There is no page for the address you requested.</p>
		</div>
	</section>
	
	
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>