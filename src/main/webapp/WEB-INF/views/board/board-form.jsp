<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/sign-form.css" rel="stylesheet">
	<title>방송대 Q&A</title>
</head>
<body>
	<!-- 현재 유저의 아이디와 페스에 해당하는 아이디가 일치하지 않으면 리다이렉트 시킴  -->
	<c:if test="${empty ACCOUNT}">
		<c:redirect url="/"/>
	</c:if>
	<header class="navbar navbar-expand navbar-dark bd-navbar bg-primary">
		<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	</header>
	<section class="container d-flex justify-content-center">
				<div class="card" style="width:100%;">
				  <div class="card-body">
				  	<h5 class="card-title mb-4">글 쓰기</h5>
					<form action="/boards" method="post">			
						<input id="writerId" name="writerId" value="${ACCOUNT.id}" type="hidden">								
						<label>제목</label><br>
						<input id="title" name="title"/>
					
						<label>내용 입력</label><br>
						<textarea name="content" rows="10" cols="" style="width:100%; border:1px solid #E6E6E6; border-radius:3px;"></textarea>
						
						<label>태그 입력</label><br>
						<input id="tag"/>												
						<button id="submitBtn" class="btn btn-raised btn-primary" type="submit">생성</button>
					</form>
				  </div>
				</div>
	</section>
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>