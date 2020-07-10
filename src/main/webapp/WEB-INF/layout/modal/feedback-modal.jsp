<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Destroy Modal -->
<div class="modal fade" id="feedback-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">관리자 문의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         	사용시 불편한점이나 에러등을 발견하였다면 관련내용을 작성해주세요
      </div>
      <div class="modal-footer p-0">
      	<form class="p-3" action="#" method="post" style="width:100%;">
			<textarea rows="5" cols="" style="width:100%;border:1px solid #F2F2F2;border-radius:3px;background:#F2F2F2;"></textarea>
        	<button type="submit" class="btn btn-primary">문의하기</button>
        </form>
      </div>
    </div>
  </div>
</div>