<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/sign-form.css" rel="stylesheet">
	<title>방송대 커뮤니티 - 회원가입</title>
</head>
<body>
	<!-- 현재 유저의 아이디와 페스에 해당하는 아이디가 일치하지 않으면 리다이렉트 시킴  -->
	<c:if test="${!empty ACCOUNT.id}">
		<c:redirect url="/"/>
	</c:if>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<section class="container d-flex justify-content-center">
		<div class="row">
			<div class="col">
				<div class="card shadow2" style="width:28rem;">
				  <div class="card-body">
				  	<h5 class="card-title mb-4">계정 만들기</h5>
					<form action="/users/sign-up" method="post" onsubmit="return init()">
						<label>닉네임</label><br>
						<input id="nickname" name="nickname"/>
						<span id="nicknameSpan">이름 또는 사용할 한글 닉네임을 입력해주세요.</span>
					
						<label>이메일</label><br>
						<input id="email" name="email"/>
						<span id="emailSpan">사용가능한 이메일을 입력해 주세요.</span>
						
						<label>비밀번호</label><br>
						<input id="password" type="password" name="password"/>
						<span id="passwordSpan">비밀번호는 숫자 밑 영문자를 포함한 8글자 이상이여야 합니다.</span>
										
						<button id="submitBtn" class="btn btn-raised btn-primary" type="submit">생성</button>
						<div id="submitAlert" class="alert alert-primary" role="alert" style="display:none;">
						  	이메일로 인증메일을 발송중입니다. 잠시만 기다려 주세요!
						</div>
						<div class="margin-box"></div>
						<span class="bottom-span">이미 계정을 가지고 계신가요? 바로 <a href="/users/sign-in" style="font-weight:bold">로그인</a> 하세요😍</span>
					</form>
				  </div>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
	<script src="${pageContext.request.contextPath}/assets/js/sign-up-validation.js"></script>
</body>
</html>