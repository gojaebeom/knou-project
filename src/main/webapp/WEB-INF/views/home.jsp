<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<link href="${pageContext.request.contextPath}/assets/css/profile-menu.css" rel="stylesheet">
	<title>방송대 Q&A</title>
</head>
<body>
	<header class="navbar navbar-expand navbar-dark bd-navbar bg-primary">
		<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	</header>
	<section class="container">
		<div class="row">
			<div class="col-xl-9 .col-lg-8 col-md-12 col-sm-12">
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:20px;">
					최근 게시물
				</h1>
				<div class="card">
				<c:choose>
					<c:when test="${empty BOARDLIST}">
						<p style="padding:20px;font-size:20px;">등록된 게시물이 없습니다.😥 </p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${BOARDLIST}" var="b">
							<div class="row" style="padding:10px; margin:0px; border-bottom:1px dotted #D8D8D8;">
								<div class="col-2 d-flex justify-content-center align-items-center" style="color:#585858;">	
									<div class="d-flex flex-column justify-content-center align-items-center p-2">
										<div style="font-size:20px; margin-bottom:10px;">${b.hit}</div>
										<div><i class="ri-eye-fill"></i></div>
									</div>
									<div class="d-flex flex-column justify-content-center align-items-center p-2">
										<div style="font-size:20px; margin-bottom:10px;">${b.commentCnt }</div>
										<div><i class="ri-message-2-fill"></i></div>
									</div>
									<div class="d-flex flex-column justify-content-center align-items-center p-2">
										<div style="font-size:20px; margin-bottom:10px;">${0}</div>
										<div><i class="ri-star-line"></i></div>
									</div>
								</div>
								<div class="col-10 " style="width:100%;">
									<div class="p-0 " style="font-size:20px; margin-bottom:10px;"><a href="/boards/${b.id}">${b.title}</a></div>
									<div class="row " >
										<div class="col-7">
											<c:forEach items="${b.tagList}" var="t">
												<span class="badge badge-secondary">
													<a href="#" style="color:white;">
														${t.tagName}
													</a>
												</span>
											</c:forEach>
										</div>
										<div class="col-5 d-flex justify-content-end align-items-end">
											<a href="" style="margin-right:10px;">${b.user.nickname}</a>
											<span><fmt:formatDate value="${b.createdAt }" pattern="yyyy-MM-dd-hh-mm-ss"/></span>
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
									<span class="badge
									 badge-${(t.total > 2)?'primary':'success'} 
									 p-2 m-1 mb-2" style="font-size:16px;">
									 	<a href="#" style="color:white;text-decoration:none;">
									 		${t.tagName}
											${t.total}
									 	</a>
									</span>							
									</c:forEach>
								</c:otherwise>
						</c:choose>			
					</div>
				</div>
			</div>

			
			<div class="col-xl-3 .col-lg-4 col-md-12 col-sm-12">
				<h1 style="font-size:20px; font-weight:bold; margin-bottom:20px;">프로필</h1>		
				<div class="card d-flex justify-content-center align-items-center p-2" style="width:100%;">
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
</body>
</html>