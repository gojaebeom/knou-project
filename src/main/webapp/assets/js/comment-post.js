const commentContent = document.getElementById("commentContent");
const writerId = document.getElementById("writerId");
const boardId = document.getElementById("boardId");
const commentPostBtn = document.getElementById("commentPostBtn");
const commentWrap = document.getElementById("commentWrap");

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
            console.log("hello world");
            console.log(data)
            console.log(data[0].user);
            var html = ``;
            if(data)
            {
               for(let i = 0; i<data.length; i++)
               {
                html+=
                `
                <li class="list-group-item">
                    <div class="media">
                        <img class="mr-3" src="/assets/imgs/cover.jpg"
                            style="width:54px;height:54px;border-radius:5px;">
                        <div class="media-body">
                        <h5 class="mt-0"><a href="#">${data[i].user.nickname} • ${data[i].createdAt}</a></h5>
                        <br>
                            ${data[i].content}
                        </div>
                    </div>
                </li>
                `
               }
               commentWrap.innerHTML = html;
            } 
            else
            {
                
            }
        }
    });
}

