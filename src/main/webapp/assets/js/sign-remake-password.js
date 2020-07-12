const password = document.getElementById("password");
const rePassword = document.getElementById("re-password");

const passwordSpan = document.getElementById("passwordSpan");
const rePasswordSpan = document.getElementById("re-passwordSpan");

//비밀번호 정규식
const passwordPattern = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

function init()
{
    console.log(`init function come in`);

    if(!passwordCheck())
        return false;
    if(!rePasswordCheck())
        return false;

    return true;
}

password.onblur = () => passwordCheck();
rePassword.onblur = () => rePasswordCheck();

//비밀번호 유효성 검사
function passwordCheck()
{
    if(passwordPattern.test(password.value))
    {
        console.log(password.value);
        passwordSpan.innerHTML = "정상적인 입력입니다😊";
        passwordSpan.style.color = "green";
        return true;
    }else if(password.value.length < 8)
    {
        console.log(password.value);
        passwordSpan.innerHTML = "최소 8글자 이상, 특수문자1개 이상을 포함해주세요😢";
        passwordSpan.style.color = "red";
        return false;
    }else
    {
        console.log(password.value);
        passwordSpan.innerHTML = "잘못된 입력입니다😢";
        passwordSpan.style.color = "red";
        return false;
    }
}

function rePasswordCheck()
{
    if(rePassword.value === "" || rePassword.value === null || rePassword.value === undefined)
    {
        rePasswordSpan.innerHTML = "잘못된 입력입니다😢";
        rePasswordSpan.style.color = "red";
        return false;
    }
    else if(rePassword.value !== password.value)
    {
        rePasswordSpan.innerHTML = "비밀번호가 일치하지 않습니다😢";
        rePasswordSpan.style.color = "red";
        return false;
    }else
    {
        rePasswordSpan.innerHTML =  "비밀번호가 일치합니다😊";
        rePasswordSpan.style.color = "green";
        return true;
    }
}