<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/layout/head.jsp"%>
<link
	href="assets/css/profile-menu.css"
	rel="stylesheet">
<title>관리자 홈</title>
</head>
<body>
	<header class="navbar navbar-expand navbar-dark flex-md-row bd-navbar bg-primary position-relative">
		<%@ include file="/WEB-INF/layout/admin-nav.jsp"%>
	</header>
	<div class="container">
		<div class="alert alert-primary" role="alert">
			게시물 생성 페이지 입니다.
		</div>
	</div>

	<div class="container">
		<div class="card" style="width:100%;">
			
			<div class="card-body">
				<h5 class="card-title">게시물 생성</h5>
				<form action="/admin/boards/create" method="post">
					<div class="row">
						<div class="col"><label>게시물 제목</label></div>
					</div>
					<br>
					<div class="row">
						<div class="col"><input style="width:100%;" name="title"></div>
					</div>
					<br>
					<div class="row">
						<div class="col"><label>게시물 내용</label></div>
					</div>
					<br>
					<div class="row">
						<div class="col"><textarea style="width:100%;" name="content" rows="10" cols=""></textarea></div>
					</div>
					<br>
					<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#create-modal">생성</button>
					
					<!-- create Modal -->
					<div class="modal fade" id="create-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">게시물 생성</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					         	게시물을 생성하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="submit" class="btn btn-primary">네, 생성합니다.</button>
					      </div>
					    </div>
					  </div>
					</div>
				</form>
			</div>
		</div>
		
	</div>

	
	


	<%@ include file="/WEB-INF/layout/script.jsp"%>
	<script
		src="${pageContext.request.contextPath}/assets/js/profile-menu.js"></script>
</body>
</html>