<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/sign-form.css" rel="stylesheet">
	<title>로그인</title>
</head>
<body>
	<!-- 현재 유저의 아이디와 페스에 해당하는 아이디가 일치하지 않으면 리다이렉트 시킴  -->
	<c:if test="${!empty ACCOUNT.id}">
		<c:redirect url="/"/>
	</c:if>
	<header class="navbar navbar-expand navbar-dark flex-md-row bd-navbar bg-primary">
		<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	</header>
	<section class="container d-flex justify-content-center">
		<div class="row">
			<div class="col">
				<div class="card" style="width:28rem;">
				  <div class="card-body">
				  	<h5 class="card-title mb-4">로그인</h5>
					<form action="/sign-in" method="post">
						<label>이메일</label><br>
						<input id="email" name="email" value="${signInfo.email}"/>
						
						<label>비밀번호</label><br>
						<input type="password" name="password" value="${signInfo.password }"/>
						<c:if test="${!empty massage}">
							<div class="alert alert-primary" role="alert">
								${massage}
							</div>
						</c:if>			
						<button class="btn btn-raised btn-primary" type="submit">로그인</button>
						<div class="margin-box"></div>
						<span class="bottom-span">계정이 없으신가요? 먼저 <a href="/sign-up" style="font-weight:bold">회원 가입</a>을 진행 하세요✔</span>
					</form>
				  </div>
				</div>
			</div>
		</div>
	</section>
	<c:if test="${loginComplete == true }">
		<script>
			alert("인증이 성공적으로 끝났습니다. 로그인하여 방송대 인들과 소통하세요🥰 ");
		</script>
	</c:if>
	<c:if test="${loginComplete == false }">
		<script>
			alert("만료된 인증이거나 잘못된 접근입니다. 기존의 아이디가 로그인이 안될 시 관리자에게 문의 주세요😥 ");
		</script>
	</c:if>
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
	<script src="${pageContext.request.contextPath}/assets/js/profile-menu.js"></script>

</body>
</html>