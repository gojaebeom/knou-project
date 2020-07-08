<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="/assets/css/profile-menu.css" rel="stylesheet">
	<link href="/assets/css/board-list.css" rel="stylesheet">
	<title>방송대 커뮤니티 </title>
</head>
<body>
	
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<section class="container">
		<div class="row">
			<div class="col-xl-9 .col-lg-8 col-md-12 col-sm-12">
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:20px;">
					최근 게시물
				</h1>
				<div class="card shadow2">
				<c:choose>
					<c:when test="${empty BOARDLIST}">
						<p style="padding:20px;font-size:20px;">등록된 게시물이 없습니다.😥 </p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${BOARDLIST}" var="b">
							
							<div class="list-wrap d-flex p-3">
								<div class="status-wrap d-flex justify-content-center aling-items-center" >
									<div class="status-child d-flex flex-column justify-content-center align-items-center">
										<a class="font-scp">${b.hit}</a>
										<a class="mt-2">조회</a>
									</div>
									<div class="status-child d-flex flex-column justify-content-center align-items-center">
										<a class="font-scp">${b.commentCnt}</a>
										<a class="mt-2">댓글</a>
									</div>
									<div class="status-child d-flex flex-column justify-content-center align-items-center">
										<a  class="font-scp">${b.likeCnt}</a>
										<a class="mt-2">추천</a>
									</div>
								</div>
								<div class="d-flex flex-column justify-content-center ml-2" style="width:100%;">
									<div class="mt-1 mb-2" >
										<h4><a href="/boards/${b.id}">#${b.title}</a></h4>
									</div>
									<div class="d-flex flex-wrap">
										<div class="flex-wrap" style="flex:1;">
										<c:forEach items="${b.tagList}" var="t">
											<a href="/tags?tag-name=${t.tagName}" class="badge badge-secondary">
												${t.tagName} 
											</a>
										</c:forEach>
										</div>
										<div class="d-flex justify-content-end flex-wrap" style="flex:1;">
											<a href="/users/${b.writerId}">${b.user.nickname}</a>
											<a class="ml-2"><fmt:formatDate value="${b.createdAt}" pattern="yyyy-MM-dd hh:dd"/></a>
										</div>
									</div>
								</div>
							</div>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</div>
			
				<div class="d-flex justify-content-end">
					<button type="button" class="btn btn-primary" onclick="location.href='/boards?page=1&field=title&query'">전체 보기</button>
				</div>
					
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:10px;">
					태그 모음
				</h1>

				<div class="row m-0 mb-4 " >		
					<div class="col p-1">
						<c:choose>
							<c:when test="${empty TAGLIST}">
								<p style="padding:20px;font-size:20px;">등록된 태그들이 없습니다.😥 </p>
							</c:when>
							<c:otherwise>	
								<c:forEach items="${TAGLIST}" var="t">			
									<a href="/tags?tag-name=${t.tagName}" class="badge badge-primary m-1 mb-2" style="font-size:16px;">
										${t.tagName} 
										<span class="badge badge-light">${t.total }</span>
									</a>						
									</c:forEach>
								</c:otherwise>
						</c:choose>			
					</div>
				</div>
			</div>

			
			<div class="col-xl-3 .col-lg-4 col-md-12 col-sm-12">
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:20px;">프로필</h1>		
				<div class="shadow2 card d-flex justify-content-center align-items-center p-2" style="width:100%;">
				  <img class="card-img-top" 
				  src="/images/${(!empty ACCOUNT.image)?ACCOUNT.image:'default.png'}" alt="Card image cap"
				  style="width:130px; height:130px; border-radius:100%; margin-top:20px; margin-bottom:20px; border:3px solid #E6E6E6;">	
				    <c:if test="${empty ACCOUNT}">
				    	<p class="card-text" style="text-align:center;line-height:1.2em;">로그인하여 방송대 학우들과<br> 소통하세요!🥰</p>
				    	<br>
				    	<a href="/users/sign-in" class="btn btn-primary">로그인하기</a>
				    </c:if>
				    <c:if test="${!empty ACCOUNT}">
				    	<h5 class="card-title" style="font-size:25px;"><a href="/users/${ACCOUNT.id}">${ACCOUNT.nickname}</a></h5>
				    	<p class="card-text">${ACCOUNT.email}</p>
				    	<br>
				    	<p class="card-text" style="margin:5px 0px;">오늘의 기분: 😘 </p>
						<div style="margin-top:20px; margin-bottom:10px; width:100%; text-align:center">
		    				<button type="button" class="btn btn-raised btn-success mr-3" onclick="location.href='/boards/form'">글 쓰기</button>
		    				<button type="button" class="btn btn-outline-success" onclick="location.href='/users/${ACCOUNT.id}'">내 정보</button>
		    				
						</div>
			    	</c:if>
			  </div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/script.jsp"%>
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
</body>
</html>