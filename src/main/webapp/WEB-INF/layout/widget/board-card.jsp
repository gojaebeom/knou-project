<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="card shadow2" style="width:100%;">
	<div class="card-header media" style="border-bottom:1px dotted #F2F2F2;">
		<img class="align-self-start mr-1" src="/images/${(!empty BOARD.user.image)?BOARD.user.image:'default.png'}"
			alt="Generic placeholder image" style="width:50px;height:50px;border-radius:2px;">
		<div class="media-body ml-0">
			<h4 class="mt-0"><a class="board-nickname" href="/users/${BOARD.writerId}">${BOARD.user.nickname}</a></h4>
		</div>
	</div>
	<div class="card-body">
		<h5 class="card-title">${BOARD.title}</h5>
		<h6 class="card-subtitle mb-2 text-muted pt-1">
		<fmt:formatDate value="${BOARD.createdAt}" pattern="yy-MM-dd / hh시 mm분"/>
		</h6>
		<br>
		<pre 
		style="overflow:auto;white-space:pre-wrap;padding:10px 0px;
		line-height:1.3em;font-size:18px;color:#585858;">${BOARD.content}</pre>

		<div class="row m-0 mt-5">
			<c:choose>
				<c:when test="${empty BOARD.tagList}">
					<p style="padding:5px;font-size:18px;">등록된 태그들이 없습니다.😥 </p>
				</c:when>
				<c:otherwise>	
					<c:forEach items="${BOARD.tagList}" var="t">			
						<a href="/tags/${t.tagName}" class="badge badge-secondary mr-1 mb-1">
							${t.tagName} 
						</a>		
					</c:forEach>
				</c:otherwise>
			</c:choose>	
			<c:if test="${ACCOUNT.id == BOARD.writerId }">
				<div class="container d-flex justify-content-end">
					<button type="button" class="btn btn-outline-success" onclick="location.href='/boards/${BOARD.id}/edit'">수정</button>
					<button type="button" class="btn btn-outline-warning ml-3" data-toggle="modal" data-target="#board-delete-modal">삭제</button>
				</div>
			</c:if>
		</div>
	</div>	
</div>
<!-- 게시물 삭제 모달 -->
<%@ include file="/WEB-INF/layout/modal/board-delete-modal.jsp"%>
