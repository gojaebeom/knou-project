/**
 * 비밀번호 찾기 페이지 관련 js
 */

//email 
const email = document.getElementById("email");
//안내 문구 
const emailSpan = document.getElementById("emailSpan");
//이메일 정규식
const emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

const submitBtn = document.getElementById("submitBtn");
const submitAlert = document.getElementById("submitAlert");

/**
 * 이메일 input을 빠져나왔을때 실행되는 함수
 * @param {*} email 
 * @return result
 */
email.onblur = ()=> checkEmail();

function checkEmail()
{
    console.log(email.value);

    /**
     * 이메일 패턴 정규식을 만족할 경우 실행
     */
    if(emailPattern.test(email.value))
    {
        /**
         * result 변수를 먼저 만들어 ajax의 통신 결과를 값에 담는다.
         * 이번 경우는 존재하는 아이디가 있어야 비밀번호를 바꿀 수 있기 때문에
         * 회원가입과 반대로 처리한다.
         */
        let result;

        /**
         * email을 채크하는 api
         * 파라미터로 작성한 email 문자열을 보낸다.
         * 반환 값은 true/false 이다.
         */
        $.ajax({
            type : "POST",
            url : "email-check",
            data : {"email": email.value},
            dataType :"json",
            async: false, //값을 리턴시 해당코드를 추가하여 동기로 변경
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
                if(data)
                {
                    /**
                     * 받은 값이 true라면 아이디가 존재하지 않는 것
                     * result에 false를 담는다.
                     */
                    emailSpan.innerHTML = "해당 이메일이 존재하지 않습니다😥";
                    emailSpan.style.color = "red";
                    
                    result = false;
                } 
                else
                {
                    /**
                     * 받은 값이 false라면 아이디가 존재하는 것
                     * result에 true를 담는다.
                     */
                    emailSpan.innerHTML = "존재하는 이메일 입니다😊";
                    emailSpan.style.color = "green";
                    result = true;
                }
            }
        });

        /**
         * result 값을 반환한다.
         * 나중에 form의 submit 버튼 클릭시 
         * init함수의 조건을 만족할때만 submit 하게 할텐데 
         * 그때 사용될 값이다.
         */
        console.log(`${result} 반환!`);
        return result;
    }else
    {
        /**
         * 이메일 정규식을 만족하지 못하면
         * 사전에 안내를 주고 이벤트를 종료시킨다.
         */
        emailSpan.innerHTML = "올바른 이메일 형식이 아닙니다😢";
        emailSpan.style.color = "red";
        return false;
    }
}

function disabled()
{
    submitAlert.style.display="block";
    submitBtn.style.display="none";
}


/**
 * 서브밋 버튼 클릭시 실행되는 함수
 * 조건을 만족하지 못하면 false를 반환하고 
 * 서브밋되지 않는다.
 */
function init()
{
   console.log(`init function come in`);

   console.log(checkEmail());
   
   if(!checkEmail())
        return false;

    
    disabled();

   return true;
}