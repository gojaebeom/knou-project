<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/layout/head.jsp"%>
	<link href="/assets/css/profile-menu.css" rel="stylesheet">
	<title>방송대 커뮤니티 </title>
</head>
<body>
	
	<!-- header -->
	<%@ include file="/WEB-INF/layout/nav.jsp"%>

	<section class="container">
		<div class="row">
			<div class="col-xl-9 .col-lg-8 col-md-12 col-sm-12 order-1">
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:10px;">
					최근 게시물
				</h1>
				<!-- 보드리스트 카드 위젯-->
				<%@ include file="/WEB-INF/layout/widget/board-list-card.jsp"%>
			
				<div class="d-flex justify-content-end">
					<button type="button" class="btn btn-primary" onclick="location.href='/boards'">전체 보기</button>
				</div>
					
				<!-- 태그 라이브러리 위젯 -->
				<%@ include file="/WEB-INF/layout/widget/tag-lib.jsp"%>
			</div>
			
			<div class="col-xl-3 .col-lg-4 col-md-12 col-sm-12">
				<!-- 프로필 카드 위젯-->
				<%@ include file="/WEB-INF/layout/widget/profile-card.jsp"%>	
			</div>
		</div>
	</section>
	
	<c:if test="${USER_UPDATE == true}">
		<script type="text/javascript">alert("업데이트가 성공적으로 완료되었습니다.");</script>
	</c:if>
	<c:if test="${USER_DELETE == true}">
		<script type="text/javascript">alert("회원 탈퇴가 완료되었습니다.");</script>
	</c:if>
	<c:if test="${COMMENT_DELETE == true}">
		<script type="text/javascript">alert("댓글 삭제가 완료되었습니다.");</script>
	</c:if>
	<c:if test="${BOARD_UPDATE == true}">
		<script type="text/javascript">alert("게시물 수정이 완료되었습니다.");</script>
	</c:if>
	<c:if test="${AUTH_KEY == false }">
		<script>
			alert("만료된 인증이거나 잘못된 접근입니다😥 ");
		</script>
	</c:if>
	<c:if test="${PASSWORD_UPDATE == true }">
		<script>
			alert("비밀번호가 성공적으로 업데이트했습니다.");
		</script>
	</c:if>
	
	<footer>
		<div class="container d-flex ">
			<div class="row align-items-center" style="width:100%;">
				<div class="col-sm">
					<a class="navbar-brand p-2 font-jua mt-2 m-0" style="font-size:30px;" href="/">
						방송대 QA
					</a>
					<span class="font-jua" style="color:#585858;">Created By Gojaebeom</span>
				</div>
			</div>
		</div>
	</footer>
	<%@ include file="/WEB-INF/layout/script.jsp"%>
</body>
</html>