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
	<div class="container">
		<div class="alert alert-primary" role="alert">
			1번 id의  게시글 상세정보 페이지 입니다.
		</div>
	</div>
	<section class="container mb-5">
		<div class="card" style="width:100%;">
			<div class="card-header media">
				<img class="align-self-start mr-3" src="/images/${(!empty BOARD.user.image)?BOARD.user.image:'default.png'}"
					alt="Generic placeholder image" style="width:50px;height:50px;border-radius:2px;">
				<div class="media-body ml-0">
					<h4 class="mt-0">${BOARD.user.nickname}</h4>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">${BOARD.title}</h5>
				<h6 class="card-subtitle mb-2 text-muted pt-1"><fmt:formatDate value="${BOARD.createdAt}" pattern="yyyy-MM-dd"/></h6>
				<br>
				<pre style="overflow:auto;white-space:pre-wrap;padding:10px 0px;line-height:1.3em;font-size:18px;">${BOARD.content}</pre>

				<div class="row m-0 mt-5">
					<c:choose>
						<c:when test="${empty BOARD.tagList}">
							<p style="padding:5px;font-size:18px;">등록된 태그들이 없습니다.😥 </p>
						</c:when>
						<c:otherwise>	
							<c:forEach items="${BOARD.tagList}" var="t">			
								
								<span class="badge
								 badge-${(t.total > 2)?'primary':'success'} 
								 p-2 m-1 mb-2">
								 	<a href="#" style="color:white;text-decoration:none;">
								 		${t.tagName}
								 	</a>
								</span>				
									
							</c:forEach>
						</c:otherwise>
					</c:choose>	
				</div>

				<c:if test="${ACCOUNT.id == BOARD.writerId }">
					<div class="container d-flex justify-content-end">
						<button type="button" class="btn btn-outline-success" onclick="location.href='/boards/${BOARD.id}/edit'">수정</button>
						<button type="button" class="btn btn-outline-warning ml-3" data-toggle="modal" data-target="#board-delete-modal">삭제</button>
					</div>
				</c:if>
			</div>
			<div class="card-footer d-flex justify-content-center align-items-center">
			    <fieldset id="likeStatus" class="mr-2">
					<span class="btn-group-sm">
					  <button type="button" class="btn btn-secondary bmd-btn-fab" onclick="likeUpdate();">
					  		<i class="material-icons">grade</i>
					  </button>
					</span>
				</fieldset>
				<div class="pb-1">
					<span style="font-size:20px;">
						<a id="likeWrap" href="#">${BOARD.likeCnt}</a> 
						개의 추천별을 받았습니다😎  ${BOARD.like.userId}
					</span> 
					<input id="likeCheckInput" type="hidden" data-account="${(!empty ACCOUNT)?ACCOUNT.id:0}" data-board="${BOARD.id}">
				</div>
		  	</div>
		</div>
	<div class="container">
		<div class="row">
			<div class="col text-left"><button type="button" class="btn btn-primary">다음 게시물</button></div>
			<div class="col text-right"><button type="button" class="btn btn-primary">이전 게시물</button></div>
		</div>
	</div>
	<div class="card" style="width:100%;">
		<div class="card-header">
		    댓글
	  	</div>
	  	<ul class="list-group list-group-flush" >
	  		<li class="list-group-item">
				<div class="media" style="width:100%;">
				  <img class="mr-3" src="/images/${(!empty ACCOUNT.image)?ACCOUNT.image:'default.png'}"
				    style="width:54px;height:54px;border-radius:5px;">
				  <div class="media-body" style="width:100%;">
				    <form style="width:100%;">
				    	<input id="writerId" type="hidden" value="${ACCOUNT.id}">
				    	<input id="boardId" type="hidden" value="${BOARD.id}">
				    	<textarea id="commentContent" rows="3" cols="" style="width:100%;border:2px solid #E6E6E6;border-bottom:none;margin-bottom:-1px;
				    	border-top-left-radius:3px;border-top-right-radius:3px;"></textarea>
				    	<button type="button" id="commentPostBtn" style="width:100%;height:40px;border:2px solid #E6E6E6;
				    	border-bottom-left-radius:3px;border-bottom-right-radius:3px;margin:0px;z-index:5;">POST</button>
				    </form>
				  </div>
				</div>
			</li>
	  	</ul>
		<ul id="commentWrap" class="list-group list-group-flush" >
			<c:choose>
				<c:when test="${empty COMMENT}">
					<li class="list-group-item" style="width:100%;">		
						<div class="alert alert-warning m-0" style="width:100%;" role="alert">
						  	첫번째 댓글을 달아보세요😘	
						</div>			
					</li>
				</c:when>
				<c:otherwise>
				<c:forEach items="${COMMENT}" var="c">
					<li class="list-group-item">
						<div class="media">
						  <img class="mr-3" src="/images/${(!empty c.user.image)?c.user.image:'default.png'}"
						    style="width:54px;height:54px;border-radius:5px;">
						  <div class="media-body" style="line-height:1.3em;">
						    <h5 class="mt-0 mb-2">
							    <a href="/users/${c.writerId}">${c.user.nickname} • <fmt:formatDate value="${c.createdAt}" pattern="yyyy-MM-dd"/> </a>
						    </h5>
						    	<pre style="overflow:auto;white-space:pre-wrap;padding:10px 0px;line-height:1.3em;">${c.content }</pre> 
						    	<c:if test="${ACCOUNT.id == c.writerId}">
						    		&nbsp;&nbsp;
						    		<a href="#"  data-id="${c.id}" data-content="${c.content}" data-id2="${c.boardId}"
						    		 onclick="updateComment(this.dataset)">수정</a>
						    		&nbsp;
						    		<a href="#" data-id="${c.id}" data-id2="${c.boardId}" data-toggle="modal"
						    		 data-target="#comment-delete-modal" onclick="deleteComment(this.dataset);">삭제</a>
						    	</c:if>
						  </div>
						</div>
					</li>
				</c:forEach>
			</c:otherwise>
			</c:choose>
	 	</ul>
	</div>
	</section>
	<%@ include file="/WEB-INF/views/include/modal/board-delete-modal.jsp"%>
	
	
	<script src="/assets/js/comment-update.js"></script>
	<script src="/assets/js/comment-delete.js"></script>
	<script src="/assets/js/comment-post.js"></script>
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
	<script src="/assets/js/like-update.js"></script>
</body>
</html>