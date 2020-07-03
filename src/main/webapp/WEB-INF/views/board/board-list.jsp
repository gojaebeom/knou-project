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
	<section class="container mb-5">
		<div class="alert alert-primary" role="alert">
			해당하는 게시물의 제목을 누르시면 게시물 상세보기를 하실 수 있습니다.
		</div>
		<form action="/boards" class="d-flex flex-wrap justify-content-start align-items-end mb-5 ">
			<div class="d-flex justify-content-start align-items-end ">
				<select name="field" class="custom-select mr-2 p-1" id="inlineFormCustomSelect" style="width:120px; height:35px;">
			        <option value="title" ${(FIELD == "title")? "selected" : null}>제목</option>
			        <option value="nickname" ${(FIELD == "nickname") ? "selected" : null}>작성자</option>
			     </select>
				 <input type="text" class="form-control" id="inlineFormInput" name="query" value="${QUERY}" placeholder="검색어를 입력하세요!">
				 <input type="hidden" name="page" value="${PAGE}">
				 <button type="submit" class="btn btn-raised btn-success m-0 ml-1">검색</button>
			 </div>
		</form>

		<div class="row">
			<div class="col-12">
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:20px;">
					최근 게시물
				</h1>
				<div class="card">
				<c:choose>
					<c:when test="${empty BOARDLIST}">
						<p style="padding:20px;font-size:20px;">등록된 게시물이 없습니다.😥 <a href="/boards?page=1&field=title&query">목록으로 돌아가기</a> </p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${BOARDLIST}" var="b">
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
			</div>
		</div>
		<br>
		<br>
		<nav aria-label="Page navigation example">
			<c:set var="STARTPAGE" value="${PAGE-(PAGE-1)%5}"/>
			<ul class="pagination justify-content-center">
				<c:if test="${STARTPAGE-5 >= 1 }">
					<li class="page-item disabled"><a class="page-link" 
					href="/boards?page=${STARTPAGE-5}&field=${FIELD}&query=${QUERY}" tabindex="-1">Previous</a></li>	
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