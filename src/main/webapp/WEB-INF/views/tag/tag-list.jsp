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
	<title>방송대 커뮤니티 </title>
</head>
<body>
	
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<section class="container mt-5 mb-5">	
		<form action="/tags" class="mb-3">
			 <input type="text" class="hover-shadow" id="inlineFormInput" name="tag-like" value="${TAGNAME}" 
			 placeholder="입력한 언어를 포함하는 태그들을 모두 검색합니다 ✔ "
			 style="width:100%;border:none;border-radius:2px;padding:15px;">
		</form>
		<c:if test="${LIKE_NULL == true }">
			<h1 style="font-size:20px; font-weight:bold; margin-bottom:10px;">
				# <a href="#">${TAGNAME}</a>에 대한 검색 결과 ${TOTAL} 건
			</h1>
			<p style="padding:20px;font-size:20px;margin-bottom:20px;">태그에 관련된 글들이 없습니다..😥</p>
		</c:if>
		<c:choose>
			<c:when test="${empty BOARDLIST}">
				
			</c:when>
			<c:otherwise>
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:10px;">
					#[${TAGNAME}]에 대한 검색 결과 ${TOTAL} 건
				</h1>
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
									<a href="/users/${b.user.id}">${b.user.nickname}</a>
									<a class="ml-2"><fmt:formatDate value="${b.createdAt }" pattern="yyyy-MM-dd hh:mm"/></a>
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
							<a href="/tags?tag-name=${t.tagName}" class="badge badge-primary m-1 mb-2" style="font-size:16px;">
								${t.tagName} 
								<span class="badge badge-light">${t.total }</span>
							</a>						
						</c:forEach>
					</c:otherwise>
				</c:choose>			
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>