<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="card shadow2">
<c:choose>
	<c:when test="${empty BOARDLIST}">
		<p style="padding:20px;font-size:20px;">등록된 게시물이 없습니다.😥 </p>
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
						<h4><a class="board-title" href="/boards/${b.id}">${b.title}</a></h4>
					</div>
					<div class="d-flex flex-wrap">
						<div class="flex-wrap" style="flex:1;">
						<c:forEach items="${b.tagList}" var="t">
							<a href="/tags/${t.tagName}" class="badge badge-secondary mb-1">
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
</div>