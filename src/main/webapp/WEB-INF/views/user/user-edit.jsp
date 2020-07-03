<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/sign-form.css" rel="stylesheet">
	<title>방송대 Q&A</title>
</head>
<body>
	<!-- 현재 유저의 아이디와 페스에 해당하는 아이디가 일치하지 않으면 리다이렉트 시킴  -->
	<c:if test="${ACCOUNT.id != USER.id}">
		<c:redirect url="/"/>
	</c:if>
	<header class="navbar navbar-expand navbar-dark bd-navbar bg-primary">
		<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	</header>
	<section class="container d-flex justify-content-center">
		<div class="row">
			<div class="col">
				<div class="card" style="width:28rem;">
				  <div class="card-body">
				  	<h5 class="card-title mb-4">회원 정보 수정</h5>
					<form action="/users/${USER.id}" method="post" onsubmit="return init()">
						<input type="hidden" name="_method" value="put" />
						<label>프로필 이미지</label>
						<div class="d-flex align-items-start mt-3">
							<img style="width:100px; height:100px; background:gray; border-radius:5px; margin-right:10px;" />
							<label for="image" style="display:flex;justify-content:center;align-items:center;
							 width:100px; height:40px; background:#04B486; color:white; border-radius:3px;cursor:pointer; margin:0px;">
								이미지 업로드
								<input type="file" id="image" name="image" style="display:none;"/>
							</label><br>
						</div>
						
						<span id="nicknameSpan"></span>
					
						<label>닉네임</label><br>
						<input id="nickname" name="nickname" value="${USER.nickname}"/>
						<span id="nicknameSpan"></span>
					
						<label>이메일</label><br>
						<input id="email" disabled value="${USER.email}"/>
						
						<label>생성일</label><br>
						<fmt:formatDate value="${USER.createdAt}" var="createdAt" pattern="yyyy-MM-dd"/>
						<input disabled value="${createdAt }"/>
						
						<label>수정일</label><br>
						<fmt:formatDate value="${USER.updatedAt}" var="updatedAt" pattern="yyyy-MM-dd"/>
						<input disabled value="${updatedAt }"/>
						
						<label>회원 탈퇴</label><br>
						<button type="button" style="width:100px; height:40px; border:none; cursor:pointer;
						border-radius:3px; background:gray; margin-top:10px; color:white;">탈퇴하기</button>
						
						<button id="submitBtn" class="btn btn-raised btn-primary" type="submit">수정</button>
						<div class="margin-box"></div>
						<span class="bottom-span"><a href="/sign-in" style="font-weight:bold">내 정보로 돌아가기😍</a></span>
					</form>
				  </div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>