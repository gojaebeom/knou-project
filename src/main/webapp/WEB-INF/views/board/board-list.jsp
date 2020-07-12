<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/layout/head.jsp"%>
	<link href="/assets/css/profile-menu.css" rel="stylesheet">
	<title>방송대 커뮤니티 - 소통마당</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/nav.jsp"%>
	<section class="container mb-5 mt-5">
		<form action="/boards" class="mb-3">
			 <input type="text" class="hover-shadow" id="inlineFormInput" name="query" value="${QUERY}" 
			 	placeholder="제목 또는 회원이름으로 게시물을 검색하세요 ✔ "
		 		style="width:100%;border:none;border-radius:2px;padding:15px;">
			 <input type="hidden" name="page" value="${PAGE}">
		</form>

		<div class="row">
			<div class="col-12">
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:10px;">
					게시물 목록 / ${TOTAL}
				</h1>
				<!-- header -->
				<%@ include file="/WEB-INF/layout/widget/board-list-card.jsp"%>
			</div>
		</div>
		<br>
		<br>
		<nav aria-label="Page navigation example">
			<c:set var="STARTPAGE" value="${PAGE-(PAGE-1)%5}"/>
			<ul class="pagination justify-content-center">
				<c:if test="${STARTPAGE-5 >= 1 }">
					<li class="page-item"><a class="page-link" 
					href="/boards?page=${STARTPAGE-5}&query=${QUERY}">Previous</a></li>	
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(STARTPAGE+i) <= LASTPAGE}">
						<li class="page-item"><a class="page-link" style="${PAGE == (STARTPAGE+i)? 'color:green;':'color:gray;'}"
						href="/boards?page=${STARTPAGE+i}&query=${QUERY}">${STARTPAGE + i}</a></li>
					</c:if>					
				</c:forEach>
				<c:if test="${STARTPAGE+5 <= LASTPAGE }">
					<li class="page-item"><a class="page-link" 
					href="/boards?page=${STARTPAGE+5}&query=${QUERY}">Next</a></li>
				</c:if>	
			</ul>
		</nav>
	</section>
	
	<%@ include file="/WEB-INF/layout/script.jsp"%>
</body>
</html>