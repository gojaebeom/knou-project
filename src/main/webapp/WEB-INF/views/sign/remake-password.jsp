<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/layout/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/sign-form.css" rel="stylesheet">
	<title>방송대 커뮤니티 - 비밀번호 찾기</title>
</head>
<style>
.sign-card{width:28rem;}
	
@media (max-width: 575.98px)
{  
	.sign-card{width:auto;}
}
</style>
<body>
	<!-- 현재 유저의 아이디와 페스에 해당하는 아이디가 일치하지 않으면 리다이렉트 시킴  -->
	<c:if test="${!empty ACCOUNT.id}">
		<c:redirect url="/"/>
	</c:if>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/nav.jsp"%>
	<section class="container d-flex justify-content-center">
		<div class="row">
			<div class="col">
				<div class="sign-card card shadow2">
				  <div class="card-body">
				  	<h5 class="card-title mb-4">비밀번호 변경</h5>
					<form action="/users/remake-password" method="post" onsubmit="return init()">
					
						<input type="hidden" name="id" value="${ID}"/>
					
						<label>비밀번호</label><br>
						<input type="password" id="password" name="password"/>
						<span id="passwordSpan">비밀번호는 숫자 및 영문자, 특수문자를 포함한 8글자 이상이여야 합니다.</span>
						
						<label>비밀번호 확인</label><br>
						<input type="password" id="re-password"/>
						<span id="re-passwordSpan">비밀번호를 다시 입력해 주세요</span>
										
						<button id="submitBtn" type="submit" class="btn btn-raised btn-primary" >비밀번호 변경</button>
						<div class="margin-box"></div>
					</form>
				  </div>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/layout/script.jsp"%>
	<script src="/assets/js/sign-remake-password.js"></script>
</body>
</html>