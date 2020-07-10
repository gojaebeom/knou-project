<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/layout/head.jsp"%>
	<title>방송대 커뮤니티 - 학우정보</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/nav.jsp"%>
	<section class="container">
		<div class="card shadow">
	  		<div class="card-body">
				<div class="row mb-5">
					<div class="col">	
						<div class="media">
						  <img  class="mr-2 rounded" src="/images/${(!empty USER.image)?USER.image:'default.png'}"
						   alt="Generic placeholder image" width="120px" height="120px">
						  <div class="media-body">
						    	<h4 class="mt-0" style="font-size:20px;">${USER.nickname }</h4>
						    	<br>
						    	<h5>${USER.email}</h5>
						    	<br>
						    	<h5>가입일 :<fmt:formatDate value="${USER.createdAt}" pattern="yyyy년 MM월 dd일"/></h5>
						     	<br>
						     	<br>
						     	<c:if test="${ACCOUNT.id == USER.id || ACCOUNT.role == 1}">
						     		<a href="/users/${USER.id}/edit">개인 정보 수정</a>
						     	</c:if>
						  </div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-6 col-lg-6 col-sm-12">
						<h4 class="mb-1">작성한 글&nbsp;&nbsp;[<a href="/users/${USER.id}/questions">전체보기</a>]</h4>
						<table class="table table-sm">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col" colspan="2">제목</th>
						      <th scope="col">작성일</th>
						    </tr>
						  </thead>	  
						  <tbody>
						  	<c:choose>
						  		<c:when test="${empty QUESTIONLIST}">
						  			<tr>
						  				<td colspan="3">작성된 글이 없습니다 😅</td>
						  			</tr>
						  		</c:when>
						  		<c:otherwise>
						  			
						  			<c:forEach items="${QUESTIONLIST}" var="q" begin="0" end="4" varStatus="status">
									    <tr>
									      <th scope="row">${status.count}</th>
									      <td colspan="2">
									      	<a href="/boards/${q.id}">
									      		${q.title }
									      	</a>
									      </td>
									      <td><fmt:formatDate value="${q.createdAt}" pattern="yyyy-MM-dd"/></td>
									    </tr>
									 </c:forEach>
									 
						  		</c:otherwise>
						  	</c:choose>
						  	</tbody>
						</table>
					</div>
					<div class="col-xl-6 col-lg-6 col-sm-12">
						<h4 class="mb-1">답변한 글&nbsp;&nbsp;[<a href="/users/${USER.id}/answers">전체보기</a>]</h4>
						<table class="table table-sm">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col" colspan="2">제목</th>
						      <th scope="col">작성일</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:choose>
						  		<c:when test="${empty ANSWERLIST}">
									<tr>
										<td colspan="3">작성된 글이 없습니다 😅</td>
									</tr>	
						  		</c:when>
						  		<c:otherwise>
						  			<c:forEach items="${ANSWERLIST}" var="a" begin="0" end="4" varStatus="status">
									    <tr>
									      <th scope="row">${status.count}</th>
									      <td colspan="2">
									      	<a href="/boards/${a.board.id}">
									      		${a.board.title }
									      	</a>
									      </td>
									      <td><fmt:formatDate value="${a.board.createdAt}" pattern="yyyy-MM-dd"/></td>
									    </tr>
									 </c:forEach>
						  		</c:otherwise>
						  	</c:choose>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/layout/script.jsp"%>
</body>
</html>