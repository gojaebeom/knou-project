<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/profile-menu.css" rel="stylesheet">
	<title>방송대 Q&A</title>
</head>
<body>
	<header class="navbar navbar-expand navbar-dark bd-navbar bg-primary">
		<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	</header>
	<section class="container">
		<div class="row">
			<div class="col-12 col-md-8">
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:20px;">
					최근 게시물
				</h1>
				<div class="card">
				<c:choose>
					<c:when test="${empty BoardList}">
						<p>등록된 게시물이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${BoardList}" var="b">
							<div class="d-flex" style="padding:20px; border-bottom:1px solid #D8D8D8;">
								<div class="d-flex" style="width:200px;">
									<div class="f-1 d-flex flex-column justify-content-center align-items-center mr-2">
										<div style="font-size:20px; margin-bottom:10px;">${b.hit}</div>
										<div>조회</div>
									</div>
									<div class="f-1 d-flex flex-column justify-content-center align-items-center mr-2">
										<div style="font-size:20px; margin-bottom:10px;">${b.commentCnt }</div>
										<div>댓글</div>
									</div>
									<div class="f-1 d-flex flex-column justify-content-center align-items-center mr-3">
										<div style="font-size:20px; margin-bottom:10px;">${10}</div>
										<div>추천</div>
									</div>
								</div>
								<div class="d-flex flex-column" style="width:100%;">
									<div style="font-size:20px; margin-bottom:10px;"><a href="/boards/${b.id}">${b.title}</a></div>
									<div style="display:flex;justify-content:flex-end;">
										<a href="" style="margin-right:10px;">${b.user.nickname}</a>
										<span><fmt:formatDate value="${b.createdAt }" pattern="yyyy-MM-dd-hh-mm-ss"/></span>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</div>
				<div class="d-flex justify-content-end">
					<button type="button" class="btn btn-primary" onclick="location.href='/boards?page=1&field=title&query'">전체 보기</button>
				</div>
			</div>
			<div class="col-md-4 col-sm-12">
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:20px;">프로필</h1>
				<div class="card d-flex justify-content-center align-items-center" style="width:100%;">
				  <img class="card-img-top" src="${pageContext.request.contextPath}/assets/imgs/cover.jpg" alt="Card image cap"
				  style="width:150px; height:150px; border-radius:100%; margin-top:20px; margin-bottom:20px; border:3px solid #E6E6E6;">	
				    <c:if test="${empty ACCOUNT}">
				    	<p class="card-text">로그인하여 방송대 학우들과 소통하세요!🥰</p>
				    	<a href="/sign-in" class="btn btn-primary">로그인하기</a>
				    </c:if>
				    <c:if test="${!empty ACCOUNT}">
				    	<h5 class="card-title" style="font-size:25px;"><a href="/users/${ACCOUNT.id}">${ACCOUNT.nickname}</a></h5>
				    	<p class="card-text">${ACCOUNT.email}</p>
				    	<br>
				    	<p class="card-text" style="margin:10px 0px;">오늘의 기분: 😘 </p>
						<div style="margin-top:20px; margin-bottom:30px; width:100%; text-align:center">
							<a href="/boards/form" class="btn btn-primary btn-lg active" role="button" aria-pressed="true"
		    				style="width:80%; border-radius:30px;">글 쓰기 </a>
						</div>
			    	</c:if>
			  </div>
			</div>
		</div>
	</section>
	
	
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>