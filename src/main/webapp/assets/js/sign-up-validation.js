//회원가입 유효성 검사
var email = document.getElementById("email");
var emailSpan = document.getElementById("emailSpan");

var password = document.getElementById("password");
var passwordSpan = document.getElementById("passwordSpan");

var nickname = document.getElementById("nickname");
var nicknameSpan = document.getElementById("nicknameSpan");

var submitBtn = document.getElementById("submitBtn");
var submitAlert = document.getElementById("submitAlert");

//이메일 정규식
var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//닉네임 정규식
var nicknamePattern = /^[가-힣]{2,12}|[a-zA-Z]{2,12}\s[a-zA-Z]{2,12}$/;
//비밀번호 정규식
var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;

email.onblur = () => emailCheck();
password.onblur = () => passwordCheck();
nickname.onblur = () => nicknameCheck();

function init()
{

    if(email.value == null)
        return false;
    if(password.value == null)
        return false;
    if(nickname.value == null)
        return false;

    console.log(nicknameCheck());
    console.log(emailCheck());
    console.log(passwordCheck());

    if(!nicknameCheck())
        return false;
    if(!emailCheck())
        return false;
    if(!passwordCheck())
        return false;

    disabled();
        
    return true;
}

function disabled()
{
    submitAlert.style.display="block";
    submitBtn.style.display="none";
}

//계정 유효성 검사
function emailCheck()
{
    if(emailPattern.test(email.value))
    {
        let result;
        $.ajax({
            type : "GET",
            url : "http://localhost:8080/email-check",
            data : {"email": email.value},
            dataType :"json",
            async: false,     //값을 리턴시 해당코드를 추가하여 동기로 변경
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
                if(data)
                {
                    emailSpan.innerHTML = "사용가능한 이메일 입니다!";
                    emailSpan.style.color = "green";
                    result = data;
                } 
                else
                {
                    emailSpan.innerHTML = "현재 사용중인 이메일 입니다!";
                    emailSpan.style.color = "red";
                    result = data;
                }
            }
        });

        return result;
    }else
    {
        emailSpan.innerHTML = "올바른 이메일 형식이 아닙니다!";
        emailSpan.style.color = "red";
        return false;
    }
}

//닉네임 유효성 검사
function nicknameCheck()
{
    
    if(nicknamePattern.test(nickname.value))
    {
        let result;

        $.ajax({
            type : "GET",
            url : "/nickname-check",
            data : {"nickname": nickname.value},
            dataType :"json",
            async: false,     //값을 리턴시 해당코드를 추가하여 동기로 변경
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
                if(data)
                {
                    nicknameSpan.innerHTML = "사용가능한 이름 입니다!";
                    nicknameSpan.style.color = "green";
                    result = data;
                } 
                else
                {
                    nicknameSpan.innerHTML = "사용중인 이름 입니다!";
                    nicknameSpan.style.color = "red";
                    result = data;
                }
            }
        });

        return result;

    }else if(nickname.value.length < 2 || nickname.value.length > 12)
    {
        nicknameSpan.innerHTML = "단어는 두글자 이상 12글자 이하로 입력해주세요!";
        nicknameSpan.style.color = "red";
        return false;
    }else
    {
        nicknameSpan.innerHTML = "잘못된 입력입니다!";
        nicknameSpan.style.color = "red";
        return false;
    }

}

//비밀번호 유효성 검사
function passwordCheck()
{
    if(passwordPattern.test(password.value))
    {
        passwordSpan.innerHTML = "정상적인 입력입니다!";
        passwordSpan.style.color = "green";
        return true;
    }else if(password.value.length < 8)
    {
        passwordSpan.innerHTML = "비밀번호는 최소 8글자 이상 입력해주세요!";
        passwordSpan.style.color = "red";
        return false;
    }else
    {
        passwordSpan.innerHTML = "잘못된 입력입니다!";
        passwordSpan.style.color = "red";
        return false;
    }
}



