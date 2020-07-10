<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/layout/head.jsp"%>
<link href="${pageContext.request.contextPath}/assets/css/sign-form.css"
	rel="stylesheet">
<title>방송대 커뮤니티 - 게시물 작성</title>
</head>
<body>
	<!-- 현재 유저의 아이디와 페스에 해당하는 아이디가 일치하지 않으면 리다이렉트 시킴  -->
	<c:if test="${empty ACCOUNT}">
		<c:redirect url="/" />
	</c:if>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/nav.jsp"%>
	<section class="container d-flex justify-content-center mb-5">

		<div class="card shadow2" style="width: 100%;">
			<div class="card-header media"
				style="border-bottom: 1px dotted #E6E6E6;">
				<img class="align-self-start mr-3" src="/images/${ACCOUNT.image}"
					alt="Generic placeholder image" style="width:50px;height:50px;border-radius:2px;">
				<div class="media-body ml-0">
					<h5 class="mt-0" style="font-size:18px;">${ACCOUNT.nickname}</h5>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title mb-4">게시물 작성</h5>
				<form action="/boards" method="post" onsubmit="return init()">
					<input id="writerId" name="writerId" value="${ACCOUNT.id}"
						type="hidden"> <label>제목</label><br> <input
						id="title" name="title" placeholder="게시글의 제목을 입력해 주세요"  /> 
					<label>태그 입력</label><br> 
					<div class="mb-3">
						<input id="tagInput" class="m-0" style="width:100%;" placeholder="ex)tagname 입력 후 한칸 띄우기 "/>
						<span class="mt-2 text-primary" id="nicknameSpan">태그 입력 후 스페이스바(공백)을 눌러 등록해야합니다.</span>
					</div>
					
					<div id="tagContainer"></div>

					<label>내용 입력</label><br>
					<textarea id="boardContent" name="content" rows="10" cols="" 
					style="width: 100%; border: 1px solid #E6E6E6; border-radius: 3px;" placeholder="내용을 입력해 주세요"></textarea>


					<button id="submitBtn" class="btn btn-raised btn-primary"
						type="submit">생성</button>
				</form>
			</div>
		</div>
	</section>
	<script src="/assets/js/board-form.js"></script>
	<%@ include file="/WEB-INF/layout/script.jsp"%>
</body>
</html>