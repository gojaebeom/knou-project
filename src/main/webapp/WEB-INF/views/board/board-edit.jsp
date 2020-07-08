<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link href="${pageContext.request.contextPath}/assets/css/sign-form.css"
	rel="stylesheet">
<title>방송대 커뮤니티 - 게시물 수정</title>
</head>
<body>
	<!-- 현재 유저의 아이디와 페스에 해당하는 아이디가 일치하지 않으면 리다이렉트 시킴  -->
	<c:if test="${empty ACCOUNT}">
		<c:redirect url="/" />
	</c:if>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<section class="container d-flex justify-content-center">

		<div class="card shadow2" style="width: 100%;">
			<div class="card-header media"
				style="border-bottom: 1px solid #E6E6E6;">
				<img class="align-self-start mr-3" src="/images/${ACCOUNT.image}"
					alt="Generic placeholder image" style="width:50px;height:50px;border-radius:2px;">
				<div class="media-body ml-0">
					<h5 class="mt-0" style="font-size:18px;">${ACCOUNT.nickname}</h5>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title mb-4">게시물 수정</h5>
				<form action="/boards/${BOARD.id}" method="post" onsubmit="return init()">
					<input type="hidden" name="_method" value="put" />
					
					<input name="id" value="${BOARD.id}">
					
					<input id="writerId" name="writerId" value="${ACCOUNT.id}"
						type="hidden"> <label>제목</label><br> <input
						id="title" name="title" placeholder="게시글의 제목을 입력해주세요" value="${BOARD.title}"/> 
					<label>태그 입력</label><br> 
					<div class="mb-3">
						<input id="tagInput" class="m-0" style="width:100%;" placeholder="태그는 쉼표(,) 로 구분하여 입력 해주세요"/>
					</div>
					
					<div id="tagContainer">
						 <c:forEach items="${BOARD.tagList}" var="t" >
						 	<span class="badge badge-secondary p-2" data-id="${t.id}" data-value="${t.tagName}" 
			               		 onclick="deleteTag(this);" style="cursor:pointer;">${t.tagName} x
			                	<input type="hidden" id="tags" name="tags" value="${t.tagName}"></input>
							</span>
						</c:forEach>
					</div>

					<label>내용 입력</label><br>
					<textarea id="boardContent" name="content" rows="10" cols="" 
					style="width: 100%; border: 1px solid #E6E6E6; border-radius: 3px;" placeholder="내용을 입력 해주세요">${BOARD.content}</textarea>


					<button id="submitBtn" class="btn btn-raised btn-primary"
						type="submit">수정</button>
				</form>
			</div>
		</div>
	</section>
	<script src="/assets/js/board-edit.js"></script>
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
</body>
</html>