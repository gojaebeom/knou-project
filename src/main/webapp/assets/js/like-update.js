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
                    <button type="button" class="btn btn-primary bmd-btn-fab" onclick="likeUpdate();">
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


function likeUpdate()
{
	const account = likeCheckInput.dataset.account;
    const boardId = likeCheckInput.dataset.board;
    console.log(account);
    console.log(boardId);
    //계정 아이디를 보내 참 거짓 판별
    if(account === '0')
	{
		alert("로그인시 이용 가능한 서비스입니다!");
		return false;
	}
        
	
    $.ajax({
        type : "POST",
        url :`/like-status`,
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

            console.log(data);
            console.log(data.isLiked);
            if(data.isLiked == 1)
            {
                likeStatus.innerHTML= 
                `
                <span class="btn-group-sm">
                    <button type="button" class="btn btn-primary bmd-btn-fab" onclick="likeUpdate();">
                            <i class="material-icons">grade</i>
                    </button>
                </span>
                `;
                likeWrap.innerText=data.likeCnt;
            }
            else if(data.isLiked == 0)
            {
                likeStatus.innerHTML= 
                `
                <span class="btn-group-sm">
                    <button type="button" class="btn btn-secondary bmd-btn-fab" onclick="likeUpdate();">
                            <i class="material-icons">grade</i>
                    </button>
                </span>
                `;
                likeWrap.innerText=data.likeCnt;
            }
        }
    });
}