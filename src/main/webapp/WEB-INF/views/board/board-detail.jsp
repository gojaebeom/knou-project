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
			<div class="card-body">
				<h5 class="card-title">${BOARD.title}</h5>
				<h6 class="card-subtitle mb-2 text-muted pt-1">${BOARD.user.nickname}</h6>
				<h6 class="card-subtitle mb-2 text-muted pt-1"><fmt:formatDate value="${BOARD.createdAt}" pattern="yyyy-MM-dd"/></h6>
				<br>
				<textarea rows="5" cols="" style="width:100%;border:none;font-size:16px;padding:20px;" disabled="disabled">${BOARD.content}</textarea>
		
				
				<c:if test="${ACCOUNT.id == BOARD.writerId }">
					<div class="container pt-5 d-flex justify-content-end">
						<button type="button" class="btn btn-outline-success" onclick="location.href='/admin/boards/${1}/edit'">수정</button>
						<button type="button" class="btn btn-outline-warning ml-3" data-toggle="modal" data-target="#delete-modal">삭제</button>
					</div>
					<!-- Destroy Modal -->
					<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">1번 게시물 삭제</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					         	해당 게시물을 삭제시 관련된 30개의 댓글도 같이 삭제됩니다. 그래도 진행하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary">네, 삭제하겠습니다!</button>
					      </div>
					    </div>
					  </div>
					</div>
				</c:if>
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
				  <img class="mr-3" src="/assets/imgs/user-profile/${(!empty ACCOUNT.image)?ACCOUNT.image:'default.png'}"
				    style="width:54px;height:54px;border-radius:5px;">
				  <div class="media-body" style="width:100%;">
				    <form style="width:100%;">
				    	<input id="writerId" type="hidden" value="${ACCOUNT.id}">
				    	<input id="boardId" type="hidden" value="${BOARD.id}">
				    	<textarea id="commentContent" rows="5" cols="" style="width:100%;border:2px solid #E6E6E6;border-bottom:none;margin-bottom:-1px;
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
					<li class="list-group-item">
						첫번째 댓글을 달아보세요😘					
					</li>
				</c:when>
				<c:otherwise>
				<c:forEach items="${COMMENT}" var="c">
					<li class="list-group-item">
						<div class="media">
						  <img class="mr-3" src="/images/${(!empty c.user.image)?c.user.image:'default.png'}"
						    style="width:54px;height:54px;border-radius:5px;">
						  <div class="media-body">
						    <h5 class="mt-0"><a href="#">${c.user.nickname } • ${c.createdAt }</a></h5>
						    <br>
						    	${c.content }
						    	${pageContext.request.contextPath}
						  </div>
						</div>
					</li>
				</c:forEach>
			</c:otherwise>
			</c:choose>
	 	</ul>
	</div>
	</section>
	<script src="/assets/js/comment-post.js"></script>
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>