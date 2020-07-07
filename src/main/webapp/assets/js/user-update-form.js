const nickname = document.getElementById("nickname");
const nicknameSpan = document.getElementById("nicknameSpan");
const accountNickname = document.getElementById("accountNickname");

const deleteBtn = document.getElementById("deleteBtn");
const deleteInput = document.getElementById("deleteInput");


//닉네임 정규식
var nicknamePattern = /^[가-힣a-zA-Z]+$/;

function init()
{
    if(nickname.value == null)
        return false;

    console.log(nicknameCheck());

    if(!nicknameCheck())
        return false;
       
    return true;
}

nickname.onblur = () => nicknameCheck();

//닉네임 유효성 검사
function nicknameCheck()
{
    console.log(nickname.value.length);
    if(nicknamePattern.test(nickname.value))
    {
        if(nickname.value.length < 2 || nickname.value.length > 12)  
        {
            nicknameSpan.innerHTML = "단어는 두글자 이상 12글자 이하로 입력해주세요😢";
            nicknameSpan.style.color = "red";
            return false;
        }

        let result;

        $.ajax({
            type : "POST",
            url : "/users/nickname-check",
            data : {
                "nickname": nickname.value,
                "accountNickname":accountNickname.value
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
                    nicknameSpan.innerHTML = "사용가능한 이름 입니다😊";
                    nicknameSpan.style.color = "green";
                    result = data;
                } 
                else
                {
                    nicknameSpan.innerHTML = "사용중인 이름 입니다😢";
                    nicknameSpan.style.color = "red";
                    result = data;
                }
            }
        });

        return result;
    }else
    {
        nicknameSpan.innerHTML = "잘못된 입력입니다😢";
        nicknameSpan.style.color = "red";
        return false;
    }
}

//삭제 모달창 && 버튼 이벤트
deleteInput.onchange = () =>
{
    console.log(deleteInput.value);

    if(deleteInput.value === "회원 탈퇴")
    {
        deleteBtn.style.display = "block";
    }else
    {
        deleteBtn.style.display = "none";
    }
}