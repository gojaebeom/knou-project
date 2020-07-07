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
					게시물 목록
				</h1>
				<div class="card">
				<c:choose>
					<c:when test="${empty BOARDLIST}">
						<p style="padding:20px;font-size:20px;">등록된 게시물이 없습니다.😥 <a href="/boards?page=1&field=title&query">목록으로 돌아가기</a> </p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${BOARDLIST}" var="b">
							<div class="row" style="padding:10px; margin:0px; border-bottom:1px dotted #D8D8D8;">
								<div class="col-2 d-flex justify-content-start align-items-center" style="color:#585858;">	
									<div class="d-flex flex-column justify-content-center align-items-center p-2">
										<div style="font-size:20px; margin-bottom:10px;">${b.hit}</div>
										<div><i class="ri-eye-fill"></i></div>
									</div>
									<div class="d-flex flex-column justify-content-center align-items-center p-2">
										<div style="font-size:20px; margin-bottom:10px;">${b.commentCnt }</div>
										<div><i class="ri-message-2-fill"></i></div>
									</div>
									<div class="d-flex flex-column justify-content-center align-items-center p-2">
										<div style="font-size:20px; margin-bottom:10px;">${b.likeCnt}</div>
										<div><i class="ri-star-line"></i></div>
									</div>
								</div>
								<div class="col-10 " style="width:100%;">
									<div class="p-0 " style="font-size:20px; margin-bottom:10px;"><a href="/boards/${b.id}">${b.title}</a></div>
									<div class="row " >
										<div class="col-7">
											<c:forEach items="${b.tagList}" var="t">
												<span class="badge badge-secondary">
													<a href="#" style="color:white;">
														${t.tagName}
													</a>
												</span>
											</c:forEach>
										</div>
										<div class="col-5 d-flex justify-content-end align-items-end">
											<a href="" style="margin-right:10px;">${b.user.nickname}</a>
											<span><fmt:formatDate value="${b.createdAt }" pattern="yyyy-MM-dd-hh-mm-ss"/></span>
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