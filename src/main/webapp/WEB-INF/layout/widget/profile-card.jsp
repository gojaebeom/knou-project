<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 style="font-size:20px; font-weight:bold; margin-bottom:10px;">프로필</h1>		
<div class="shadow2 card d-flex justify-content-center align-items-center p-2 mb-4" style="width:100%;">
 	<img class="card-img-top" 
 	src="/images/${(!empty ACCOUNT.image)?ACCOUNT.image:'default.png'}" alt="Card image cap"
 	style="width:130px; height:130px; border-radius:100%; margin-top:20px; margin-bottom:20px; border:3px solid #F2F2F2;">	
   	<c:if test="${empty ACCOUNT}">
	   	<p class="card-text" style="text-align:center;line-height:1.4em;">로그인하여 방송대 학우들과<br> 소통하세요! ╰(*°▽°*)╯</p>
	   	<br>
	   	<a href="/users/sign-in" class="btn btn-primary">로그인하기</a>
   	</c:if>
   	<c:if test="${!empty ACCOUNT}">
	   	<h5 class="card-title" style="font-size:25px;"><a href="/users/${ACCOUNT.id}">${ACCOUNT.nickname}</a></h5>
	   	<p class="card-text" style="font-style:italic;">${ACCOUNT.email}</p>
		<div style="margin-top:20px; margin-bottom:10px; width:100%; text-align:center">
	 				<button type="button" style="font-weight:bold;" class="btn btn-raised btn-success mr-3" onclick="location.href='/boards/form'">글 쓰기</button>
	 				<button type="button" style="font-weight:bold;" class="btn btn-outline-success" onclick="location.href='/users/${ACCOUNT.id}'">내 정보</button>
		</div>
		<div class="alert alert-primary alert-dismissible fade show m-0" role="alert" style="line-height:1.3em;border-radius:2px;">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    	<span aria-hidden="true">&times;</span>
		    </button>
			<span style="font-weight:bold;">`방송대 QA`는 방송대인들을 위한 QA사이트입니다. 서비스 이용중 불편한 사항은 관리자 문의로 메일을 보내주세요 (☞ﾟヮﾟ)☞</span>
		</div>
  	</c:if>
</div>