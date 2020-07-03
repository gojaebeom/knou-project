const commentContent = document.getElementById("commentContent");
const writerId = document.getElementById("writerId");
const boardId = document.getElementById("boardId");
const commentPostBtn = document.getElementById("commentPostBtn");

commentPostBtn.onclick = () =>
{
    console.log(`${commentContent.value}, ${writerId.value} , ${boardId.value}` );
    if(writerId.value === null || writerId.value.length === 0 || writerId === undefined)
    {
        alert("로그인 이후에 가능한 기능입니다!");
        return false;
    }
    
    if(commentContent.value === null || commentContent.value.length === 0 || commentContent === undefined)
    {
        alert("내용을 입력 후 눌러주세요!");
        
        return false;
    }
    $.ajax({
        type : "POST",
        url : "http://localhost:8080/comments",
        data : 
        {
            "content": commentContent.value,
            "writerId": writerId.value,
            "boardId": boardId.value,
        },
        dataType :"json",
        //async: false, //값을 리턴시 해당코드를 추가하여 동기로 변경
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
            if(data)
            {
               
            } 
            else
            {
                
            }
        }
    });
}

