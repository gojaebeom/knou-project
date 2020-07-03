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
<title>관리자 게시글 목록</title>
</head>
<body>
	<header class="navbar navbar-expand navbar-dark flex-md-row bd-navbar bg-primary position-relative">
		<%@ include file="/WEB-INF/views/include/admin-nav.jsp"%>
	</header>
	<div class="container">
		<div class="alert alert-primary" role="alert">
			해당하는 게시물의 제목을 누르시면 게시물 상세보기를 하실 수 있습니다.
		</div>
	</div>
	<div class="container">
		<form class="d-flex flex-wrap justify-content-start align-items-end mb-5 ">
			<div class="d-flex justify-content-start align-items-end ">
				<select class="custom-select mr-2 p-1" id="inlineFormCustomSelect" style="width:120px; height:35px;">
			        <option value="1" selected>제목</option>
			        <option value="1">작성자</option>
			     </select>
				 <input type="text" class="form-control" id="inlineFormInput" placeholder="검색어를 입력하세요!">
				 <button type="button" class="btn btn-raised btn-success m-0 ml-1">검색</button>
			 </div>
		</form>
	</div>

	<div class="container border border-top-0 border-bottom-0">
		<div class="contaier pl-3 border-primary" style="font-size: 30px;">
			<div class="row justify-content-first">
				<div class="col">게시물 목록</div>
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
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" begin="0" end="5">
					<tr>
						<th scope="row">${i+1}</th>
						<td><a href="/admin/boards/${i}">제목입니다!</a></td>
						<td>Otto</td>
						<td>@mdo</td>
						<td>
							<form method="post">
								<div class="checkbox d-flex justify-content-start align-items-center">
									<label><input type="checkbox" name="delete-checks" value=""></label>
								</div>
							</form>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<br>
	<br>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>


	<%@ include file="/WEB-INF/views/include/script.jsp"%>
	<script
		src="${pageContext.request.contextPath}/assets/js/profile-menu.js"></script>
</body>
</html>