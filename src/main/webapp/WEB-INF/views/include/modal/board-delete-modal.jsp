<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Destroy Modal -->
<div class="modal fade" id="board-delete-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         	해당 게시물을 삭제시 관련된  댓글도 같이 삭제됩니다. 그래도 진행하시겠습니까?
      </div>
      <div class="modal-footer">
      	<form action="/boards/${BOARD.id}" method="post">
      		<input type="hidden" name="_method" value="delete" />
        	<button type="submit" class="btn btn-primary">네, 삭제하겠습니다!</button>
        </form>
      </div>
    </div>
  </div>
</div>