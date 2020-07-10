<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/layout/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/profile-menu.css" rel="stylesheet">
	<title>방송대 커뮤니티 - 게시물 상세정보</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/nav.jsp"%>
	
	<div class="container">
		<div class="alert alert-primary alert-dismissible fade show" role="alert" style="line-height:1.3em;">
			<span style="font-weight:bold;color:#0B614B;">${BOARD.user.nickname}</span>님의 게시글입니다. 타인을 배려하는 건전한 커뮤니티가 형성될 수 있도록 부탁드립니다 ᓚᘏᗢ
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    	<span aria-hidden="true">&times;</span>
		    </button>
		</div>
	</div>
	<section class="container mb-5">
	
		<!-- 게시물 카드 위젯 -->
		<%@ include file="/WEB-INF/layout//widget/board-card.jsp"%>
		
		<!-- 게시물 카드 위젯 -->
		<%@ include file="/WEB-INF/layout//widget/board-status.jsp"%>
		
		<!-- 댓글  위젯 -->
		<%@ include file="/WEB-INF/layout//widget/comment.jsp"%>
	</section>
	
	<script src="/assets/js/comment-update.js"></script>
	<script src="/assets/js/comment-delete.js"></script>
	<script src="/assets/js/comment-post.js"></script>
	<%@ include file="/WEB-INF/layout/script.jsp"%>
	<script src="/assets/js/like-update.js"></script>
</body>
</html>