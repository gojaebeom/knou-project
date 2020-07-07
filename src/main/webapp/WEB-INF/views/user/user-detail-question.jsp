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
						  <img  class="mr-3 rounded" src="/images/${(!empty USER.image)?USER.image:'default.png'}"
						   alt="Generic placeholder image" width="120px" height="120px">
						  <div class="media-body">
						    	<h4 class="mt-0">${USER.nickname }</h4>
						    	<br>
						    	<h5>${USER.email}</h5>
						    	<br>
						    	<h5>가입일 :<fmt:formatDate value="${USER.createdAt}" pattern="yyyy-MM-dd"/></h5>
						     	<br>
						     	<br>
						     	<c:if test="${ACCOUNT.id == USER.id}">
						     		<a href="/users/${USER.id}/edit">개인 정보 수정</a>
						     	</c:if>
						  </div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<h4 class="mb-1">작성한 글&nbsp;&nbsp;[${TOTAL}]&nbsp;&nbsp;<a href="/users/${USER.id}">돌아가기</a></h4>
						<table class="table table-sm">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col" colspan="2">제목</th>
						      <th scope="col">작성일</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:choose>
						  		<c:when test="${empty QUESTIONLIST}">
									<tr>
										<td colspan="3">작성된 글이 없습니다 😅</td>
									</tr>	
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${QUESTIONLIST}" var="q">
									    <tr>
									      <th scope="row">${q.id }</th>
									      <td colspan="2">
									      	<a href="/boards/${q.id}">
									      		${q.title }
									      	</a>
									      </td>
									      <td><fmt:formatDate value="${q.createdAt}" pattern="yyyy-MM-dd"/></td>
									    </tr>
									 </c:forEach>
						  		</c:otherwise>
						  	</c:choose>
						  </tbody>
						</table>
						<nav aria-label="Page navigation example">
							<c:set var="STARTPAGE" value="${PAGE-(PAGE-1)%5}"/>
							<ul class="pagination justify-content-center">
								<c:if test="${STARTPAGE-5 >= 1 }">
									<li class="page-item"><a class="page-link" 
									href="/users/${USER.id}/questions?page=${STARTPAGE-5}">Previous</a></li>	
								</c:if>
								<c:forEach var="i" begin="0" end="4">
									<c:if test="${(STARTPAGE+i) <= LASTPAGE}">
										<li class="page-item"><a class="page-link" style="${PAGE == (STARTPAGE+i)? 'color:green;':'color:gray;'}"
										href="/users/${USER.id}/questions?page=${STARTPAGE+i}">${STARTPAGE + i}</a></li>
									</c:if>					
								</c:forEach>
								<c:if test="${STARTPAGE+5 <= LASTPAGE }">
									<li class="page-item"><a class="page-link" 
									href="/users/${USER.id}/questions?page=${STARTPAGE+5}">Next</a></li>
								</c:if>	
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>