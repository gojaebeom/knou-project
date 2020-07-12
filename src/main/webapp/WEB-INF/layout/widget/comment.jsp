<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 댓글 박스 -->
<div class="card shadow2" style="width:100%;">
	<div class="card-header" style="border-bottom:1px dotted #F2F2F2;">
	   <span style="font-size:18px;">댓글 ಠ_ಠ /   ${BOARD.commentCnt}</span>
  	</div>
  	<ul class="list-group list-group-flush " >
  		<li class="list-group-item p-0" style="display:flex;justify-content:center;align-items:center;">
			<div class="media" style="width:100%;margin:0px 16px;">
			  <img class="comment-writer-img mr-3" src="/images/${(!empty ACCOUNT.image)?ACCOUNT.image:'default.png'}"
			    style="width:48px;height:48px;border-radius:2px;">
			  <div class="media-body">
			    <form  style="width:100%;">
			    	<input id="writerId" type="hidden" value="${ACCOUNT.id}">
			    	<input id="boardId" type="hidden" value="${BOARD.id}">
			    	<textarea id="commentContent" rows="3" cols="" style="width:100%;border:2px solid #F2F2F2;border-bottom:none;margin-bottom:-3px;
			    	border-top-left-radius:3px;border-top-right-radius:3px;" placeholder="${(empty ACCOUNT)?'로그인 이후 댓글 작성이 가능합니다':'댓글을 작성해주세요' }"></textarea>
			    	<button type="button" id="commentPostBtn" 
			    	style="width:100%;height:40px;border:2px solid #F2F2F2;background:#F2F2F2;
			    	border-bottom-left-radius:3px;border-bottom-right-radius:3px;margin:0px;z-index:5;font-weight:bold">POST</button>
			    </form>
			  </div>
			</div>
		</li>
  	</ul>
	<ul id="commentWrap" class="list-group list-group-flush" >
		<c:choose>
			<c:when test="${empty COMMENT}">
				<li class="list-group-item" style="width:100%;">		
					  아직 댓글이 없네요. 첫번째 댓글을 달아보세요 (●'◡'●)		
				</li>
			</c:when>
			<c:otherwise>
			<c:forEach items="${COMMENT}" var="c">
				<li class="list-group-item">
					<div class="media">
					  <img class="mr-2" src="/images/${(!empty c.user.image)?c.user.image:'default.png'}"
					    style="width:54px;height:54px;border-radius:2px;">
					  <div class="media-body" style="line-height:1.3em;">
					    <h5 class="mt-0 mb-2">
						    <a href="/users/${c.writerId}" class="mr-0">
						    ${c.user.nickname}</a> 
							* ${c.formatTime}
					    </h5>
					    <pre style="overflow:auto;white-space:pre-wrap;line-height:1.3em;margin:0px;margin-bottom:5px;">${c.content }</pre> 
				    	<c:if test="${ACCOUNT.id == c.writerId || ACCOUNT.role == 1}">
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
