<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/layout/head.jsp"%>
	<link href="/assets/css/profile-menu.css" rel="stylesheet">
	<title>방송대 커뮤니티 - 태그 검색 </title>
</head>
<body>
	
	<!-- header -->
	<%@ include file="/WEB-INF/layout/nav.jsp"%>

	<section class="container mt-5 mb-5">	
		<c:choose>
			<c:when test="${empty BOARDLIST}">
				
			</c:when>
			<c:otherwise>
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="/tags">#TAG</a></li>
				    <li class="breadcrumb-item"><a href="/tags/${TAGNAME }">${TAGNAME}</a></li>
				    <li class="breadcrumb-item active" aria-current="page">${TOTAL}</li>
				  </ol>
				</nav>
				<c:forEach items="${BOARDLIST}" var="b">
					<div class="list-wrap d-flex p-3 mb-4">
						<div class="status-wrap d-flex justify-content-center aling-items-center" >
							<div class="status-child d-flex flex-column justify-content-center align-items-center">
								<a class="font-scp">${b.hit}</a>
								<a class="mt-2">조회</a>
							</div>
							<div class="status-child d-flex flex-column justify-content-center align-items-center">
								<a class="font-scp">${b.commentCnt}</a>
								<a class="mt-2">댓글</a>
							</div>
							<div class="status-child d-flex flex-column justify-content-center align-items-center">
								<a  class="font-scp">${b.likeCnt}</a>
								<a class="mt-2">추천</a>
							</div>
						</div>
						<div class="d-flex flex-column justify-content-center ml-2" style="width:100%;">
							<div class="mt-1 mb-2" >
								<h4><a href="/boards/${b.id}">${b.title}</a></h4>
							</div>
							<div class="d-flex flex-wrap">
								<div class="flex-wrap" style="flex:1;">
								<c:forEach items="${b.tagList}" var="t">
									<a href="/tags/${t.tagName}" class="badge badge-secondary">
												${t.tagName} 
									</a>
								</c:forEach>
								</div>
								<div class="d-flex justify-content-end flex-wrap" style="flex:1;">
									<a href="/users/${b.writerId}">${b.user.nickname}</a>
									<a class="date-time ml-2">${b.formatTime}</a>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</c:otherwise>
		</c:choose>	
		<h1 style="font-size:20px; font-weight:bold; margin-bottom:10px;">
			태그 라이브러리
		</h1>
		<div class="row m-0 mb-4 " >		
			<div class="col p-1">
				<c:choose>
					<c:when test="${empty TAGLIST}">
						<p style="padding:20px;font-size:20px;">등록된 태그들이 없습니다.😥 </p>
					</c:when>
					<c:otherwise>	
						<c:forEach items="${TAGLIST}" var="t">			
							<a href="/tags/${t.tagName}" class="badge badge-primary m-1 mb-2" style="font-size:16px;">
								${t.tagName} 
								<span class="badge badge-light">${t.total }</span>
							</a>						
						</c:forEach>
					</c:otherwise>
				</c:choose>			
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/layout/script.jsp"%>
</body>
</html>