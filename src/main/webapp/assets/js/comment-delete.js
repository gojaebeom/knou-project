function deleteComment(val)
{
    console.log(val.id);
    console.log(val.id2);

    const id = val.id;
    const result = confirm( '댓글을 삭제하시겠습니까?' );
    const boardId = val.id2;
    if(result === false)
        return false;

    $.ajax({
        type : "DELETE",
        url : `/comments/${id}`,
        contentType: "application/json; charset=utf-8;",
        data: JSON.stringify
        ({
            "id":id,
            "boardId":boardId
        }),
        dataType :"json",
        //async: false, //값을 리턴시 해당코드를 추가하여 동기로 변경
        error : function(){
            alert('통신실패!!');
        },
        success : function(data)
        {
            location.href=`/boards/${boardId}`;
        }
    });
}

