function updateComment(val)
{
    console.log(`댓글 번호 [${val.id}]`);
    console.log(`댓글 내용 [${val.content}]`);
    console.log(`게시판 번호 [${val.id2}]`);

    const content = prompt('내용을 수정해 주세요', `${val.content}`);
    const id = val.id;
    const boardId = val.id2;

    console.log(content);

    if(content === null)
        return false;

    $.ajax({
        type : "PUT",
        url :`/comments/${id}`,
        contentType: "application/json; charset=utf-8;",
        data: JSON.stringify({
            "id":id,
            "boardId":boardId,
            "content":content
        })
        ,
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

