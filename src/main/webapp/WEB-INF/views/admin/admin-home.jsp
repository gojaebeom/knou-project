<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/layout/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/profile-menu.css" rel="stylesheet">
	<title>관리자 홈</title>
</head>
<body>
	<header class="navbar navbar-expand navbar-dark flex-md-row bd-navbar bg-primary position-relative">
		<%@ include file="/WEB-INF/layout/admin-nav.jsp"%>
	</header>
	<div class="container">
		<div class="alert alert-primary" role="alert">
			이곳은 관리자 홈입니다. 회원, 게시물, 댓글, 카테고리등의 관리를 할 수 있습니다. 
		</div>
	</div>
	<div class="container">
		<button type="button" class="btn btn-raised btn-lg" onclick="location.href='/admin/boards/create'">게시물 생성</button>
		<button type="button" class="btn btn-raised btn-lg">회원 생성</button>
	</div>

	<br>
	<br>
	<br>
	<div class="container" style="font-size: 30px;">
		<div class="row justify-content-first  pl-3 pb-3">
			<div class="col">테이블 전체 데이터</div>
		</div>
	</div>
	<div
		class="container d-flex justify-content-start border border-left-0 border-right-0">
		<div
			class="p-3 d-flex flex-column align-items-center justify-content-center"
			style="flex: 1;">
			<span style="font-size: 30px;">${total[0]}</span> <br> <span>게시물</span>
		</div>
		<div
			class="p-3 d-flex flex-column align-items-center justify-content-center"
			style="flex: 1;">
			<span style="font-size: 30px;">${total[1]}</span> <br> <span>회원</span>
		</div>
		<div
			class="p-3 d-flex flex-column align-items-center justify-content-center"
			style="flex: 1;">
			<span style="font-size: 30px;">${total[2]}</span> <br> <span>댓글</span>
		</div>
	</div>
	<br>
	<br>

	<div class="container border border-top-0 border-bottom-0">
		<div class="contaier pl-3 border-primary" style="font-size: 30px;">
			<div class="row justify-content-first">
				<div class="col">
					게시물 목록
					<button type="button" class="btn btn-raised btn-primary" onclick="location.href='/admin/boards'">전체
						보기</button>
				</div>
			</div>

		</div>
		<div class="container border-primary">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">제목</th>
						<th scope="col">생성일</th>
						<th scope="col">작성자</th>
						<th scope="col">댓글 수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="b">
					<tr>
						<th scope="row">${b.id}</th>
						<td>${b.title }</td>
						<td>${b.createdAt }</td>
						<td>${b.user.nickName }</td>
						<td>${b.commentCnt }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<br>
	<br>
	
	<%@ include file="/WEB-INF/layout/script.jsp"%>
	<script src="${pageContext.request.contextPath}/assets/js/profile-menu.js"></script>
</body>
</html>