<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/layout/head.jsp"%>
	<link href="/assets/css/sign-form.css" rel="stylesheet">
	<title>방송대 커뮤니티 - 개인 정보 수정</title>
</head>
<style>
.edit-card{width:28rem;}
	
@media (max-width: 575.98px)
{  
	.edit-card{width:auto;}
}
</style>
<body>
	<!-- 현재 유저의 아이디와 페스에 해당하는 아이디가 일치하지 않으면 리다이렉트 시킴  -->
	<c:if test="${ACCOUNT.id != USER.id && ACCOUNT.role == 0}">
		<c:redirect url="/"/>
	</c:if>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/nav.jsp"%>
	<section class="container d-flex justify-content-center">
		<div class="row mb-5">
			<div class="col p-0">
				<div class="edit-card card shadow">
				  <div class="card-body">
				  	<h5 class="card-title mb-4">회원 정보 수정</h5>
					<form id="userForm" action="/users/${USER.id}" method="post" onsubmit="return init()">
						<input type="hidden" name="_method" value="put" />
						<label>프로필 이미지</label>
						<div class="d-flex align-items-start mt-3">
							<img id="userImage" style="width:100px; height:100px; border-radius:5px; margin-right:10px;"
								src="/images/${(!empty USER.image)?USER.image:'default.png' }"/>
								<label  for="imgFile" 
								style="margin:0px; padding:10px; border-radius:2px; background:#04B45F;color:white">이미지 업로드</label>
								<input type="file" id="imgFile" name="imgFile" style="display:none;">
						</div>
					
						<label>닉네임</label><br>
						<input id="nickname" name="nickname" value="${USER.nickname}"/>
						<input id="accountNickname" type="hidden" value="${USER.nickname}">
						<span id="nicknameSpan"></span>
					
						<label>이메일</label><br>
						<input id="email" disabled value="${USER.email}"/>
						
						<label>생성일</label><br>
						<fmt:formatDate value="${USER.createdAt}" var="createdAt" pattern="yyyy년 MM월 dd일"/>
						<input disabled value="${createdAt }"/>
						
						<label>수정일</label><br>
						<fmt:formatDate value="${USER.updatedAt}" var="updatedAt" pattern="yyyy년 MM월 dd일"/>
						<input disabled value="${updatedAt }"/>
						
						<label>회원 탈퇴</label><br>
						<button type="button" class="btn btn-primary mt-0 mb-4" data-toggle="modal" data-target="#deleteUser">
						  	탈퇴하기
						</button>
						
						<button id="submitBtn" class="btn btn-raised btn-primary" type="submit">수정</button>
						<div class="margin-box"></div>
						<span class="bottom-span"><a href="/users/${USER.id}" style="font-weight:bold">내 정보로 돌아가기😍</a></span>
					</form>
				  </div>
				</div>
			</div>
		</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="deleteUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	         	계정을 삭제하시겠습니까? <br>
	         	계정 삭제시 관련된 게시글, 댓글, 태그들도 함께 삭제 처리됩니다.<br>
	         	
	         	정말 삭제하시려면 <span class="badge badge-secondary">회원 탈퇴</span>입력 후 엔터를  눌러주세요😥
	      		<input id="deleteInput" style="width:100%;border:1px solid #E6E6E6; border-radius:2px;margin-top:10px;">   	
		  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <form action="/users/${USER.id}" method="post">
	        	<input type="hidden" name="_method" value="delete" />
		        <button id="deleteBtn" type="submit" 
		        class="btn btn-primary" style="display:none;">계정 삭제</button>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	<script src="/assets/js/user-img-post.js"></script>
	<script src="/assets/js/user-update-form.js"></script>
	<%@ include file="/WEB-INF/layout/script.jsp"%>
</body>
</html>