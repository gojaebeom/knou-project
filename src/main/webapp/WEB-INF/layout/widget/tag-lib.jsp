<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1 style="font-size:20px; font-weight:bold; margin-bottom:10px;">
	#TAGS
</h1>
<div class="row m-0 mb-4 " >		
	<div class="col p-1">
		<c:choose>
			<c:when test="${empty TAGLIST}">
				<p style="padding:20px;font-size:20px;">등록된 태그들이 없습니다.😥 </p>
			</c:when>
			<c:otherwise>	
				<c:forEach items="${TAGLIST}" var="t">			
					<a href="/tags/${t.tagName}" class="badge badge-primary m-1 mb-2" style="font-size:16px;">
						${t.tagName} 
						<span class="badge badge-light">${t.total }</span>
					</a>						
					</c:forEach>
				</c:otherwise>
		</c:choose>			
	</div>
</div>