<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="/assets/css/profile-menu.css" rel="stylesheet">
	<link href="/assets/css/board-list.css" rel="stylesheet">
	<title>방송대 커뮤니티 - 소통마당</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<section class="container mb-5">
		<form action="/boards" class="mb-3">
			<select name="field" class="custom-select mr-2 p-1" id="inlineFormCustomSelect" style="width:120px; height:35px;">
		        <option value="title" ${(FIELD == "title")? "selected" : null}>제목</option>
		        <option value="nickname" ${(FIELD == "nickname") ? "selected" : null}>작성자</option>
		     </select>
			 <input type="text" class="hover-shadow" id="inlineFormInput" name="query" value="${QUERY}" 
			 	placeholder="✔ 제목 또는 회원명으로 게시물을 검색하세요"
		 		style="width:100%;border:none;border-radius:2px;padding:15px;">
			 <input type="hidden" name="page" value="${PAGE}">
		</form>

		<div class="row">
			<div class="col-12">
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:20px;">
					게시물 목록 / ${TOTAL }
				</h1>
				<div class="shadow2 card">
				<c:choose>
					<c:when test="${empty BOARDLIST}">
						<p style="padding:20px;font-size:20px;">등록된 게시물이 없습니다.😥 <a href="/boards?page=1&field=title&query">목록으로 돌아가기</a> </p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${BOARDLIST}" var="b">
	
							<div class="list-wrap d-flex p-3">
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
										<h4><a href="/boards/${b.id}">#${b.title}</a></h4>
									</div>
									<div class="d-flex flex-wrap">
										<div class="flex-wrap" style="flex:1;">
										<c:forEach items="${b.tagList}" var="t">
											<a href="/tags?tag-name=${t.tagName}" class="badge badge-secondary">
												${t.tagName} 
											</a>
										</c:forEach>
										</div>
										<div class="d-flex justify-content-end flex-wrap" style="flex:1;">
											<a href="/users/${b.writerId}">${b.user.nickname}</a>
											<a class="ml-2"><fmt:formatDate value="${b.createdAt }" pattern="yyyy-MM-dd hh:mm"/></a>
										</div>
									</div>
								</div>
							</div>
	
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
		<br>
		<br>
		<nav aria-label="Page navigation example">
			<c:set var="STARTPAGE" value="${PAGE-(PAGE-1)%5}"/>
			<ul class="pagination justify-content-center">
				<c:if test="${STARTPAGE-5 >= 1 }">
					<li class="page-item"><a class="page-link" 
					href="/boards?page=${STARTPAGE-5}&field=${FIELD}&query=${QUERY}">Previous</a></li>	
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(STARTPAGE+i) <= LASTPAGE}">
						<li class="page-item"><a class="page-link" style="${PAGE == (STARTPAGE+i)? 'color:green;':'color:gray;'}"
						href="/boards?page=${STARTPAGE+i}&field=${FIELD}&query=${QUERY}">${STARTPAGE + i}</a></li>
					</c:if>					
				</c:forEach>
				<c:if test="${STARTPAGE+5 <= LASTPAGE }">
					<li class="page-item"><a class="page-link" 
					href="/boards?page=${STARTPAGE+5}&field=${FIELD}&query=${QUERY}">Next</a></li>
				</c:if>	
			</ul>
		</nav>
	</section>
	
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>