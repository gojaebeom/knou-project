<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link
	href="${pageContext.request.contextPath}/assets/css/profile-menu.css"
	rel="stylesheet">
<title>관리자 홈</title>
</head>
<body>
	<header class="navbar navbar-expand navbar-dark flex-md-row bd-navbar bg-primary position-relative">
		<%@ include file="/WEB-INF/views/include/admin-nav.jsp"%>
	</header>
	<div class="container">
		<div class="alert alert-primary" role="alert">
			1번 id의  게시글 상세정보 페이지 입니다.
		</div>
	</div>

	<div class="container">
		<div class="card" style="width:100%;">
			<div class="card-body">
				<h5 class="card-title">Q. 게시물 제목</h5>
				<h6 class="card-subtitle mb-2 text-muted pt-1">작성자</h6>
				<h6 class="card-subtitle mb-2 text-muted pt-1">2020-06-20</h6>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.
					
				</p>
				<div class="container pt-5 d-flex justify-content-end">
					<button type="button" class="btn btn-outline-success" onclick="location.href='/admin/boards/${1}/edit'">수정</button>
					<button type="button" class="btn btn-outline-warning ml-3" data-toggle="modal" data-target="#delete-modal">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col text-left"><button type="button" class="btn btn-primary">다음 게시물</button></div>
			<div class="col text-right"><button type="button" class="btn btn-primary">이전 게시물</button></div>
		</div>
	</div>
	
	<!-- Destroy Modal -->
	<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">1번 게시물 삭제</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	         	해당 게시물을 삭제시 관련된 30개의 댓글도 같이 삭제됩니다. 그래도 진행하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">네, 삭제하겠습니다!</button>
	      </div>
	    </div>
	  </div>
	</div>


	<%@ include file="/WEB-INF/views/include/script.jsp"%>
	<script
		src="${pageContext.request.contextPath}/assets/js/profile-menu.js"></script>
</body>
</html>