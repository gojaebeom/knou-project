<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/profile-menu.css" rel="stylesheet">
	<title>방송대 커뮤니티 - 학우마당</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<section class="container mt-5 mb-5">
		<form action="/users" class="mb-3">
			 <input type="text" class="hover-shadow" id="inlineFormInput" name="query" value="${QUERY}" placeholder="✔ 님네임을 입력하세요!"
			 style="width:100%;border:none;border-radius:2px;padding:15px;">
			 <input name="page" type="hidden" value="${PAGE}">
		</form>
			
			<h1 style="font-size:20px; font-weight:bold; margin-bottom:20px;">
				방송대 학우들 / ${TOTAL }
			</h1>
			<div class="shadow2 card">
			<c:choose>
				<c:when test="${empty USERLIST}">
					<p style="padding:20px;font-size:20px;">학우들이 존재하지 않습니다.😥 <a href="/users?page=1&field=title&query">목록으로 돌아가기</a> </p>
				</c:when>
				<c:otherwise>
					<div class="row">
					<c:forEach items="${USERLIST}" var="u">
						<div class="col-xl-4 col-md-6">
							<div class="media p-2 m-3">
							 <img class="mr-3 rounded" 
							  src="/images/${(!empty u.image)?u.image:'default.png'}" width="64px" height="64px"
							   alt="Generic placeholder image">
							  <div class="media-body">
							    <h4 class="mt-0"><a href="/users/${u.id}">${u.nickname}</a> </h4>
							    ${u.email}
							  </div>
							</div>
						</div>
					</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
		<br>
		<br>
		<nav aria-label="Page navigation example">
			<c:set var="STARTPAGE" value="${PAGE-(PAGE-1)%5}"/>
			<ul class="pagination justify-content-center">
				<c:if test="${STARTPAGE-5 >= 1 }">
					<li class="page-item disabled"><a class="page-link" 
					href="/users?page=${STARTPAGE-5}&query=${QUERY}" tabindex="-1">Previous</a></li>	
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(STARTPAGE+i) <= LASTPAGE}">
						<li class="page-item"><a class="page-link" style="${PAGE == (STARTPAGE+i)? 'color:green;':'color:gray;'}"
						href="/users?page=${STARTPAGE+i}&query=${QUERY}">${STARTPAGE + i}</a></li>
					</c:if>					
				</c:forEach>
				<c:if test="${STARTPAGE+5 <= LASTPAGE }">
					<li class="page-item"><a class="page-link" 
					href="/users?page=${STARTPAGE+5}&query=${QUERY}">Next</a></li>
				</c:if>	
			</ul>
		</nav>
	</section>	
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>