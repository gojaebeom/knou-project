<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 게시판 관련 상태 위젯 -->
<div class="d-flex justify-content-start align-items-center p-2">
	<div id="likeStatus" class="mr-1" style="cursor:pointer;">
		<i 
			class="ri-heart-pulse-line" style="font-size:30px;color:#F78181;"
			onclick="likeUpdate();">
		</i>
	</div>
	<button 
	class="btn btn-secondary m-0 p-1 font-caveat" 
	data-toggle="tooltip" 
	data-placement="bottom" 
	title="하트 아이콘을 눌러  게시글을 추천할 수 있습니다   :-D" 
	style="font-size:20px;color:#0174DF;">
	<span  id="likeWrap" style="color:#FA8258;font-weight:bold;text-decoration:none;">${BOARD.likeCnt}</span> 
	Likes</button>

	<input id="likeCheckInput" type="hidden" data-account="${(!empty ACCOUNT)?ACCOUNT.id:0}" data-board="${BOARD.id}">
</div>
