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
		<form action="/tags" class="mb-3">
			 <input type="text" class="hover-shadow" id="inlineFormInput" name="like" value="${TAGNAME}" 
			 placeholder="입력한 언어를 포함하는 태그들을 모두 검색합니다 ✔ "
			 style="width:100%;border:none;border-radius:2px;padding:15px;">
		</form>
		<c:choose>
			<c:when test="${empty BOARDLIST}">
				<c:if test="${!empty TAGNAME}">
					<p style="padding:20px;font-size:20px;margin-bottom:10px;">검색 결과가 없습니다..😥</p>
				</c:if>
			</c:when>
			<c:otherwise>
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:10px;">
					${TAGNAME}에 대한 검색 결과  ${TOTAL} 건
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
		<!-- 태그 라이브러리 위젯 -->
		<%@ include file="/WEB-INF/layout/widget/tag-lib.jsp"%>
	</section>
	<%@ include file="/WEB-INF/layout/script.jsp"%>
</body>
</html>