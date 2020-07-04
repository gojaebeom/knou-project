<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<title>방송대 Q&A</title>
</head>
<body>
	<header class="navbar navbar-expand navbar-dark bd-navbar bg-primary">
		<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	</header>
	<section class="container">
		<div class="card">
	  		<div class="card-body">
				<div class="row mb-5">
					<div class="col">	
						<div class="media">
						  <img class="mr-3 rounded" src="/assets/imgs/cover-1.jpg"
						   alt="Generic placeholder image" width="120px" height="120px">
						  <div class="media-body">
						    	<h5 class="mt-0" style="font-size:1.8em">${USER.nickname }</h5>
						    	<br>
						     	가입일 : <fmt:formatDate value="${USER.createdAt}" pattern="yyyy-MM-dd"/>
						     	<br>
						     	<br>
						     	<c:if test="${ACCOUNT.id == USER.id}">
						     		<a href="/users/${USER.id}/edit">개인 정보 수정</a>
						     	</c:if>
						  </div>
						</div>
					</div>
				</div>
				<div class="row d-flex flex-wrap">
					<div class="col">
						작성한 글
					</div>
					<div class="col">
						답변한 글
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>