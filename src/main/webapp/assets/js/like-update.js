const likeWrap = document.getElementById("likeWrap");
const likeStatus = document.getElementById("likeStatus");
const likeCheckInput =document.getElementById("likeCheckInput");


$(document).ready(function(){
    const account = likeCheckInput.dataset.account;
    const boardId = likeCheckInput.dataset.board;
    console.log(account);
    console.log(boardId);
    //계정 아이디를 보내 참 거짓 판별
    if(account === '0')
        return false;
    
        
    $.ajax({
        type : "POST",
        url :`/is-liked`,
        data:
        {
            "userId":account,
            "boardId":boardId
        },
        dataType :"json",
        async: false,     //값을 리턴시 해당코드를 추가하여 동기로 변경
        error : function()
        {
            alert('통신실패!!');
        },
        success : function(data)
        {   
            if(data)
            {
                likeStatus.innerHTML= 
                `
                <span class="btn-group-sm">
                    <button type="button" class="btn btn-primary bmd-btn-fab" onclick="likeCancel();">
                            <i class="material-icons">grade</i>
                    </button>
                </span>
                `
            }
            else
            {
                likeStatus.innerHTML= 
                `
                <span class="btn-group-sm">
                    <button type="button" class="btn btn-secondary bmd-btn-fab" onclick="likeUpdate();">
                            <i class="material-icons">grade</i>
                    </button>
                </span>
                `
            }
        }
    });
    
});


function likeCancel()
{
    console.log("좋아요 취소!!");
}


function likeUpdate()
{
    console.log("좋아요 구독!!");
    // $.ajax({
    //     type : "POST",
    //     url : "/users/nickname-check",
    //     data : {
    //         "nickname": nickname.value,
    //         "accountNickname":accountNickname.value
    //     },
    //     dataType :"json",
    //     async: false,     //값을 리턴시 해당코드를 추가하여 동기로 변경
    //     error : function()
    //     {
    //         alert('통신실패!!');
    //     },
    //     success : function(data)
    //     {   
    //         if(data)
    //         {
    //             nicknameSpan.innerHTML = "사용가능한 이름 입니다😊";
    //             nicknameSpan.style.color = "green";
    //             result = data;
    //         } 
    //         else
    //         {
    //             nicknameSpan.innerHTML = "사용중인 이름 입니다😢";
    //             nicknameSpan.style.color = "red";
    //             result = data;
    //         }
    //     }
    // });
}